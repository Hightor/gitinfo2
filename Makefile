#!make -rRf
# -------------------------------------------------------------
# gitinfo2
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
latexmk = /cygdrive/d/Programs/TeX.Live/texmf-dist/scripts/latexmk/latexmk.pl
viewpdf = /cygdrive/c/Program\ Files/Tracker\ Software/PDF\ Viewer/PDFXCview.exe
lmkexec = latexmk
git = git
# git = /cygdrive/c/Program\ Files\ \(x86\)/Git/bin/git.exe
silent =
include ~/.make/Makefile

pkg = gitinfo2
archive = $(pkg).tar.gz
ginfile = .git/gitHeadInfo.gin
pseudofile = gitHeadLocal.gin

codelist = $(pkg).sty gitexinfo.sty
docslist = $(pkg).tex $(pkg).pdf $(pseudofile)
morelist = gitinfotest.tex post-xxx-sample.txt README
dirtlist = $(pkg).pdf $(pkg).tar.gz $(pseudofile)

list = $(codelist) $(docslist) $(morelist)

auxdir = .auxfiles

ship: $(archive)

$(archive): $(list)
	# texlua build.lua ctan
	chmod -R 644 $^ testfiles/* 
	perl `which ctanify` $^
	chmod 644 $@

clean $(ginfile):
	$(git) checkout $(dirtlist)

$(pkg).pdf: $(pkg).tex $(codelist) $(pseudofile)
	rm -f $@ $(auxdir)/$@
	$(lmkexec) -outdir=$(auxdir) $(silent) -xelatex -e '$$makeindex=q/makeindex %O -s blindex.ist -o %D %S/' "$<"
	chmod a+rw $(auxdir) $(auxdir)/*
	mv $(auxdir)/$@ ./

%.view: %.pdf
	$(viewpdf) $<

$(pseudofile): $(ginfile)
	cp $< $@
	chmod 644 $@

gitinfotest.pdf: gitinfotest.tex
	xelatex $<
