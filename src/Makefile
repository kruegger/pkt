include ../../../system/include.mk

include ../vsn.mk
VSN=$(PKT_VSN)

MODULES= pkt	\
	pkt_dlt	\
	pkt_arp	\
	pkt_rarp	\
	pkt_802_1q	\
	pkt_ipx	\
	pkt_802_1x	\
	pkt_vrrp	\
	pkt_ospf	\
	pkt_pim	\
	pkt_udp	\
	pkt_tcp	\
	pkt_sctp	\
	pkt_hip	\
	pkt_null	\
	pkt_mpls	\
	pkt_lldp	\
	pkt_llc	\
	pkt_linux_cooked	\
	pkt_ipv6_routing	\
	pkt_ipv6_hopopts	\
	pkt_ipv6_fragment	\
	pkt_ipv6_esp	\
	pkt_ipv6	\
	pkt_ipv6_dstopts	\
	pkt_ipv6_ah	\
	pkt_ipv4	\
	pkt_ipproto	\
	pkt_igmp	\
	pkt_icmp	\
	pkt_icmp6	\
	pkt_gre	\
	pkt_ether \
	pkt_wol \
	pkt_ctp \
	pkt_lltd \
	pkt_802_11r \
	pkt_ouiext	\
	pkt_decmop	\
	pkt_dec_lanbridge	\
	pkt_xnscomp	\
	pkt_unknown

EBIN_FILES=$(MODULES:%=../ebin/%.$(EMULATOR)) ../ebin/pkt.app
ERLC_FLAGS+=-I../include -I. 

#
# Targets
#

all: $(EBIN_FILES) 

debug:
	$(MAKE) ERLC_FLAGS+="$(ERLC_FLAGS) +debug_info -Ddebug"

clean:
	rm -f $(EBIN_FILES)

#../ebin/%.$(EMULATOR): %.erl
#	$(ERLC) -b$(EMULATOR) $(ERLC_FLAGS) -o ../ebin $<
