-record(eigrp, {
    version :: pkt:uint8_t(),
    opcode :: pkt:uint8_t(),
    sum :: pkt:uint16_t(),
    flags :: pkt:uint32_t(),
    seq :: pkt:uint32_t(),
    ack :: pkt:uint32_t(),
    id :: pkt:uint16_t(),
    sysnum :: pkt:uint16_t()
}).
