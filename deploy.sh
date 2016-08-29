#!/bin/bash

git config --global user.name "Travis CI"
git config --global user.email "joe@travis-ci.org"

git clone "https://${GH_TOKEN}@${GH_REF}" pages

cd pages

git checkout gh-pages

mkdir -p style/
mkdir -p figures/

cp ../document.html index.html
cp ../document.pdf  thesis.pdf
cp ../document.epub thesis.epub

cp ../presentation.html presentation.html
cp ../style/presentation.css style/presentation.css
cp ../style/master.js style/master.js
cp ../figures/*.png figures/

git add .
git commit -m "Deploy to GitHub Pages"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" gh-pages
