import hidecmakelinkerpkg/libconf

initLibParams(backendLang = blCpp,
              linkLibraries = ["tufty2040"],
              cmakeStmts = [initCMakeInclude("libraries/tufty2040/tufty2040", depend = "initPicoSDK")]).config()

{.push header: "libraries/tufty2040/tufty2040.hpp".}

const
  Width* = 320
  Height* = 240

let
  A* {.importcpp: "pimoroni::Tufty2040::A".}: uint8
  B* {.importcpp: "pimoroni::Tufty2040::B".}: uint8
  C* {.importcpp: "pimoroni::Tufty2040::C".}: uint8
  UP* {.importcpp: "pimoroni::Tufty2040::UP".}: uint8
  DOWN* {.importcpp: "pimoroni::Tufty2040::DOWN".}: uint8
  LED* {.importcpp: "pimoroni::Tufty2040::LED".}: uint8
  BACKLIGHT* {.importcpp: "pimoroni::Tufty2040::BACKLIGHT".}: uint8

  LCD_CS* {.importcpp: "pimoroni::Tufty2040::LCD_CS".}: uint8
  LCD_DC* {.importcpp: "pimoroni::Tufty2040::LCD_DC".}: uint8
  LCD_WR* {.importcpp: "pimoroni::Tufty2040::LCD_WR".}: uint8
  LCD_RD* {.importcpp: "pimoroni::Tufty2040::LCD_RD".}: uint8
  LCD_D0* {.importcpp: "pimoroni::Tufty2040::LCD_D0".}: uint8

type
  Tufty2040* {.importcpp: "pimoroni::Tufty2040".} = object

proc constructTufty2040*(): Tufty2040 {.importcpp:"Tufty2040()", constructor.}
