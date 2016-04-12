# Diploma Thesis

[![Build status](https://travis-ci.org/phdd/diplom.svg?branch=master)](https://travis-ci.org/phdd/diplom)

### Requirements

* Pandoc 1.12.4.2 with pandoc-citeproc (see http://johnmacfarlane.net/pandoc/installing.html#all-platforms). Ubuntu 14.04 only provides version 1.12.2.1 which does not produce proper cross references in the HTML output.
* TeX Live (`texlive-full`)

### Usage

* Clone this repository:
  ```bash
  git clone git@github.com:FTSRG/thesis-template-markdown.git
  ```
  
* Use `make pdf`, `make html`, `make epub` to generate the thesis in your desired output format.

Thanks to the Budapest University of Technology and Economics for the template ([github.com/FTSRG/thesis-template-markdown](https://github.com/FTSRG/thesis-template-markdown))
