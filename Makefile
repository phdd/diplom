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
	--mathjax \
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
		$(LATEX_ARGS) \
		--table-of-contents \
		--to=latex \
		--output=document.tex \

html: figures-png
	pandoc \
		$(ARGS) \
		$(HTML_ARGS) \
		$(NON_LATEX_ARGS) \
		--table-of-contents \
		--self-contained \
		--to=html \
		--output=document.html \
		--css=style/html.css \

epub: figures-png
	pandoc \
		$(ARGS) \
		$(NON_LATEX_ARGS) \
		--output=document.epub \
		--epub-stylesheet=style/epub.css \

build-latex: figures-pdf
	xelatex document
	biber   document
	xelatex document
	xelatex document

compile-appendix-tex:
	pandoc \
		appendix.md \
		--from=markdown \
		--to=latex \
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
