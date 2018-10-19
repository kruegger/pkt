-define(IGMP_MEMBERSHIP_QUERY, 16#11).
-define(IGMP_V1_MEMBERSHIP_REPORT, 16#12).
-define(IGMP_V2_MEMBERSHIP_REPORT, 16#16).
-define(IGMP_V3_MEMBERSHIP_REPORT, 16#22).
-define(IGMP_LEAVE_GROUP, 16#17).


-record(igmp_group, {
  type = 0,
  addr,
  sources = [],
  aux = <<>>
  }).

-record(igmp, {
        type = 0 :: pkt:uint8_t(),
        code = 0 :: pkt:uint8_t(),
        csum = 0 :: pkt:uint16_t(),
        group :: pkt:in_addr() | [#igmp_group{}]
    }).
