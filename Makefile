ARGS = \
	document.md \
	--from=markdown \
	--standalone \
	--table-of-contents \
	--bibliography=bibliography.bib \

LATEX_ARGS = \
	$(ARGS) \
	--include-after-body=appendix.tex \
	--template=style/latex.tex \
	--natbib \

HTML_ARGS = \
	--mathjax \
	--filter pandoc-citeproc \



pdf: latex build-latex

latex: compile-appendix-tex
	pandoc \
		$(LATEX_ARGS) \
		--to=latex \
		--output=document.tex \

html:
	pandoc \
		$(ARGS) \
		$(HTML_ARGS) \
        appendix.md \
        style/literatur.md \
        --self-contained \
        --csl style/ieee.csl \
		--to=html \
		--output=document.html \
		--css=style/html.css \

epub: 
	pandoc \
		$(ARGS) \
        appendix.md \
        style/literatur.md \
        --csl style/ieee.csl \
		--output=document.epub \
		--epub-stylesheet=style/epub.css \
		--epub-metadata=epub.xml \

build-latex:
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

clean:
	rm -f *.tex *.aux *.dvi *.log *.pdf *.html *.mobi \
          *.out *.epub *.toc *.thm *.lot *.lof *.blg  \
          *.bbl *.nlo *.lol *.cb *.bcf *.run.xml
