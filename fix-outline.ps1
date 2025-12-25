# PowerShell script to fix Episode 2 outline by removing duplicate scenes

$inputFile = "c:\Users\kylee\stories\repos\fiction-kit-rebound-specialist\elements\outlines\episode-02.md"
$outputFile = "c:\Users\kylee\stories\repos\fiction-kit-rebound-specialist\elements\outlines\episode-02-fixed.md"

# Read all lines
$lines = Get-Content $inputFile

# Initialize output
$output = @()
$skipMode = $false
$skipUntilLine = 0

for ($i = 0; $i < $lines.Count; $i++) {
    $line = $lines[$i]
    
    # Check if we're at the start of a section to skip
    # Skip lines 263-331 (Scene 11 wrong content, Scene 10 duplicate, Scene 11 duplicate)
    if ($i -eq 262) {  # Line 263 in 1-indexed
        $skipMode = $true
        $skipUntilLine = 331  # Skip until after Scene 12 header
        continue
    }
    
    # Check if we should stop skipping
    if ($skipMode -and $i -ge $skipUntilLine) {
        $skipMode = $false
    }
    
    # Skip if in skip mode
    if ($skipMode) {
        continue
    }
    
    # Add line to output
    $output += $line
}

# Write output
$output | Set-Content $outputFile

Write-Host "Fixed outline written to $outputFile"
Write-Host "Please review and if correct, replace the original file"
