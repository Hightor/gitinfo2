#!make -rRf
# -------------------------------------------------------------
# gitinfo2-tugboat
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
latexmk = /cygdrive/d/Programs/TeX.Live/texmf-dist/scripts/latexmk/latexmk.pl
viewpdf = /cygdrive/c/Program\ Files/Tracker\ Software/PDF\ Viewer/PDFXCview.exe
lmkexec = perl $(latexmk)
silent = -silent
include ~/.make/Makefile

auxdir = .auxfiles

docname = gitinfo2.tub.2014
bibname = gitinfo2-tub

doc: $(docname).pdf


view: $(docname).view

# $(docname).pdf: $(docname).tex $(bibname).bib 
$(docname).pdf: $(docname).tex
	rm -f $@ $(auxdir)/$@
	$(lmkexec) -outdir=$(auxdir) $(silent) -xelatex -e '$$makeindex=q/makeindex %O -s blindex.ist -o %D %S/' "$<"    
	chmod a+rw $(auxdir) $(auxdir)/*
	mv $(auxdir)/$@ ./

%.view: %.pdf
	$(viewpdf) $<

