import hidecmakelinkerpkg/libconf

initLibParams(backendLang = blCpp,
              linkLibraries = ["pico_graphics"],
              cmakeStmts = [initCMakeInclude("libraries/pico_graphics/pico_graphics", depend = "initPicoSDK")]).config()

{.push header: "libraries/pico_graphics/pico_graphics.hpp".}

type
  BitmapFont* {.importcpp: "bitmap::font_t".} = object
    height*: uint8
    max_width*: uint8

  HersheyFont* {.importcpp: "hershey::font_t".} = object

let
  font6* {.importcpp: "font8".}: BitmapFont
  font8* {.importcpp: "font8".}: BitmapFont
  font14Outline* {.importcpp: "font14_outline".}: BitmapFont
  futural* {.importcpp: "hershey::futural".}: HersheyFont
  futuram* {.importcpp: "hershey::futuram".}: HersheyFont
  gothgbt* {.importcpp: "hershey::gothgbt".}: HersheyFont
  scriptc* {.importcpp: "hershey::scriptc".}: HersheyFont
  timesi* {.importcpp: "hershey::timesi".}: HersheyFont

type
  Pen* {.importcpp: "pimoroni::Pen".} = cint
  Point* {.importcpp: "pimoroni::Point".} = object
  PicoGraphics* {.importcpp: "pimoroni::PicoGraphics", inheritable.} = object
  PicoGraphicsPenRGB332* {.importcpp: "pimoroni::PicoGraphics_PenRGB332".} = object of PicoGraphics

proc constructPoint*(x, y: int32): Point {.importcpp: "pimoroni::Point(@)", constructor.}

proc createPen*(this: PicoGraphics; r, g, b: uint8): Pen {.importcpp: "#.create_pen(@)".}
proc setPen*(this: PicoGraphics; c: Pen) {.importcpp: "#.set_pen(@)".}
proc clear*(this: PicoGraphics) {.importcpp: "#.clear()".}
proc setFont*(this: PicoGraphics; font: ptr BitmapFont) {.importcpp: "#.set_font(@)".}
proc setFont*(this: PicoGraphics; font: ptr HersheyFont) {.importcpp: "#.set_font(@)".}
# `t` is actually `const std::string_view &` type. char* is implicitly converted to it.
proc text*(this: PicoGraphics; t: cstring; p: Point; wrap: int32; s: cfloat = 2.0; a: cfloat = 0.0; letter_spacing: uint8 = 1; fixed_width: bool = false) {.importcpp: "#.text(@)".}

proc constructPicoGraphicsPenRGB332*(width, height: uint16, frame_buffer: pointer): PicoGraphics_PenRGB332 {.importcpp: "PicoGraphics_PenRGB332(@)", constructor.}

type
  DisplayDriver* {.importcpp: "pimoroni::DisplayDriver", inheritable.} = object
    width*, height*: uint16

proc update*(this: DisplayDriver; graphics: ptr PicoGraphics) {.importcpp: "#.update(@)".}
proc setBacklight*(this: DisplayDriver; brightness: uint8) {.importcpp: "#.set_backlight(@)".}
