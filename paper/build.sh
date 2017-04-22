#!/bin/bash

INTERACTION=nonstopmode
OUTDIR=dist
COMPILATIONS=3
JOBNAME=paper

echo "Generating document..."

mkdir -p $OUTDIR

# LaTeX needs >1 compilations for references
for (( i=1; i<=$COMPILATIONS; i++ ))
do
	xelatex --interaction=${INTERACTION} -output-directory=${OUTDIR} -jobname=${JOBNAME} src/main.tex #&>/dev/null
done

echo "Done."

echo "Attaching appendicies..."

enscript -o - src/appendicies/APPENDIX_A.swift | ps2pdf - > dist/APPENDIX_A.pdf
enscript -o - src/appendicies/APPENDIX_B.txt | ps2pdf - > dist/APPENDIX_B.pdf
pdfjoin dist/${JOBNAME}.pdf dist/APPENDIX_A.pdf dist/APPENDIX_B.pdf --outfile dist/${JOBNAME}.pdf --rotateoversize false #&>/dev/null

echo "Removing build files..."

rm dist/*.{aux,log,out}
rm dist/APPENDIX_*.pdf

echo "Done."
