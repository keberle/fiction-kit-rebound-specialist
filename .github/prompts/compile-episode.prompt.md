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
   - Target location: `output/episode-##-kebab-case-title.md`
   - If `output/` directory doesn't exist, create it
   - Filename example: `output/episode-01-the-receptionist.md`

5. **Compile the content with PDF-optimized formatting**
   
   **A. Title Page Section:**
   ```markdown
   <div style="text-align: center; margin-top: 40%; font-size: 2em;">
   
   # Episode #: Title
   
   **[Series Name]**
   
   *Episode ##*
   
   </div>
   
   <div class="page"/>
   ```
   
   **B. Scene Content:**
   - For each scene:
     - Add scene number header at the start: `## Scene #` (just the number, no scene name)
     - This creates a chapter-style header for each scene
     - Include scene prose exactly as written (strip the `## Scene # —` heading from source files)
     - Add `<div class="page"/>` after each scene's content
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
   - Verify scene number headers are present for each scene
   - Report any missing scenes or issues

8. **Generate the PDF**
   - After creating the markdown file, automatically invoke the PDF conversion
   - Use VS Code command: `markdown-pdf.pdf` on the compiled markdown file
   - PDF will be created with same name: `output/episode-##-kebab-case-title.pdf`
   - If conversion fails, provide instructions for manual conversion

9. **Report completion**
   - Confirm markdown file created: `output/episode-##-title.md`
   - Confirm PDF file created: `output/episode-##-title.pdf`
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

## Example Usage

**User:** "Compile episode 1"

**System actions:**
1. Reads `elements/outlines/episode-01.md` for episode title
2. Reads all scene files from `content/episodes/episode-01-the-receptionist/` in order
3. Creates `output/episode-01-the-receptionist.md` with PDF-optimized formatting (title page, scene number headers, page breaks)
4. Invokes PDF conversion to create `output/episode-01-the-receptionist.pdf`
5. Reports: "✓ Episode 1 compiled: 9 scenes, 7,673 words\n  → output/episode-01-the-receptionist.md\n  → output/episode-01-the-receptionist.pdf"

## Notes

- **Source of truth:** Individual scene files in `content/episodes/episode-##-name/` remain the source of truth
- **Compiled files:** Output files in `output/` are generated artifacts for distribution/publication
- **Editing workflow:** Always edit scene files, never the compiled output
- **Recompilation:** After editing any scene, recompile to regenerate both .md and .pdf files
- **Version control:** Both .md and .pdf compiled files can be committed to track episode versions
- **PDF styling:** For custom styling, create a CSS file and reference it in VS Code settings under `markdown-pdf.styles`

## Troubleshooting

**If PDF generation fails:**
- Ensure Markdown PDF extension (yzane.markdown-pdf) is installed
- Check that Chromium download completed (extension requires it)
- Try manual conversion via right-click menu
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
