cpbe.pdf: cpbe.tex references.bib
	pdflatex cpbe.tex
	#bibtex cpbe
	pdflatex cpbe.tex
	pdflatex cpbe.tex

diff.tex: cpbe-submitted-draft.tex cpbe.tex Makefile
	latexdiff --exclude-textcmd="section,subsection,subsubsection,cmidrule" \
	  	cpbe-submitted-draft.tex cpbe.tex \
	  | dos2unix \
    | sed -e "/cmidrule/ s/\\\\DIFaddFL{\\([^}]*\\)}/\1/g" \
		> diff.tex

diff.pdf: diff.tex references.bib
	pdflatex diff.tex
	bibtex diff
	pdflatex diff.tex
	pdflatex diff.tex

cpbe-x.pdf: cpbe.tex
	xelatex cpbe.tex
	biber cpbe
	xelatex cpbe.tex
	xelatex cpbe.tex

.PHONY: clean
clean:
	rm -f cpbe.pdf cpbe.aux cpbe.bcf cpbe.log cpbe.run.xml cpbe.bbl
