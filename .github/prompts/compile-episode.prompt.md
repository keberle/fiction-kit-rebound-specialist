````prompt
# Compile Episode Prompt

## Purpose
Compile all individual scene files from an episode directory into a single markdown file optimized for PDF conversion using the Markdown PDF extension (yzane.markdown-pdf). The compiled markdown file will be ready to convert to a professional-looking PDF with proper formatting, page breaks, and typography.

## Instructions

When the user requests to compile an episode:

1. **Identify the episode directory**
   - Example: `content/episodes/episode-01-the-receptionist/`

2. **Read all scene files in sequence**
   - Scene files are numbered: `01-scene-name.md`, `02-scene-name.md`, etc.
   - Read them in numerical order

3. **Gather episode metadata**
   - Read the corresponding outline file: `elements/outlines/episode-##.md`
   - Extract: episode number, title, theme, hook/cold open, and cliffhanger/end-button

4. **Create the compiled output file**
   - Target location: `output/TheReboundSpecialist-EpisodeXX.md` (where XX is zero-padded episode number)
   - If `output/` directory doesn't exist, create it
   - Filename example: `output/TheReboundSpecialist-Episode01.md`

5. **Compile the content - Scene Content Only:**
   
   **Note:** Do not include any title page or episode heading in the markdown. The EPUB cover art and title are handled separately by `--epub-cover-image` and `--metadata title`.
   
   **CRITICAL:** Each scene should have EXACTLY ONE header - just the number (e.g., "## 1", "## 2"). The source scene files contain headers like "## Scene 2 — Scene Name" which MUST be stripped out completely. Only add the simple number header.
   
   **PowerShell command to compile (reference implementation):**
   ```powershell
   $episodePath = "content\episodes\episode-##-name"
   $outputFile = "output\TheReboundSpecialist-Episode##.md"
   $sceneFiles = Get-ChildItem -Path $episodePath -Filter "*.md" | Sort-Object Name
   $output = @()
   $sceneNum = 1
   foreach ($file in $sceneFiles) {
       $output += "## $sceneNum"
       $content = Get-Content $file.FullName -Raw
       $content = $content -replace '^##\s+Scene\s+\d+\s+—[^\r\n]*[\r\n]+', ''
       $output += $content.Trim()
       if ($sceneNum -lt $sceneFiles.Count) {
           $output += "`n`n<div class=`"page`"/>`n"
       }
       $sceneNum++
   }
   $output -join "`n`n" | Set-Content -Path $outputFile -NoNewline
   ```
   
   - For each scene:
     - Add scene number header: `## #` (just the number, e.g., "## 1", "## 2", NOT "Scene 1")
     - **STRIP the source file's header** (regex: `^##\s+Scene\s+\d+\s+—[^\r\n]*[\r\n]+`)
     - Do NOT include the word "Scene" or the scene name/title from the source file
     - Start prose content immediately after the scene number header
     - Add `<div class="page"/>` after each scene's content (except the last scene)
     - This ensures each scene starts on a new page in the PDF
   
   - Preserve all formatting:
     - Paragraph breaks
     - Dialogue formatting
     - Italics, bold, emphasis
     - All line breaks and white space
   
   **C. Final Scene Handling:**
   - Last scene should NOT have a page break after it
   - Episode ends with the final line of prose

6. **Calculate word count**
   - Count all words in scene prose (exclude headings and page break tags)
   - Use this for validation and reporting

7. **Validate the compilation**
   - Verify all scene files were read in correct numerical order
   - Confirm all scene content is present
   - Verify page breaks are placed correctly (between scenes, not after last scene)
   - Verify scene number headers are present (e.g., "## 1", "## 2", NOT "## Scene 1")
   - Report any missing scenes or issues

8. **Generate the PDF**
   - After creating the markdown file, automatically invoke the PDF conversion
   - Use VS Code command: `markdown-pdf.pdf` on the compiled markdown file
   - PDF will be created with same name: `output/TheReboundSpecialist-EpisodeXX.pdf`
   - If conversion fails, provide instructions for manual conversion

9. **Copy cover art to output directory**
   - Copy `content/coverart.jpg` to `output/coverart.jpg`
   - This ensures the cover art is available for EPUB generation
   - The markdown file references `coverart.jpg` (not `../content/coverart.jpg`)

10. **Generate the EPUB with dark mode support**
   - Change to output directory and run pandoc from there (so it can find coverart.jpg)
   - Command: `Set-Location "output"; pandoc "TheReboundSpecialist-EpisodeXX.md" -o "TheReboundSpecialist-EpisodeXX.epub" --css="../epub-dark-mode.css" --epub-cover-image="coverart.jpg" --metadata title="The Rebound Specialist: Episode XX - [Title]"; Set-Location ".."`
   - The CSS file `epub-dark-mode.css` uses `prefers-color-scheme` media queries for proper dark mode support
   - EPUB will be created with same name: `output/TheReboundSpecialist-EpisodeXX.epub`
   - Cover art will be embedded as proper EPUB cover using `--epub-cover-image`
   - No author metadata (keeps EPUB clean)
   - No table of contents (single episode doesn't need TOC)
   - If pandoc is not installed, provide installation instructions

11. **Report completion**
   - Confirm markdown file created: `output/TheReboundSpecialist-EpisodeXX.md`
   - Confirm PDF file created (or provide manual instructions): `output/TheReboundSpecialist-EpisodeXX.pdf`
   - Confirm EPUB file created: `output/TheReboundSpecialist-EpisodeXX.epub`
   - Report total word count and scene count
   - Note any warnings or issues

## PDF Conversion Details

The Markdown PDF extension will handle the conversion using these optimizations:

- **Page breaks:** `<div class="page"/>` creates new pages
- **Typography:** Clean, readable font for prose fiction
- **Margins:** Default margins work well for reading
- **Headers/Footers:** Can be configured in VS Code settings if desired
- **Format:** Default A4 or Letter size (configurable)

**Manual PDF conversion (if automated step fails):**
1. Open the compiled markdown file in VS Code
2. Right-click in the editor
3. Select "Markdown PDF: Export (pdf)"
4. PDF will be generated in the same directory

## EPUB Generation Details

EPUB files are generated using pandoc with the following features:

- **Dark mode support:** Uses `epub-dark-mode.css` with `prefers-color-scheme` media queries
- **Light mode:** Black text on white background (#000000 on #ffffff)
- **Dark mode:** Light text on dark background (#e0e0e0 on #1a1a1a)
- **Metadata:** Title only (no author field for clean presentation)
- **No table of contents:** Single episodes don't need a TOC
- **Cover art:** Embedded as proper EPUB cover using `--epub-cover-image`

**The dark mode CSS uses:**
- `color-scheme: light dark` to signal both modes are supported
- `@media (prefers-color-scheme: dark)` for dark mode styles
- `@media (prefers-color-scheme: light)` for light mode styles
- Proper contrast ratios for readability in both modes

**Pandoc installation:**
- Windows: Download from https://pandoc.org/installing.html or `choco install pandoc`
- Mac: `brew install pandoc`
- Linux: `sudo apt-get install pandoc` or equivalent

**Manual EPUB generation (if automated step fails):**
Run this command from the repository root:
```powershell
Set-Location "output"
pandoc "TheReboundSpecialist-EpisodeXX.md" -o "TheReboundSpecialist-EpisodeXX.epub" --css="../epub-dark-mode.css" --epub-cover-image="coverart.jpg" --metadata title="The Rebound Specialist: Episode XX - [Title]"
Set-Location ".."
```

**Important:** 
- Pandoc must be run from the `output/` directory so it can find `coverart.jpg`
- Use `--epub-cover-image` to embed cover as proper EPUB cover page
- No author metadata (keeps EPUB clean and simple)
- No `--toc` flag for single episode files (no need for table of contents)

## Example Usage

**User:** "Compile episode 1"

**System actions:**
1. Reads `elements/outlines/episode-01.md` for episode title
2. Reads all scene files from `content/episodes/episode-01-the-receptionist/` in numerical order
3. Creates `output/TheReboundSpecialist-Episode01.md` with scene number headers (e.g., "## 1", "## 2") and page breaks
4. Copies `content/coverart.jpg` to `output/coverart.jpg`
5. Invokes PDF conversion to create `output/TheReboundSpecialist-Episode01.pdf` (or provides manual instructions)
6. Invokes pandoc to create `output/TheReboundSpecialist-Episode01.epub` with dark mode CSS
7. Reports: "✓ Episode 1 compiled: 9 scenes, 7,550 words\n  → output/TheReboundSpecialist-Episode01.md\n  → output/TheReboundSpecialist-Episode01.pdf\n  → output/TheReboundSpecialist-Episode01.epub"

## Notes

- **Source of truth:** Individual scene files in `content/episodes/episode-##-name/` remain the source of truth
- **Compiled files:** Output files in `output/` are generated artifact.md, .pdf, and .epub files
- **Version control:** All compiled files (.md, .pdf, .epub) can be committed to track episode versions
- **PDF styling:** For custom styling, create a CSS file and reference it in VS Code settings under `markdown-pdf.styles`
- **EPUB dark mode:** The `epub-dark-mode.css` file must be in the repository root for pandoc to find it
- **Cover art:** Must be copied to `output/` directory so EPUB can embed it correctly
- **Version control:** Both .md and .pdf compiled files can be committed to track episode versions
- **PDF styling:** For custom styling, create a CSS file and reference it in VS Code settings under `markdown-pdf.styles`

## Troubleshooting

**If PDF generation fails:**
- Ensure Markdown PDF extension (yzane.markdown-pdf) is installed
- Check that Chromium download completed (extension requires it)
- Try manual conversion via right-click menu

**If EPUB generation fails:**
- Ensure pandoc is installed: `pandoc --version`
- Install pandoc if missing (see EPUB Generation Details section)
- Check that `epub-dark-mode.css` exists in repository root
- Verify `output/coverart.jpg` exists
- Run the manual pandoc command from the troubleshooting section
- Check for pandoc error messages in terminal output

**If cover art is missing from EPUB:**
- Verify `content/coverart.jpg` exists
- Ensure `output/coverart.jpg` was copied successfully
- Check that markdown references `coverart.jpg` not `../content/coverart.jpg`
- Pandoc looks for images relative to the markdown file location

**If dark mode text is unreadable:**
- Verify `epub-dark-mode.css` uses `prefers-color-scheme` media queries
- Check that light text colors (#e0e0e0) are specified for dark mode
- Ensure `color-scheme: light dark` is declared in `:root`
- Test EPUB in different readers (Apple Books, Calibre, etc.)
- Check VS Code Output panel (Markdown PDF) for error messages
- Verify the markdown file was created successfully first

**If page breaks don't appear:**
- Ensure `<div class="page"/>` tags are on their own lines
- Check that `markdown-pdf.printBackground` is set to `true` in settings
- Verify no extra spaces or characters in the page break tags

## Advanced PDF Configuration (Optional)

Users can customize PDF output by adding these settings to VS Code `settings.json`:

```json
{
  "markdown-pdf.displayHeaderFooter": true,
  "markdown-pdf.headerTemplate": "<div style=\"font-size: 9px; margin-left: 1cm;\"><span class='title'></span></div><div style=\"font-size: 9px; margin-left: auto; margin-right: 1cm;\">%%ISO-DATE%%</div>",
  "markdown-pdf.footerTemplate": "<div style=\"font-size: 9px; margin: 0 auto;\"><span class='pageNumber'></span> / <span class='totalPages'></span></div>",
  "markdown-pdf.format": "Letter",
  "markdown-pdf.margin.top": "1.5cm",
  "markdown-pdf.margin.bottom": "1.5cm",
  "markdown-pdf.margin.right": "1.5cm",
  "markdown-pdf.margin.left": "1.5cm",
  "markdown-pdf.printBackground": true
}
```

````
