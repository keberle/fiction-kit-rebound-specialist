#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Compiles episode scene files into EPUB and PDF-optimized markdown formats, then generates EPUB.

.DESCRIPTION
    This script reads all scene files from an episode directory, compiles them into two formats:
    - EPUB version: minimalist format without title page
    - PDF version: includes title page with cover art
    
    Both formats strip scene headers and use simple numbered headers (## 1, ## 2, etc.).
    The script also copies cover art and generates the final EPUB using pandoc.

.PARAMETER EpisodeNumber
    The episode number to compile (e.g., 1, 2, 3)

.EXAMPLE
    .\compile-episode.ps1 -EpisodeNumber 1
    .\compile-episode.ps1 1
#>

param(
    [Parameter(Mandatory=$true, Position=0)]
    [int]$EpisodeNumber
)

# Format episode number with leading zero
$episodeNumFormatted = $EpisodeNumber.ToString("00")

# Find the episode directory
$episodeDirs = Get-ChildItem -Path "content\episodes" -Directory -Filter "episode-$episodeNumFormatted-*"

if ($episodeDirs.Count -eq 0) {
    Write-Error "Could not find episode directory for episode $episodeNumFormatted"
    exit 1
}

if ($episodeDirs.Count -gt 1) {
    Write-Error "Found multiple episode directories for episode $episodeNumFormatted"
    exit 1
}

$episodeDir = $episodeDirs[0]
$episodePath = $episodeDir.FullName
$episodeName = $episodeDir.Name

Write-Host "Compiling episode from: $episodeName" -ForegroundColor Cyan

# Read the outline to get episode title
$outlineFile = "elements\outlines\episode-$episodeNumFormatted.md"
if (-not (Test-Path $outlineFile)) {
    Write-Error "Could not find outline file: $outlineFile"
    exit 1
}

$outlineContent = Get-Content $outlineFile -Raw
$titleMatch = $outlineContent | Select-String -Pattern '\*\*Title:\*\*\s+(.+)'
if (-not $titleMatch) {
    Write-Error "Could not extract episode title from outline"
    exit 1
}
$episodeTitle = $titleMatch.Matches.Groups[1].Value.Trim()

Write-Host "Episode title: $episodeTitle" -ForegroundColor Green

# Get all scene files
$sceneFiles = Get-ChildItem -Path $episodePath -Filter "*.md" | Sort-Object Name

if ($sceneFiles.Count -eq 0) {
    Write-Error "No scene files found in $episodePath"
    exit 1
}

Write-Host "Found $($sceneFiles.Count) scene files" -ForegroundColor Green

# Create output directory if it doesn't exist
$outputDir = "output"
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
    Write-Host "Created output directory" -ForegroundColor Green
}

# Function to process scene content
function Process-SceneContent {
    param([string]$content)
    
    # Strip the scene header (e.g., "## Scene 1 — Scene Name")
    $content = $content -replace '(?m)^##\s+Scene\s+\d+\s+—[^\r\n]*[\r\n]+', ''
    
    # Trim whitespace
    return $content.Trim()
}

# Build EPUB version (minimalist, no title page)
Write-Host "`nBuilding EPUB version..." -ForegroundColor Cyan
$epubOutput = @()
$sceneNum = 1

foreach ($file in $sceneFiles) {
    Write-Host "  Processing scene $sceneNum`: $($file.Name)" -ForegroundColor Gray
    
    # Add scene number header
    $epubOutput += "## $sceneNum"
    $epubOutput += ""
    
    # Read and process scene content
    $content = Get-Content $file.FullName -Raw
    $processedContent = Process-SceneContent -content $content
    $epubOutput += $processedContent
    
    # Add page break after scene (except last scene)
    if ($sceneNum -lt $sceneFiles.Count) {
        $epubOutput += ""
        $epubOutput += ""
        $epubOutput += '<div class="page"/>'
        $epubOutput += ""
    }
    
    $sceneNum++
}

# Write EPUB markdown file
$epubFile = Join-Path $outputDir "TheReboundSpecialist-Episode$episodeNumFormatted-epub.md"
$epubOutput -join "`n" | Set-Content -Path $epubFile -NoNewline
Write-Host "Created: $epubFile" -ForegroundColor Green

# Build PDF version (with title page and cover art)
Write-Host "`nBuilding PDF version..." -ForegroundColor Cyan
$pdfOutput = @()

# Add title page
$pdfOutput += "---"
$pdfOutput += "title: The Rebound Specialist"
$pdfOutput += "subtitle: Episode $episodeNumFormatted - $episodeTitle"
$pdfOutput += "---"
$pdfOutput += ""
$pdfOutput += "![Cover Art](coverart.jpg)"
$pdfOutput += ""
$pdfOutput += '\newpage'
$pdfOutput += ""

# Add scenes
$sceneNum = 1
foreach ($file in $sceneFiles) {
    Write-Host "  Processing scene $sceneNum`: $($file.Name)" -ForegroundColor Gray
    
    # Add scene number header
    $pdfOutput += "## $sceneNum"
    $pdfOutput += ""
    
    # Read and process scene content
    $content = Get-Content $file.FullName -Raw
    $processedContent = Process-SceneContent -content $content
    $pdfOutput += $processedContent
    
    # Add page break after scene (except last scene)
    if ($sceneNum -lt $sceneFiles.Count) {
        $pdfOutput += ""
        $pdfOutput += ""
        $pdfOutput += '\newpage'
        $pdfOutput += ""
    }
    
    $sceneNum++
}

# Write PDF markdown file
$pdfFile = Join-Path $outputDir "TheReboundSpecialist-Episode$episodeNumFormatted-pdf.md"
$pdfOutput -join "`n" | Set-Content -Path $pdfFile -NoNewline
Write-Host "Created: $pdfFile" -ForegroundColor Green

# Calculate word count (from EPUB version, excluding headers and page breaks)
$wordCount = ($epubOutput | Where-Object { $_ -notmatch '^##\s+\d+$' -and $_ -notmatch '<div class="page"/>' } | Out-String | Measure-Object -Word).Words
Write-Host "`nTotal word count: $wordCount words" -ForegroundColor Green

# Copy cover art to output directory
$sourceCover = "content\coverart.jpg"
$destCover = Join-Path $outputDir "coverart.jpg"

if (Test-Path $sourceCover) {
    Copy-Item -Path $sourceCover -Destination $destCover -Force
    Write-Host "Copied cover art to output directory" -ForegroundColor Green
} else {
    Write-Warning "Cover art not found at $sourceCover"
}

# Generate EPUB using pandoc
Write-Host "`nGenerating EPUB..." -ForegroundColor Cyan

# Check if pandoc is installed
$pandocPath = Get-Command pandoc -ErrorAction SilentlyContinue

if (-not $pandocPath) {
    Write-Warning "Pandoc is not installed or not in PATH"
    Write-Host "`nTo install pandoc:" -ForegroundColor Yellow
    Write-Host "  Windows: choco install pandoc" -ForegroundColor Yellow
    Write-Host "  Or download from: https://pandoc.org/installing.html" -ForegroundColor Yellow
    Write-Host "`nSkipping EPUB generation" -ForegroundColor Yellow
} else {
    # Change to output directory (so pandoc can find coverart.jpg)
    Push-Location $outputDir
    
    try {
        $epubFileName = "TheReboundSpecialist-Episode$episodeNumFormatted.epub"
        $markdownFileName = "TheReboundSpecialist-Episode$episodeNumFormatted-epub.md"
        
        $pandocArgs = @(
            $markdownFileName,
            "-o", $epubFileName,
            "--css=../epub-dark-mode.css",
            "--epub-cover-image=coverart.jpg",
            "--metadata", "title=The Rebound Specialist: Episode $episodeNumFormatted - $episodeTitle"
        )
        
        Write-Host "Running: pandoc $($pandocArgs -join ' ')" -ForegroundColor Gray
        
        & pandoc @pandocArgs
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Created: output\$epubFileName" -ForegroundColor Green
        } else {
            Write-Error "Pandoc failed with exit code $LASTEXITCODE"
        }
    }
    finally {
        Pop-Location
    }
}

# Generate PDF using pandoc
Write-Host "`nGenerating PDF (6x9 inch book format)..." -ForegroundColor Cyan

if (-not $pandocPath) {
    Write-Warning "Pandoc is not installed - skipping PDF generation"
} else {
    # Change to output directory (so pandoc can find coverart.jpg)
    Push-Location $outputDir
    
    try {
        $pdfFileName = "TheReboundSpecialist-Episode$episodeNumFormatted.pdf"
        $pdfMarkdownFileName = "TheReboundSpecialist-Episode$episodeNumFormatted-pdf.md"
        
        # Convert to PDF with 6x9 inch page size
        # Using geometry package for custom page dimensions
        $pdfPandocArgs = @(
            $pdfMarkdownFileName,
            "-o", $pdfFileName,
            "--pdf-engine=xelatex",
            "-V", "geometry:paperwidth=6in",
            "-V", "geometry:paperheight=9in",
            "-V", "geometry:margin=0.75in",
            "-V", "fontsize=11pt",
            "-V", "linestretch=1.15",
            "-V", "parskip=0.75em",
            "--metadata", "title=The Rebound Specialist: Episode $episodeNumFormatted - $episodeTitle"
        )
        
        Write-Host "Running: pandoc $($pdfPandocArgs -join ' ')" -ForegroundColor Gray
        
        & pandoc @pdfPandocArgs 2>&1 | Out-Null
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Created: output\$pdfFileName" -ForegroundColor Green
        } else {
            Write-Warning "PDF generation failed (exit code $LASTEXITCODE)"
            Write-Host "This usually means LaTeX is not installed. PDF generation requires:" -ForegroundColor Yellow
            Write-Host "  - MiKTeX (Windows): https://miktex.org/download" -ForegroundColor Yellow
            Write-Host "  - TeX Live (Linux/Mac): https://www.tug.org/texlive/" -ForegroundColor Yellow
            Write-Host "`nAlternatively, you can:" -ForegroundColor Yellow
            Write-Host "  1. Open $pdfMarkdownFileName in VS Code" -ForegroundColor Yellow
            Write-Host "  2. Right-click and select 'Markdown PDF: Export (pdf)'" -ForegroundColor Yellow
        }
        
        # Generate Dark Mode PDF
        Write-Host "`nGenerating Dark Mode PDF (6x9 inch book format)..." -ForegroundColor Cyan
        
        $pdfDarkFileName = "TheReboundSpecialist-Episode$episodeNumFormatted-darkmode.pdf"
        
        # Dark mode uses pagecolor for background, color for text
        $pdfDarkPandocArgs = @(
            $pdfMarkdownFileName,
            "-o", $pdfDarkFileName,
            "--pdf-engine=xelatex",
            "-V", "geometry:paperwidth=6in",
            "-V", "geometry:paperheight=9in",
            "-V", "geometry:margin=0.75in",
            "-V", "fontsize=11pt",
            "-V", "linestretch=1.15",
            "-V", "colorlinks=true",
            "-V", "linkcolor=6db3f2",
            "-V", "urlcolor=6db3f2",
            "--include-in-header=../pdf-dark-mode.tex",
            "--metadata", "title=The Rebound Specialist: Episode $episodeNumFormatted - $episodeTitle"
        )
        
        Write-Host "Running: pandoc $($pdfDarkPandocArgs -join ' ')" -ForegroundColor Gray
        
        & pandoc @pdfDarkPandocArgs 2>&1 | Out-Null
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Created: output\$pdfDarkFileName" -ForegroundColor Green
        } else {
            Write-Warning "Dark Mode PDF generation failed (exit code $LASTEXITCODE)"
        }
    }
    finally {
        Pop-Location
    }
}

# Summary
Write-Host "`n" + ("=" * 60) -ForegroundColor Cyan
Write-Host "COMPILATION COMPLETE" -ForegroundColor Cyan
Write-Host ("=" * 60) -ForegroundColor Cyan
Write-Host "Episode $episodeNumFormatted`: $episodeTitle" -ForegroundColor White
Write-Host "Scenes: $($sceneFiles.Count)" -ForegroundColor White
Write-Host "Words: $wordCount" -ForegroundColor White
Write-Host "`nOutput files:" -ForegroundColor White
Write-Host "  → $epubFile (for EPUB source)" -ForegroundColor Green
Write-Host "  → $pdfFile (for PDF source)" -ForegroundColor Green

if ($pandocPath -and $LASTEXITCODE -eq 0) {
    Write-Host "  → output\TheReboundSpecialist-Episode$episodeNumFormatted.epub" -ForegroundColor Green
    Write-Host "  → output\TheReboundSpecialist-Episode$episodeNumFormatted.pdf (6x9 book format)" -ForegroundColor Green
    Write-Host "  → output\TheReboundSpecialist-Episode$episodeNumFormatted-darkmode.pdf (dark mode)" -ForegroundColor Green
}

Write-Host ("=" * 60) -ForegroundColor Cyan
