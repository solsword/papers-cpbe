cpbe.pdf: cpbe.tex references.bib
	pdflatex cpbe.tex
	bibtex cpbe
	pdflatex cpbe.tex
	pdflatex cpbe.tex

cpbe-x.pdf: cpbe.tex
	xelatex cpbe.tex
	biber cpbe
	xelatex cpbe.tex
	xelatex cpbe.tex

.PHONY: clean
clean:
	rm -f cpbe.pdf cpbe.aux cpbe.bcf cpbe.log cpbe.run.xml cpbe.bbl
