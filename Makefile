.DEFAULT_GOAL := all

ARGS = \
	document.md \
	--from=markdown \
	--standalone \
	--bibliography=bibliography.bib \
	--smart \

ifndef DISABLE_REFS
	ARGS += --filter pandoc-crossref 
endif

LATEX_ARGS = \
	$(ARGS) \
	--include-after-body=appendix.tex \
	--template=style/latex.tex \
	--number-sections \
	--natbib \

HTML_ARGS = \
	--webtex \

ifndef DISABLE_REFS
	HTML_ARGS += --filter pandoc-citeproc 
endif

NON_LATEX_ARGS = \
	appendix.md \
	style/literatur.md \
	--number-sections \
	--csl style/ieee.csl \

FIGURES = $(wildcard figures/*.svg)

WATCH_SCRIPT = \
	from livereload import Server, shell; \
	server = Server(); \
	server.watch('document.md', shell('make html', cwd = '.')); \
	server.watch('presentation.md', shell('make presentation', cwd = '.')); \
	server.serve(root = '.'); \

watch: 
	echo "$(WATCH_SCRIPT)" | python

hello:
	@echo ""
	@echo -e " \033[1mSuper awesome Thesis Builder v1.0\033[m"
	@echo "-----------------------------------"

all: pdf html epub presentation

announce-figures-pdf:
	@echo -e "> \033[1minkscape:\033[m SVG => PDF"

announce-figures-png:
	@echo -e "> \033[1minkscape:\033[m SVG => PNG"

pdf: hello latex announce-figures-pdf figures-pdf build-latex

latex: compile-appendix-tex compile-acknowledgements-tex fix-mendeley-bug
	@echo -e "> \033[1mpandoc:\033[m Markdown => Latex"
	@pandoc \
		metadata.yml \
		$(LATEX_ARGS) \
		--listings \
		--table-of-contents \
		--output=document.tex \
		--default-image-extension=pdf \

html: hello fix-mendeley-bug
	@echo -e "> \033[1mpandoc:\033[m Markdown => HTML"
	@pandoc \
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

epub: hello announce-figures-png figures-png fix-mendeley-bug
	@echo -e "> \033[1mpandoc:\033[m Markdown => EPUB"
	@pandoc \
		metadata.yml \
		$(ARGS) \
		$(NON_LATEX_ARGS) \
		--write=epub3 \
		--output=document.epub \
		--epub-stylesheet=style/epub.css \
		--default-image-extension=png \

presentation: hello announce-figures-png figures-png fix-mendeley-bug
	@echo -e "> \033[1mpandoc:\033[m Presentation"
	@pandoc \
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

build-latex: 
	@echo -e "> \033[1mxelatex:\033[m Latex => PDF"
	@./latexrun -O . \
		-Wno-hyperref -Wno-scrextend \
		--bibtex-cmd biber --latex-cmd xelatex document

compile-appendix-tex:
	@pandoc \
		metadata.yml \
		appendix.md \
		--listings \
		--variable=documentclass:report \
		--default-image-extension=pdf \
		--output=appendix.tex \
		--number-sections \
		--smart

compile-acknowledgements-tex:
	@pandoc \
		acknowledgements.md \
		--variable=documentclass:report \
		--output=acknowledgements.tex \
		--number-sections \
		--smart

fix-mendeley-bug:
	@echo -e "> fixing Mendeley bullshit"
	@sed -i -e "s/{\\\_}/_/g" "bibliography.bib"
	@sed -i -e "s/{\\\~}/~/g" "bibliography.bib"

figures-pdf: $(FIGURES:%.svg=%.pdf)
figures-png: $(FIGURES:%.svg=%.png)

%.pdf: %.svg
	@echo -e "  - $*"
	@inkscape -A $*.pdf $*.svg >/dev/null 2>&1

%.png: %.svg
	@echo -e "  - $*"
	@inkscape -d 192 -e $*.png $*.svg >/dev/null 2>&1

clean:
	@./latexrun --clean-all
	@rm -f figures/*.png figures/*.pdf \
