# PDF Management

### 1. Merge multiple PDF files
Use `pdfunite` to combine multiple PDF documents into a single file with a specified ordering.
```text
pdfunite <infile1>.pdf <infile2>.pdf ... <outfile>.pdf
```
> [!NOTE]
> Required package: `sudo apt install poppler-utils`

### 2. Concatenate multiple images into a PDF
Use `convert` to combine multiple images into a single PDF document.
```text
convert <images>*.jpg <filename>.pdf
```
> [!NOTE]
> Required package: `sudo apt install graphicsmagick-imagemagick-compat`

### 3. Split and extract specific PDF pages
Use `qpdf` to extract a specific range of pages from a PDF document.
```text
qpdf <input>.pdf --pages . 3-7 -- <output>.pdf
```
Alternatively, use `pdfseparate` to extract all individual pages or specific page ranges.
```text
pdfseparate <input>.pdf <page->%d.pdf
pdfseparate -f 5 -l 5 <input>.pdf <page-five>.pdf
```
> [!NOTE]
> Required package: `sudo apt install qpdf poppler-utils`

### 4. View PDF metadata information
Show page count, dimensions, metadata, and other details with `pdfinfo`.
```text
pdfinfo <input>.pdf
```
Use `qpdf` to check whether a PDF file is encrypted.
```text
qpdf --is-encrypted <input>.pdf
```
> [!NOTE]
> Required package: `sudo apt install qpdf`

### 5. Extract text from PDF files
Extract text while preserving the original layout as closely as possible into a text file with `pdftotext`.
```text
pdftotext -layout <input>.pdf <output>.txt
```
