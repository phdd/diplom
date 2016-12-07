# Diploma Thesis

[![Build status](https://travis-ci.org/phdd/diplom.svg?branch=master)](https://travis-ci.org/phdd/diplom) [![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC%20BY--NC--ND%204.0-blue.svg)](http://creativecommons.org/licenses/by-nc-nd/4.0/)

[PDF](https://phdd.github.io/diplom/thesis.pdf), [EPUB](https://phdd.github.io/diplom/thesis.epub), [HTML](https://phdd.github.io/diplom), [Presentation](http://phdd.github.io/diplom/presentation.html)

## Final Documents

* [30.08.2016 - Presentation: interim findings](https://github.com/phdd/diplom/raw/master/Zwischenpräsentation.final.pdf)
* [29.11.2016 - Final Thesis](https://github.com/phdd/diplom/raw/master/Diplomarbeit.final.pdf)
* [07.12.2016 - Defense Presentation](https://github.com/phdd/diplom/raw/master/Verteidigung.final.pdf)

## Requirements

* Pandoc 1.12.4.2 with pandoc-citeproc (see http://johnmacfarlane.net/pandoc/installing.html#all-platforms). Ubuntu 14.04 only provides version 1.12.2.1 which does not produce proper cross references in the HTML output.
* TeX Live (`texlive-full`)
* Inkscape for SVG conversion

## Usage

* Clone this repository:
  ```bash
  git clone git@github.com:phdd/diplom.git
  ```
  
* Use `make pdf`, `make html`, `make epub` to generate the thesis in your desired output format. 
* `make presentation` is responsible for creatíng the slides for a defense.

## Acknowledgments

Thanks to the Budapest University of Technology and Economics for the template ([github.com/FTSRG/thesis-template-markdown](https://github.com/FTSRG/thesis-template-markdown))

## License

Thesis (c) by Peter Heisig

This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
You should have received a copy of the license along with this work. If not, see <http://creativecommons.org/licenses/by-nc-nd/4.0/>.
