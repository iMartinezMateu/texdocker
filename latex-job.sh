#!/usr/bin/env bash
cd /tmp
jobname=`uuidgen`
cat /dev/fd/0> $jobname.tex
pdflatex --interaction=nonstopmode $jobname.tex &>/dev/null
bibtex $jobname
pdflatex --interaction=nonstopmode $jobname.tex &>/dev/null
pdflatex --interaction=nonstopmode $jobname.tex &>/dev/null
cat $jobname.pdf