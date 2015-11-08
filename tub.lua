#!/usr/bin/env texlua
-- Build script for gitinfo2
module = "gitinfo2"
lvtext = ".lll"
  installfiles = {"*.sty"} 
  sourcefiles  = {"*.sty"}
  textfiles    = {"post-xxx-sample.txt"}
  readmefiles  = {"README"}
  packtdszip   = true
kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
