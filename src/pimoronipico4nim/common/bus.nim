import hidecmakelinkerpkg/libconf

initLibParams(backendLang = blCpp,
              cmakeStmts = [initCMakeInclude("common/pimoroni_bus", depend = "initPicoSDK")]).config()


{.push header: "common/pimoroni_bus.hpp".}

type
  ParallelPins* {.importcpp: "pimoroni::ParallelPins".} = object
    cs*, dc*, wr_sck*, rd_sck*, d0*, bl*: cuint
