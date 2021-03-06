manuscript = resume
builddir = build
latexopt = -file-line-error -halt-on-error -output-directory build

# Build the PDF of the lab report from the source files
$(manuscript).pdf: $(manuscript).tex bibliographies/*
	mkdir -p $(builddir)
	pdflatex $(latexopt) $(manuscript).tex
	bibtex $(builddir)/publications.aux
	bibtex $(builddir)/presentations.aux
#	bibtex $(builddir)/posters.aux
	pdflatex $(latexopt) $(manuscript).tex
	pdflatex $(latexopt) $(manuscript).tex
	mv $(builddir)/$(manuscript).pdf .

clean :
	rm -r $(builddir)
	rm $(manuscript).pdf

.PHONY : clean
