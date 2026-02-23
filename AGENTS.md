# AGENTS.md - Typst Academic Document Project

## Project Overview

This is a Typst-based academic document (dissertation/thesis) written in Portuguese about educational interventions regarding snakes in higher education. The project follows Brazilian academic conventions (ABNT standards).

## Build Commands

### Compile PDF
```bash
# Full build
typst compile main.typ output.pdf

# Or using Makefile
make build
```

### Live Reload (Development)
```bash
# Uses Air for live reload - watches .typ files and rebuilds on changes
air
```

The `.air.toml` configuration watches `.typ` files with 1000ms delay and logs build errors to `tmp/build-errors.log`.

### Clean Build Artifacts
```bash
make clean
# or
rm -f output.pdf
```

## Testing

This project does not have automated tests. To verify the document compiles correctly, run:
```bash
typst compile main.typ output.pdf
```

If compilation succeeds with no errors, the document is valid.

## Code Style Guidelines

This project uses **Typst** markup language for academic documents.

### File Organization

- `main.typ` - Main document entry point; imports formatacao.typ and includes all chapters
- `formatacao.typ` - Contains formatting functions (ABNT styles, headers, abstracts)
- `*.typ` - Individual chapters (introducao.typ, materiais_e_metodos.typ, etc.)
- `referencias.bib` - BibTeX references

### Typst Code Conventions

**Functions:**
- Use snake_case for function names: `#let abnt-setup()`, `#let artigo-cabecalho()`
- Use descriptive Portuguese names for document functions
- Always include docstring comments (// comment) explaining purpose

**Variables:**
- Use snake_case: `#let titulo = "..."`, `#let autores = "..."`
- Prefer meaningful Portuguese variable names

**Imports:**
- Use wildcard import for formatting modules: `#import "formatacao.typ": *`
- Use `#include` for chapter files

**Code Blocks:**
```typst
#let function-name(param, optional-param: default) = {
  // function body
  set block(above: 12pt, below: 12pt)
  it
}
```

**Comments:**
- Use `//` for single-line comments
- Use `/* */` for multi-line comments (rarely needed)

### Document Structure

- `#set document(title: ..., author: ..., date: auto)` - Document metadata
- `#set page(...)` - Page configuration (paper, margins)
- `#set text(...)` - Text styling (font, size)
- `#set heading(...)` - Heading configuration with ABNT numbering
- `#show heading.where(level: N): it => { ... }` - Heading style overrides

### ABNT Conventions

This project follows Brazilian Association of Technical Standards (ABNT) conventions:
- Font: Times New Roman, 12pt
- Margins: 3cm top/bottom/left, 2cm right
- Line spacing: 1.5em (leading)
- First-line indent: 1.25cm
- Section numbering: "1.", "1.1", etc.
- References: BibTeX format in `referencias.bib`

### Naming Conventions

| Element | Convention | Example |
|---------|------------|---------|
| Functions | snake_case (Portuguese) | `abnt-setup`, `artigo-cabecalho` |
| Variables | snake_case (Portuguese) | `titulo`, `autores`, `filiacao` |
| Parameters | snake_case (English) | `body`, `keywords`, `pagina` |
| Files | kebab-case | `materiais_e_metodos.typ` |

### Error Handling

Typst compilation errors are logged to `tmp/build-errors.log`. When fixing errors:
1. Check the error message line number in the specific .typ file
2. Common issues: missing closing brackets, incorrect syntax, missing imports
3. Use `typst compile main.typ` to see full error output

## Common Tasks

### Adding a New Chapter
1. Create new file: `new_chapter.typ`
2. Add to `main.typ`: `#include "new_chapter.typ"`
3. Add to Makefile if needed

### Adding References
1. Add entry to `referencias.bib`
2. Cite in document using `@key` syntax

### Modifying Formatting
Edit functions in `formatacao.typ` - changes propagate to all documents using `#abnt-setup()`
