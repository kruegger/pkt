%% From http://en.wikipedia.org/wiki/EtherType
-define(ETH_P_IP, 16#0800).
-define(ETH_P_ARP, 16#0806).
-define(ETH_P_XNS_COMPATIBLE, 16#0807).
-define(ETH_P_WOL, 16#0842).
-define(ETH_P_DECMOP, 16#6002).
-define(ETH_P_RARP, 16#8035).
-define(ETH_P_IPV6, 16#86DD).
-define(ETH_P_802_1Q, 16#8100).
-define(ETH_P_IPX, 16#8137).
-define(ETH_P_802_1X, 16#888E).
-define(ETH_P_802_1QinQ, 16#88a8).
-define(ETH_P_LLDP, 16#88CC).
-define(ETH_P_MPLS_UNI, 16#8847).
-define(ETH_P_MPLS_MULTI, 16#8848).
-define(ETH_P_IEEE_OUI_EXT, 16#88B7).
-define(ETH_P_LLTD, 16#88D9).
-define(ETH_P_802_11R, 16#890D).
-define(ETH_P_CTP, 16#9000).


-record(ether, {
    dhost = <<0,0,0,0,0,0>> :: <<_:48>>,
    shost = <<0,0,0,0,0,0>> :: <<_:48>>,
    type = ?ETH_P_IP :: pkt:uint16_t(),
    crc = 0 :: pkt:bit4()
}).
