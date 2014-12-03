#!/usr/bin/env texlua

-- Build script for gitinfo2

module = "gitinfo2"

sinkfiles    = { "*.sty" } 
typesetfiles = { }
textfiles    = { "gitinfo2.tex", "gitinfo2.pdf", 
                 "gitPseudoHeadInfo.gin",
                 "gitinfotest.tex", "post-xxx-sample.txt" }
readmefiles  = { "README" }
typesetexe   = "xelatex"
packtdszip   = true
havesource   = false

kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))

-- #!make -rRf
-- # -------------------------------------------------------------
-- # gitinfo2
-- # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
-- pseudofile = gitPseudoHeadInfo.gin
-- codelist = gitinfo2.sty gitexinfo.sty
-- docslist = gitinfo2.tex gitinfo2.pdf $(pseudofile)
-- morelist = gitinfotest.tex post-xxx-sample.txt README
-- dirtlist = gitinfo2.pdf gitinfo2.tar.gz $(pseudofile)
-- archive = gitinfo2.tar.gz
-- ginfile = .git/gitHeadInfo.gin
-- list = $(codelist) $(docslist) $(morelist)
-- 
-- ship: $(archive)
-- 
-- $(archive): $(list)
-- 	chmod 644 $^
-- 	perl `which ctanify` $^
-- 	chmod 644 $@
-- 
-- .git/gitHeadInfo.gin:
-- 	git checkout $(dirtlist)
-- 
-- gitinfo2.pdf: gitinfo2.tex $(pseudofile)
-- 	xelatex $<
-- 	xelatex $<
-- 
-- $(pseudofile): $(ginfile)
-- 	cp $< $@
-- 
-- gitinfotest.pdf: gitinfotest.tex
-- 	xelatex $<
-- 
-- %.view: %.pdf
-- 	/cygdrive/c/Program\ Files/Tracker\ Software/PDF\ Viewer/PDFXCview.exe $<
-- 