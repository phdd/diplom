ARGS = \
	document.md \
	--from=markdown \
	--standalone \
	--bibliography=bibliography.bib \

LATEX_ARGS = \
	$(ARGS) \
	--include-after-body=appendix.tex \
	--template=style/latex.tex \
	--natbib \

HTML_ARGS = \
	--webtex \
	--filter pandoc-citeproc \

NON_LATEX_ARGS = \
	appendix.md \
	style/literatur.md \
	--number-sections \
	--default-image-extension=png \
	--csl style/ieee.csl \

FIGURES = $(wildcard figures/*.svg)

pdf: latex build-latex

latex: compile-appendix-tex
	pandoc \
		metadata.yml \
		$(LATEX_ARGS) \
		--listings \
		--table-of-contents \
		--output=document.tex \

html: figures-png
	pandoc \
		metadata.yml \
		$(ARGS) \
		$(HTML_ARGS) \
		$(NON_LATEX_ARGS) \
		--table-of-contents \
		--self-contained \
		--output=document.html \
		--css=style/html.css \

epub: figures-png
	pandoc \
		metadata.yml \
		$(ARGS) \
		$(NON_LATEX_ARGS) \
		--write=epub3 \
		--output=document.epub \
		--epub-stylesheet=style/epub.css \

presentation: figures-png
	pandoc \
		metadata.yml \
		presentation.md \
		--template=style/presentation.html \
		--variable=css:style/presentation.css \
		--standalone \
		--webtex \
		--to=revealjs \
		--output=presentation.html \
		--default-image-extension=png \
		--mathjax \
		--table-of-contents

build-latex: figures-pdf
	xelatex document
	biber   document
	xelatex document
	xelatex document

compile-appendix-tex:
	pandoc \
		metadata.yml \
		appendix.md \
		--listings \
		--variable=documentclass:report \
		--output=appendix.tex \

figures-pdf: $(FIGURES:%.svg=%.pdf)
figures-png: $(FIGURES:%.svg=%.png)

%.pdf: %.svg
	inkscape -A $*.pdf $*.svg

%.png: %.svg
	inkscape -d 192 -e $*.png $*.svg

clean:
	rm -f \
		*.tex *.aux *.dvi *.log *.pdf *.html *.mobi \
		*.out *.epub *.toc *.thm *.lot *.lof *.blg  \
		*.bbl *.nlo *.lol *.cb *.bcf *.run.xml \
		figures/*.png figures/*.pdf
