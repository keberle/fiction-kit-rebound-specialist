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

4. **Create TWO compiled output files**
   - Target location: `output/` directory (create if it doesn't exist)
   - **EPUB version:** `output/TheReboundSpecialist-EpisodeXX-epub.md` - minimalist, no title/cover in markdown
   - **PDF version:** `output/TheReboundSpecialist-EpisodeXX-pdf.md` - includes title page and cover art
   - Where XX is zero-padded episode number (e.g., 01, 02, 03)
   - Examples: `output/TheReboundSpecialist-Episode01-epub.md`, `output/TheReboundSpecialist-Episode01-pdf.md`

5. **Compile the EPUB version (minimalist):**
   
   **Note:** Do not include any title page or episode heading in the markdown. The EPUB cover art and title are handled separately by `--epub-cover-image` and `--metadata title`.
   
   **CRITICAL:** Each scene should have EXACTLY ONE header - just the number (e.g., "## 1", "## 2"). The source scene files contain headers like "## Scene 2 — Scene Name" which MUST be stripped out completely. Only add the simple number header.
   
   **PowerShell command to compile EPUB version (reference implementation):**
   ```powershell
   $episodePath = "content\episodes\episode-##-name"
   $outputFile = "output\TheReboundSpecialist-Episode##-epub.md"
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
     - This ensures each scene starts on a new page
   
   - Preserve all formatting:
     - Paragraph breaks
     - Dialogue formatting
     - Italics, bold, emphasis
     - All line breaks and white space
   
   **Final Scene Handling:**
   - Last scene should NOT have a page break after it
   - Episode ends with the final line of prose

6. **Compile the PDF version (with title page and cover):**
   
   **CRITICAL:** PDF version includes a title page with cover art for professional PDF export.
   
   **PowerShell command to compile PDF version (reference implementation):**
   ```powershell
   $episodePath = "content\episodes\episode-##-name"
   $outputFile = "output\TheReboundSpecialist-Episode##-pdf.md"
   $episodeOutline = Get-Content "elements\outlines\episode-##.md" -Raw
   $episodeTitle = ($episodeOutline | Select-String -Pattern 'Episode \d+: (.+)').Matches.Groups[1].Value
   
   # Build title page
   $output = @()
   $output += "# The Rebound Specialist"
   $output += ""
   $output += "## Episode ##: $episodeTitle"
   $output += ""
   $output += "![Cover Art](coverart.jpg)"
   $output += ""
   $output += "<div class=`"page`"/>"
   $output += ""
   
   # Add scenes
   $sceneFiles = Get-ChildItem -Path $episodePath -Filter "*.md" | Sort-Object Name
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
   
   **Title page structure:**
   - Series title (H1): `# The Rebound Specialist`
   - Episode title (H2): `## Episode ##: [Title from outline]`
   - Cover art: `![Cover Art](coverart.jpg)` - embedded image
   - Page break after title page: `<div class="page"/>`
   
   **Scene content (same as EPUB version):**
   - For each scene:
     - Add scene number header: `## #` (just the number)
     - **STRIP the source file's header** (regex: `^##\s+Scene\s+\d+\s+—[^\r\n]*[\r\n]+`)
     - Start prose content immediately after the scene number header
     - Add `<div class="page"/>` after each scene's content (except the last scene)
   
   - Preserve all formatting as in EPUB version
   
   **Final Scene Handling:**
   - Last scene should NOT have a page break after it
   - Episode ends with the final line of prose

7. **Calculate word count**
   - Count all words in scene prose (exclude headings, page break tags, and title page elements)
   - Use this for validation and reporting

8. **Validate both compilations**
   - Verify all scene files were read in correct numerical order
   - Confirm all scene content is present in both versions
   - Verify page breaks are placed correctly (between scenes, not after last scene)
   - Verify scene number headers are present (e.g., "## 1", "## 2", NOT "## Scene 1")
   - **PDF version only:** Verify title page is present with cover art reference
   - Report any missing scenes or issues

9. **Generate the PDF (from PDF version)**
   - Use the PDF-optimized markdown file: `output/TheReboundSpecialist-EpisodeXX-pdf.md`
   - Automatically invoke the PDF conversion
   - Use VS Code command: `markdown-pdf.pdf` on the PDF markdown file
   - PDF will be created: `output/TheReboundSpecialist-EpisodeXX-pdf.pdf`
   - If conversion fails, provide instructions for manual conversion

10. **Copy cover art to output directory**
   - Copy `content/coverart.jpg` to `output/coverart.jpg`
   - This ensures the cover art is available for both PDF and EPUB generation
   - Both markdown files reference `coverart.jpg` (not `../content/coverart.jpg`)

11. **Generate the EPUB (from EPUB version) with dark mode support**
   - Use the EPUB-optimized markdown file: `output/TheReboundSpecialist-EpisodeXX-epub.md`
   - Change to output directory and run pandoc from there (so it can find coverart.jpg)
   - Command: `Set-Location "output"; pandoc "TheReboundSpecialist-EpisodeXX-epub.md" -o "TheReboundSpecialist-EpisodeXX.epub" --css="../epub-dark-mode.css" --epub-cover-image="coverart.jpg" --metadata title="The Rebound Specialist: Episode XX - [Title]"; Set-Location ".."`
   - The CSS file `epub-dark-mode.css` uses `prefers-color-scheme` media queries for proper dark mode support
   - EPUB will be created: `output/TheReboundSpecialist-EpisodeXX.epub`
   - Cover art will be embedded as proper EPUB cover using `--epub-cover-image`
   - No author metadata (keeps EPUB clean)
   - No table of contents (single episode doesn't need TOC)
   - If pandoc is not installed, provide installation instructions

12. **Report completion**
   - Confirm markdown files created: 
     - `output/TheReboundSpecialist-EpisodeXX-epub.md` (for EPUB generation)
     - `output/TheReboundSpecialist-EpisodeXX-pdf.md` (for PDF generation)
   - Confirm PDF file created (or provide manual instructions): `output/TheReboundSpecialist-EpisodeXX-pdf.pdf`
   - Confirm EPUB file created: `output/TheReboundSpecialist-EpisodeXX.epub`
   - Report total word count and scene count
   - Note any warnings or issues

## PDF Conversion Details

The Markdown PDF extension will handle the conversion using these optimizations:

- **Source file:** Use `TheReboundSpecialist-EpisodeXX-pdf.md` (includes title page and cover art)
- **Page breaks:** `<div class="page"/>` creates new pages
- **Typography:** Clean, readable font for prose fiction
- **Margins:** Default margins work well for reading
- **Headers/Footers:** Can be configured in VS Code settings if desired
- **Format:** Default A4 or Letter size (configurable)
- **Cover art:** Embedded as image in title page for professional appearance

**Manual PDF conversion (if automated step fails):**
1. Open `output/TheReboundSpecialist-EpisodeXX-pdf.md` in VS Code
2. Right-click in the editor
3. Select "Markdown PDF: Export (pdf)"
4. PDF will be generated in the same directory as `TheReboundSpecialist-EpisodeXX-pdf.pdf`

## EPUB Generation Details

EPUB files are generated using pandoc with the following features:

- **Source file:** Use `TheReboundSpecialist-EpisodeXX-epub.md` (minimalist, no title page in markdown)
- **Dark mode support:** Uses `epub-dark-mode.css` with `prefers-color-scheme` media queries
- **Light mode:** Black text on white background (#000000 on #ffffff)
- **Dark mode:** Light text on dark background (#e0e0e0 on #1a1a1a)
- **Metadata:** Title only (no author field for clean presentation)
- **No table of contents:** Single episodes don't need a TOC
- **Cover art:** Embedded as proper EPUB cover using `--epub-cover-image` (not in markdown)

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
pandoc "TheReboundSpecialist-EpisodeXX-epub.md" -o "TheReboundSpecialist-EpisodeXX.epub" --css="../epub-dark-mode.css" --epub-cover-image="coverart.jpg" --metadata title="The Rebound Specialist: Episode XX - [Title]"
Set-Location ".."
```

**Important:** 
- Pandoc must be run from the `output/` directory so it can find `coverart.jpg`
- Use the `-epub.md` file (not the `-pdf.md` file) for EPUB generation
- Use `--epub-cover-image` to embed cover as proper EPUB cover page
- No author metadata (keeps EPUB clean and simple)
- No `--toc` flag for single episode files (no need for table of contents)

## Example Usage

**User:** "Compile episode 1"

**System actions:**
1. Reads `elements/outlines/episode-01.md` for episode title
2. Reads all scene files from `content/episodes/episode-01-the-receptionist/` in numerical order
3. Creates `output/TheReboundSpecialist-Episode01-epub.md` with scene number headers (e.g., "## 1", "## 2") and page breaks (no title page)
4. Creates `output/TheReboundSpecialist-Episode01-pdf.md` with title page, cover art, scene number headers, and page breaks
5. Copies `content/coverart.jpg` to `output/coverart.jpg`
6. Invokes PDF conversion on the PDF markdown to create `output/TheReboundSpecialist-Episode01-pdf.pdf` (or provides manual instructions)
7. Invokes pandoc on the EPUB markdown to create `output/TheReboundSpecialist-Episode01.epub` with dark mode CSS
8. Reports: "✓ Episode 1 compiled: 9 scenes, 7,550 words\n  → output/TheReboundSpecialist-Episode01-epub.md (for EPUB)\n  → output/TheReboundSpecialist-Episode01-pdf.md (for PDF)\n  → output/TheReboundSpecialist-Episode01-pdf.pdf\n  → output/TheReboundSpecialist-Episode01.epub"

## Notes

- **Source of truth:** Individual scene files in `content/episodes/episode-##-name/` remain the source of truth
- **Two markdown versions:** EPUB version (minimalist) and PDF version (with title page and cover)
- **Compiled files:** Output files in `output/` are generated artifacts (.md, .pdf, and .epub files)
- **Version control:** All compiled files can be committed to track episode versions
- **PDF styling:** For custom styling, create a CSS file and reference it in VS Code settings under `markdown-pdf.styles`
- **EPUB dark mode:** The `epub-dark-mode.css` file must be in the repository root for pandoc to find it
- **Cover art:** Must be copied to `output/` directory so both PDF and EPUB can use it correctly

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
- Check that EPUB markdown (`-epub.md`) doesn't include cover in markdown (cover is added by pandoc via `--epub-cover-image`)
- Pandoc looks for images relative to the markdown file location

**If cover art is missing from PDF:**
- Verify `content/coverart.jpg` exists
- Ensure `output/coverart.jpg` was copied successfully
- Check that PDF markdown (`-pdf.md`) includes `![Cover Art](coverart.jpg)` in title page
- Verify image path is relative to output directory (not `../content/`)

**If PDF title page is missing:**
- Verify you're using the PDF markdown file (`-pdf.md`) not the EPUB version (`-epub.md`)
- Check that title page was generated with series title, episode title, and cover art
- Ensure page break after title page: `<div class="page"/>`

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
