#!/usr/bin/env texlua
-- Build script for gitinfo2
module = "gitinfo2"

    installfiles    = { "*.sty", } 
    sourcefiles     = { 
                        "gitinfo2.tex", 
                        "*.sty", 
                        }
    typesetfiles    = { "gitinfo2.tex", }
    textfiles       = { 
                        "gitPseudoHeadInfo.gin", 
                        "post-xxx-sample.txt", 
                        }
    demofiles       = { "gitinfotest.tex", }
    readmefiles     = { "README", }
    typesetexe      = "xelatex"
    packtdszip      = true
    typesetopts     = "-interaction=batchmode"

kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
