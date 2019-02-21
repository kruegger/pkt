-record(eigrp, {
    version :: pkt:uint8_t(),
    opcode :: pkt:uint8_t(),
    sum :: pkt:uint16_t(),
    flags :: pkt:uint32_t(),
    seq_num :: pkt:uint32_t(),
    ack_num :: pkt:uint32_t(),
    router_id :: pkt:uint16_t(),
    sys_num :: pkt:uint16_t()
}).
