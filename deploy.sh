#!/bin/bash

git config user.name "Travis CI"
git config user.email "joe@travis-ci.org"

git clone "https://${GH_TOKEN}@${GH_REF}" pages
git checkout gh-pages

cp document.html pages/index.html
cp document.pdf  pages/thesis.pdf
cp document.epub pages/thesis.epub

cd pages

git add .
git commit -m "Deploy to GitHub Pages"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" gh-pages
