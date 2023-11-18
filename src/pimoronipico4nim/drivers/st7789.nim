## This module wraps ST7789 Display Driver for Pimoroni LCDs in drivers/st7789

import hidecmakelinkerpkg/libconf
import ../libraries/picographics

initLibParams(backendLang = blCpp,
              linkLibraries = ["st7789"],
              cmakeStmts = [initCMakeInclude("drivers/st7789/st7789", depend = "initPicoSDK")]).config()

import ../common/[common, bus]

{.push header: "drivers/st7789/st7789.hpp".}

type
  ST7789* {.importcpp: "pimoroni::ST7789".} = object of DisplayDriver

proc constructST7789*(width, height: uint16; rotation: Rotation; pins: ParallelPins): ST7789 {.importcpp:"ST7789(@)", constructor.}
