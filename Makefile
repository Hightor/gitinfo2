#!make -rRf
# -------------------------------------------------------------
# gitinfo2
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
latexmk = /cygdrive/d/Programs/TeX.Live/texmf-dist/scripts/latexmk/latexmk.pl
viewpdf = /cygdrive/c/Program\ Files/Tracker\ Software/PDF\ Viewer/PDFXCview.exe
lmkexec = perl $(latexmk)
silent =
include ~/.make/Makefile

archive = gitinfo2.tar.gz
ginfile = .git/gitHeadInfo.gin
pseudofile = gitPseudoHeadInfo.gin

codelist = gitinfo2.sty gitexinfo.sty
docslist = gitinfo2.tex gitinfo2.pdf $(pseudofile)
morelist = gitinfotest.tex post-xxx-sample.txt README
dirtlist = gitinfo2.pdf gitinfo2.tar.gz $(pseudofile)

list = $(codelist) $(docslist) $(morelist)

auxdir = .auxfiles

ship: $(archive)

$(archive): $(list)
	chmod -R 644 $^ testfiles/* 
	perl `which ctanify` $^
	chmod 644 $@

clean $(ginfile):
	git checkout $(dirtlist)

gitinfo2.pdf: gitinfo2.tex $(pseudofile)
	rm -f $@ $(auxdir)/$@
	$(lmkexec) -outdir=$(auxdir) $(silent) -xelatex -e '$$makeindex=q/makeindex %O -s blindex.ist -o %D %S/' "$<"
	chmod a+rw $(auxdir) $(auxdir)/*
	mv $(auxdir)/$@ ./

%.view: %.pdf
	$(viewpdf) $<

$(pseudofile): $(ginfile)
	cp $< $@

gitinfotest.pdf: gitinfotest.tex
	xelatex $<
