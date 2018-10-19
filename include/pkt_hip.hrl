-record(hip, {
              nexthdr :: pkt:uint8_t(),
              len :: pkt:uint8_t(),
              type,
              version = 0 :: pkt:bit4(),
              sum :: pkt:uint16_t(),
              control :: pkt:uint16_t()
             }).
