{.push header: "common/pimoroni_common.hpp".}

type
  Rotation* {.importcpp: "pimoroni::Rotation".} = enum
    ROTATE_0 = 0,
    ROTATE_90 = 90,
    ROTATE_180 = 180,
    ROTATE_270 = 270
