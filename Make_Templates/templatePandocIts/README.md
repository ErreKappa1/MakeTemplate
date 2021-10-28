# Template per ITS-ICT Piemonte

## Istruzioni

1. Scaricare il template "eisvogel" e decomprimerlo nella directory `~/.pandoc/templates`:

    wget "https://github.com/Wandmalfarbe/pandoc-latex-template/archive/refs/heads/master.zip"
    mkdir -p ~/.pandoc/templates
    ln -s ~/.pandoc/templates/pandoc-latex-template-master/eisvogel.tex ~/.pandoc/templates/eisvogel.tex

2. Modificare il file di esempio `esempio_cover_pdf.md`

3. Generare il PDF con il comando

    pandoc --from markdown+pipe_tables --listings --template eisvogel.tex --output output.pdf esempio_cover_pdf.md

