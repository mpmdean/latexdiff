#!/bin/bash
# Make difference files for main.tex and supp.tex.
# Usage latexdiff_project old_folder new_folder
# which will create pdfs in the root folder.
# Folder names cannot contain spaces.

latexdiff $1main.tex $2main.tex > $2main_diffs.tex
latexdiff $1supp.tex $2supp.tex > $2supp_diffs.tex
eval cd $2
pdflatex main_diffs.tex
bibtex main_diffs
pdflatex main_diffs.tex
pdflatex main_diffs.tex

pdflatex supp_diffs.tex
bibtex supp_diffs
pdflatex supp_diffs.tex
pdflatex supp_diffs.tex

cp main_diffs.pdf ../.
cp supp_diffs.pdf ../.
