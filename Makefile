.DEFAULT_GOAL := all

ARGS = \
	document.md \
	--from=markdown \
	--standalone \
	--bibliography=bibliography.bib \
	--filter pandoc-crossref \
	--smart \

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
	--csl style/ieee.csl \

FIGURES = $(wildcard figures/*.svg)

WATCH_SCRIPT = \
	from livereload import Server, shell; \
	server = Server(); \
	server.watch('*.md', shell('make html', cwd = '.')); \
	server.serve(root = '.'); \

all: pdf html epub presentation

pdf: latex build-latex

latex: compile-appendix-tex fix-mendeley-bug
	pandoc \
		metadata.yml \
		$(LATEX_ARGS) \
		--listings \
		--table-of-contents \
		--output=document.tex \
		--default-image-extension=pdf \

html: figures-png fix-mendeley-bug
	pandoc \
		metadata.yml \
		$(ARGS) \
		$(HTML_ARGS) \
		$(NON_LATEX_ARGS) \
		--html-q-tags \
		--table-of-contents \
		--self-contained \
		--output=document.html \
		--css=style/html.css \
		--default-image-extension=svg \

epub: figures-png fix-mendeley-bug
	pandoc \
		metadata.yml \
		$(ARGS) \
		$(NON_LATEX_ARGS) \
		--write=epub3 \
		--output=document.epub \
		--epub-stylesheet=style/epub.css \
		--default-image-extension=png \

presentation: figures-png fix-mendeley-bug
	pandoc \
		$(HTML_ARGS) \
		metadata.yml \
		presentation.md \
		style/literatur.md \
		--template=style/presentation.html \
		--variable=css:style/presentation.css \
		--bibliography=bibliography.bib \
		--standalone \
		--to=revealjs \
		--output=presentation.html \
		--default-image-extension=png \
		--mathjax \
		--csl style/ieee.csl \

watch: 
	echo "$(WATCH_SCRIPT)" | python

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
		--default-image-extension=pdf \
		--output=appendix.tex \

fix-mendeley-bug:
	sed -i -e "s/{\\\_}/_/g" "bibliography.bib"
	sed -i -e "s/{\\\~}/~/g" "bibliography.bib"

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
