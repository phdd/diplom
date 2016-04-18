# Diploma Thesis

[![Build status](https://travis-ci.org/phdd/diplom.svg?branch=master)](https://travis-ci.org/phdd/diplom) [![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC%20BY--NC--ND%204.0-lightgrey.svg)](http://creativecommons.org/licenses/by-nc-nd/4.0/)

[PDF](https://phdd.github.io/diplom/thesis.pdf), [EPUB](https://phdd.github.io/diplom/thesis.epub), [HTML](https://phdd.github.io/diplom), [Presentation](http://phdd.github.io/diplom/presentation.html)

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

## Acknowledgments

Thanks to the Budapest University of Technology and Economics for the template ([github.com/FTSRG/thesis-template-markdown](https://github.com/FTSRG/thesis-template-markdown))

## License

Thesis (c) by Peter Heisig

This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
You should have received a copy of the license along with this work. If not, see <http://creativecommons.org/licenses/by-nc-nd/4.0/>.
