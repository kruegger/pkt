%% Copyright (c) 2009-2015, Michael Santos <michael.santos@gmail.com>
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
-module(pkt_eigrp).

-export([codec/1]).

-include("pkt_eigrp.hrl").

codec(<<Version:8, Opcode:8, Sum:16, Flags:32, SeqNum:32, AckNum:32, RouterId:16, SysNum:16, Payload/binary>>) ->
    {#eigrp{
        version = Version,
        opcode = Opcode,
        sum = Sum,
        flags = Flags,
        seq_num = SeqNum,
        ack_num = AckNum,
        router_id = RouterId,
        sys_num = SysNum
    }, Payload};
codec(#eigrp{version = Version, opcode = Opcode, sum = Sum, flags = Flags, seq_num = SeqNum, ack_num = AckNum, router_id = RouterId, sys_num = SysNum}) ->
    <<Version:8, Opcode:8, Sum:16, Flags:32, SeqNum:32, AckNum:32, RouterId:16, SysNum:16>>.
