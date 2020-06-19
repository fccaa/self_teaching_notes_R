#!/bin/bash

infile=$@
outfile=${infile/ipynb/pdf}

jupyter-nbconvert "$infile" --to latex --output tmp
sed -i 's@\maketitle@\maketitle\\\Tableofcontents@g' tmp.tex
sed -i 's@Tableofcontents@tableofcontents@g' tmp.tex

xelatex tmp.tex
xelatex tmp.tex
xelatex tmp.tex

mv tmp.pdf "$outfile"

rm -f tmp*

echo $infile $outfile

mv "$outfile" pdfs
