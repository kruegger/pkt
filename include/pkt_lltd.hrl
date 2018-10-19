-define(LLTD_TOS_TOPOLOGY_DISCOVERY, 16#00).
-define(LLTD_TOS_QUICK_DISCOVERY, 16#01).
-define(LLTD_TOS_QOS, 16#02).

%%
%% Function for TOS 0x00
%%

-define(LLTD_FUNCTION_DISCOVER, 16#00).
-define(LLTD_FUNCTION_HELLO, 16#01).
-define(LLTD_FUNCTION_EMIT, 16#02).
-define(LLTD_FUNCTION_TRAIN, 16#03).
-define(LLTD_FUNCTION_PROBE, 16#04).
-define(LLTD_FUNCTION_ACK, 16#05).
-define(LLTD_FUNCTION_QUERY, 16#06).
-define(LLTD_FUNCTION_QUERY_RESP, 16#07).
-define(LLTD_FUNCTION_RESET, 16#08).
-define(LLTD_FUNCTION_CHARGE, 16#09).
-define(LLTD_FUNCTION_FLAT, 16#0A).
-define(LLTD_FUNCTION_QUERY_LARGE_TLV, 16#0B).
-define(LLTD_FUNCTION_QUERY_LARGE_TLV_RESP, 16#0C).

%%
%% Function for TOS 0x02
%%

-define(LLTD_FUNCTION_QOS_INITIALIZESINK, 16#00).
-define(LLTD_FUNCTION_QOS_READY, 16#01).
-define(LLTD_FUNCTION_QOS_PROBE, 16#02).
-define(LLTD_FUNCTION_QOS_QUERY, 16#03).
-define(LLTD_FUNCTION_QOS_QUERY_RESP, 16#04).
-define(LLTD_FUNCTION_QOS_RESET, 16#05).
-define(LLTD_FUNCTION_QOS_ERROR, 16#06).
-define(LLTD_FUNCTION_QOS_ACK, 16#07).
-define(LLTD_FUNCTION_QOS_COUNTER_SNAPSHOT, 16#08).
-define(LLTD_FUNCTION_QOS_COUNTER_RESULT, 16#09).
-define(LLTD_FUNCTION_QOS_COUNTER_LEASE, 16#0A).


-record(lltd, {
	  version :: pkt:uint8_t(), 
	  tos :: pkt:uint8_t(),
	  function :: pkt:uint8_t(),
	  rdhost = <<0,0,0,0,0,0>> :: <<_:48>>,
	  rshost = <<0,0,0,0,0,0>> :: <<_:48>>,
	  id :: pkt:uint16_t()
}).
