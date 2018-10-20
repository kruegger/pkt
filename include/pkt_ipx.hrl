-define(IPX_UNKNOWN_TYPE, 16#00).
-define(IPX_RIP_TYPE, 16#01).
-define(IPX_ECHO_TYPE, 16#02).
-define(IPX_PEP_TYPE, 16#04).
-define(IPX_SPX_TYPE, 16#05).
-define(IPX_NCP_TYPE, 16#11).


-record(ipx, {
              csum = 16#FFFF :: pkt:uint16_t(),
              len = 0 :: pkt:uint16_t(),
              control = 0 :: pkt:uint8_t(),
              type :: pkt:uint8_t(),
              daddr,
              saddr
             }).
