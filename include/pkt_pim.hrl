-record(pim, {
    version :: pkt:bit4(),
    type :: pkt:bit4(),
    reserved :: pkt:uint8_t(),
    sum :: pkt:uint16_t()
}).
