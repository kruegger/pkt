%% Copyright (c) 2009-2016, Michael Santos <michael.santos@gmail.com>
%% All rights reserved.
%%
%% Redistribution and use in source and binary forms, with or without
%% modification, are permitted provided that the following conditions
%% are met:
%%
%% Redistributions of source code must retain the above copyright
%% notice, this list of conditions and the following disclaimer.
%%
%% Redistributions in binary form must reproduce the above copyright
%% notice, this list of conditions and the following disclaimer in the
%% documentation and/or other materials provided with the distribution.
%%
%% Neither the name of the author nor the names of its contributors
%% may be used to endorse or promote products derived from this software
%% without specific prior written permission.
%%
%% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
%% "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
%% LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
%% FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
%% COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
%% INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
%% BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
%% LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
%% CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
%% LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
%% ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
%% POSSIBILITY OF SUCH DAMAGE.
-module(pkt_ether).

-include("pkt_ether.hrl").

-export([codec/1, type/1]).

type(?ETH_P_IP) -> ipv4;
type(?ETH_P_IPV6) -> ipv6;
type(?ETH_P_ARP) -> arp;
type(?ETH_P_LLDP) -> lldp;
%% IEEE 802.3 Ethernet
type(EtherType) when EtherType < 16#05DC -> llc;
%% 802.1Q Virtual LAN
type(?ETH_P_802_1Q) -> '802.1q';
%% IPX
type(?ETH_P_IPX) -> ipx;
%% 802.1X EAPoL
type(?ETH_P_802_1X) -> '802.1x';
%% 802.1ad (802.1q QinQ)
type(?ETH_P_802_1QinQ) -> '802.1qinq';
%% MPLS_
type(?ETH_P_MPLS_UNI) -> mpls;
type(?ETH_P_MPLS_MULTI) -> mpls;
%% Configuration Testing Protocol(Loopback)
type(?ETH_P_CTP) -> ctp;
%% Wake-On-LAN
type(?ETH_P_WOL) -> wol;
%% Link Layer Topology Discovery Protocol
type(?ETH_P_LLTD) -> lltd;
%% IEEE STD 802 - OUI Extended
type(?ETH_P_IEEE_OUI_EXT) -> ouiext;
%% 802.11r Fast Roaming Remote Request
type(?ETH_P_802_11R) -> '802.11r';
%% XNS Compatible
type(?ETH_P_XNS_COMPATIBLE) -> xnscomp;

%% DEC Maintenance Operation Protocol 
type(?ETH_P_DECMOP) -> decmop;

%% DEC LANBridge Protocol
type(?ETH_P_DEC_LANBRIDGE) ->
    dec_lanbridge;

%% Motorola MiNT Ethertype
type(?ETH_P_MINT) ->
     mint.

%% Unknown EtherType - we will enable this later once it is in production
%%type(-) -> unknown.

    

codec(<<Dhost:6/bytes, Shost:6/bytes, Type:16, Payload/binary>>) ->
%    Len = byte_size(Packet) - 4,
%    <<Payload:Len/bytes, CRC:4/bytes>> = Packet,
    {#ether{
       dhost = Dhost, shost = Shost,
       type = Type
      }, Payload};
codec(#ether{
       dhost = Dhost, shost = Shost,
       type = Type
      }) ->
    <<Dhost:6/bytes, Shost:6/bytes, Type:16>>.
