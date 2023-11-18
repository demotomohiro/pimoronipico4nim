import pimoronipico4nim
import pimoronipico4nim/common/[common, bus]
import pimoronipico4nim/libraries/tufty2040
import pimoronipico4nim/drivers/st7789
import pimoronipico4nim/libraries/picographics
import hidecmakelinkerpkg/libconf

writeHideCMakeToFile()

proc main =
  var
    tufty = constructTufty2040()
    st7789obj = constructST7789(tufty2040.Width.uint16,
                                tufty2040.Height.uint16,
                                ROTATE_180,
                                ParallelPins(cs: tufty2040.LCD_CS,
                                             dc: tufty2040.LCD_DC,
                                             wr_sck: tufty2040.LCD_WR,
                                             rd_sck: tufty2040.LCD_RD,
                                             d0: tufty2040.LCD_D0,
                                             bl: tufty2040.BACKLIGHT))
    graphics = constructPicoGraphicsPenRGB332(st7789obj.width, st7789obj.height, nil)

  st7789obj.setBacklight(255)

  template font: untyped = font8

  let
    WHITE = graphics.create_pen(255, 255, 255)
    BG = graphics.createPen(50, 20, 10)
    textLocation = constructPoint(0, 0)
    textLocation2 = constructPoint(0, (font.height.int32 + 1) * 2)

  graphics.setFont(addr font)

  var
    x = 0
    dx = 2

  while true:
    graphics.setPen(BG)
    graphics.clear()
    graphics.setPen(WHITE)
    graphics.text("Hello World From Nim!\nMulti lines test", textLocation, 320, 1.0)
    graphics.text("Third text line", textLocation2, 320, 1.0)

    let loc = constructPoint(x, 120)
    graphics.text("Moving text", loc, 320, 1.0)
    x += dx
    if x <= 0:
      dx = 2
    elif x >= 300:
      dx = -2

    st7789obj.update(addr graphics)

main()
