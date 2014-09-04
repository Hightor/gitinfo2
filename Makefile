#!make -rRf
# -------------------------------------------------------------
# gitinfo2
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
codelist = gitinfo2.sty gitexinfo.sty
docslist = gitinfo2.tex gitinfo2.pdf gitPseudoHeadInfo.gin 
morelist = gitinfotest.tex post-xxx-sample.txt README
archive = gitinfo2.tar.gz
list = $(codelist) $(docslist) $(morelist)

ship: $(archive)

$(archive): $(list)
	chmod 644 $^
	perl `which ctanify` $^
	chmod 644 $@

clean: 
	rm $(archive)

gitinfo2.pdf: gitinfo2.tex gitPseudoHeadInfo.gin
	xelatex $<
	xelatex $<

gitPseudoHeadInfo.gin: .git/gitHeadInfo.gin
	cp $< $@
