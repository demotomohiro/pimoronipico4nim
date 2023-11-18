switch("path", "$projectDir/../src")
switch("define", "release")
switch("mm", "arc") # use "arc", "orc" or "none"
switch("define", "checkAbi")
switch("define", "useMalloc")
switch("cpu", "arm")
switch("os", "any")
switch("threads", "off")
switch("exceptions", "quirky")

switch("gcc.linkerexe", "hidecmakelinker")
switch("gcc.cpp.linkerexe", "hidecmakelinker")
switch("gcc.exe", "void")
switch("gcc.cpp.exe", "void")
nimcacheDir().mkDir()

switch("define", "PicoAddExtraOutput")
# switch("define", "PicoBinaryType=no_flash")
