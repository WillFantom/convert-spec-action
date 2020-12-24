#!/bin/bash
set -e

# Scan through given directory
c=0
cd $GITHUB_WORKSPACE/$1
for mdFile in *.md
do
  echo "📄 converting file: $mdFile"
  noExt=${mdFile%".md"}
  pandoc -t html5 --css /css/style.css $noExt.md -o $noExt.pdf -s --metadata title=$noExt --pdf-engine=wkhtmltopdf -V margin-top=2 -V margin-left=4 -V margin-right=4 -V margin-bottom=2 -V dpi=600 
  let "c+=1"
done

echo "::set-output name=count::$c"
