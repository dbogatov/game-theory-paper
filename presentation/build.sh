#!/bin/bash

INTERACTION=nonstopmode
OUTDIR=dist
COMPILATIONS=3
JOBNAME=presentation

echo "Generating document..."

rm -rf $OUTDIR
mkdir -p $OUTDIR

# LaTeX needs >1 compilations for references
for (( i=1; i<=$COMPILATIONS; i++ ))
do
	xelatex --interaction=${INTERACTION} -output-directory=${OUTDIR} -jobname=${JOBNAME} src/main.tex &>/dev/null
done

echo "Done."

echo "Removing build files..."

rm dist/*.{aux,log,nav,out,snm,toc}

echo "Done."
