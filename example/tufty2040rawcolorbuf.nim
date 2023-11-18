import pimoronipico4nim
import pimoronipico4nim/common/[common, bus]
import pimoronipico4nim/libraries/tufty2040
import pimoronipico4nim/drivers/st7789mini
import hidecmakelinkerpkg/libconf

writeHideCMakeToFile()

var colorBuf: array[tufty2040.Width * tufty2040.Height, uint16]

func bswap(x: uint16): uint16 = (x shl 8) or (x shr 8)

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

  st7789obj.setBacklight(255)

  var n = 0'u16

  while true:
    for y in 0 ..< tufty2040.Height:
      for x in 0 ..< tufty2040.Width:
        let c = (x.uint16 shr 1 + n.uint16) and 31
        colorBuf[y * tufty2040.Width + x] = bswap(
          if y < tufty2040.Height div 4:
            (c shl 11) or (c shl 6) or c
          elif y < tufty2040.Height div 2:
            c shl 11
          elif y < tufty2040.Height div 4 * 3:
            c shl 6
          else:
            c
          )

    st7789obj.update(cast[ptr UncheckedArray[uint16]](addr colorBuf))
    inc n

main()
