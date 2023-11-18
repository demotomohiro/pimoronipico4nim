## This module wraps ST7789 Display Driver for Pimoroni LCDs
## in drivers/st7789 in st7789mini branch in https://github.com/demotomohiro/pimoroni-pico
##
## It is modified version of ST7789 display driver so that it works without Pico Graphics library
## and reduces executable file size by about 90kbytes.
## But you have to draw things to a color buffer yourself, and provide it to st7789.update to update screen.
##
## Color buffer is an array of uint16 and its size is screen width * screen height.
## Set red value to highest 5bits, green value to next 6bits and blue value to lowest 5bits,
## then swap highest 8bits and lowest 8bits.

import hidecmakelinkerpkg/libconf

initLibParams(backendLang = blCpp,
              linkLibraries = ["st7789"],
              cmakeStmts = [initCMakeInclude("drivers/st7789/st7789", depend = "initPicoSDK")]).config()

import ../common/[common, bus]

{.push header: "drivers/st7789/st7789.hpp".}

type
  ST7789* {.importcpp: "pimoroni::ST7789".} = object

proc constructST7789*(width, height: uint16; rotation: Rotation; pins: ParallelPins): ST7789 {.importcpp:"ST7789(@)", constructor.}
proc update*(this: ST7789; frame_buffer: ptr UncheckedArray[uint16]) {.importcpp: "#.update(@)".}
proc setBacklight*(this: ST7789; brightness: uint8) {.importcpp: "#.set_backlight(@)".}
