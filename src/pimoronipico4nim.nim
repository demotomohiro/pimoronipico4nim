import std/strformat
import pathX
import hidecmakelinkerpkg/libconf
import picosdk4nim

const PimoroniPicoPath {.strdefine.} = ""

when PimoroniPicoPath == "":
  {.error: "Please run 'git clone https://github.com/pimoroni/pimoroni-pico.git --branch main --depth 1 --recurse-submodules --shallow-submodules' and specify the path to Pimoroni Pico Libraries with '-d:PimoroniPicoPath=/path/to/pimoroni-pico'".}

const PimoroniPicoPathX = PathX[fdDire, arAbso, BuildOS, true](PimoroniPicoPath)

initLibParams(backendLang = blCpp,
              cmakeProgLangs = {cmplC, cmplCXX, cmplASM},
              cmakeStmts = [initCMakeCmd(&"set(PIMORONI_PICO_PATH {cmakeStrArg($PimoroniPicoPathX)})",
                                         name = "setPimoroniPicoPath",
                                         depend = "includePicoSDK"),
                            initCMakeInclude($(PimoroniPicoPathX.joinFile"pimoroni_pico_import.cmake"),
                                             name = "includePimoroniPicoImport",
                                             depend = "setPimoroniPicoPath")]
              ).config()

{.used.}
