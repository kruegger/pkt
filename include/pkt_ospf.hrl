-record(ospf, {
    version :: pkt:uint8_t(),
    type :: pkt:uint8_t(),
    len :: pkt:uint16_t(),
    router_id :: pkt:uint32_t(),
    area_id :: pkt:uint32_t(),
    sum :: pkt:uint16_t(),
    auth_type :: pkt:uint16_t(),
    authentication :: <<_:64>>
}).
