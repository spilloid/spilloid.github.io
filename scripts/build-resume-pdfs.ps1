<#
.SYNOPSIS
Builds the two resume PDFs from resume.html with headless Chrome.

.DESCRIPTION
  docs/Joseph_Spillers_Resume.pdf           page 1 only: the complete one-page resume
  docs/Joseph_Spillers_Resume_Extended.pdf  pages 1 and 2: plus extended experience and projects

resume.html marks page 2 with `.page-two` and hides it when opened with `#one`.
Fails if the one-page PDF is not exactly one page or the extended one is not exactly two,
so an edit that overflows a page is caught here, not by a recruiter.

Uses a throwaway Chrome profile: without one, headless Chrome hands the job to an already
running Chrome and prints nothing.
#>
$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$chrome = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
$profileDir = Join-Path ([IO.Path]::GetTempPath()) "resume-pdf-chrome-$PID"
$source = 'file:///' + ((Join-Path $root 'resume.html') -replace '\\', '/')

function Print([string]$url, [string]$out) {
    if (Test-Path $out) { Remove-Item $out }
    # Start-Process, not &: Chrome reports progress on stderr, which Windows PowerShell treats
    # as an error under ErrorActionPreference Stop.
    $chromeArgs = @('--headless=new', '--disable-gpu', '--no-pdf-header-footer',
        "--user-data-dir=`"$profileDir`"", "--print-to-pdf=`"$out`"", "`"$url`"")
    Start-Process -FilePath $chrome -ArgumentList $chromeArgs -Wait -WindowStyle Hidden
    if (-not (Test-Path $out)) { throw "Chrome did not write $out" }
}

function PageCount([string]$pdf) {
    $text = [IO.File]::ReadAllText($pdf, [Text.Encoding]::GetEncoding('ISO-8859-1'))
    [int](([regex]::Matches($text, '/Type\s*/Pages\b[^>]*?/Count\s+(\d+)') | Select-Object -First 1).Groups[1].Value)
}

$one = Join-Path $root 'docs\Joseph_Spillers_Resume.pdf'
$two = Join-Path $root 'docs\Joseph_Spillers_Resume_Extended.pdf'
try {
    Print "$source#one" $one
    Print $source $two
} finally {
    $tempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath()).TrimEnd('\') + '\'
    $resolvedProfile = [IO.Path]::GetFullPath($profileDir)
    if (-not $resolvedProfile.StartsWith($tempRoot, [StringComparison]::OrdinalIgnoreCase) -or
        $resolvedProfile -eq $tempRoot.TrimEnd('\')) {
        throw "Refusing to remove a browser profile outside the temporary directory: $resolvedProfile"
    }
    Remove-Item -Recurse -Force $profileDir -ErrorAction SilentlyContinue
}

$p1 = PageCount $one
$p2 = PageCount $two
"Joseph_Spillers_Resume.pdf: $p1 page(s)"
"Joseph_Spillers_Resume_Extended.pdf: $p2 page(s)"
if ($p1 -ne 1) { throw "The one-page resume is $p1 pages: page 1 of resume.html overflows." }
if ($p2 -ne 2) { throw "The extended resume is $p2 pages: page 2 of resume.html overflows." }
