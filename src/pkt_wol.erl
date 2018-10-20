%% Copyright (c) 2009-2017, Michael Santos <michael.santos@gmail.com>
%% Copyright (c) 2018, Stephen Han <stephen.han@hmatix.com>
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
-module(pkt_wol).

-include("pkt_ether.hrl").
-include("pkt_wol.hrl").

-compile(export_all).
-export([codec/1]).

codec(<<Sync:6/bytes, TargetMacBin:96/bytes>>) ->
    TargetMacList = parse_target_mac(TargetMacBin),
    {#wol{
	sync = Sync, tmac = TargetMacList, password = undefined
    }, <<>>};
codec(<<Sync:6/bytes, TargetMacBin:96/bytes, Password/binary >>) ->
    TargetMacList = parse_target_mac(TargetMacBin),
    {#wol{
	sync = Sync, tmac = TargetMacList, password = Password
    }, <<>>};
codec(#wol{
	 sync = Sync, tmac = TargetMacList, password = undefined
    }) ->
    TargetMacBin = format_target_mac(TargetMacList),
    <<Sync:6/bytes, TargetMacBin:96/bytes>>;
codec(#wol{
	 sync = Sync, tmac = TargetMacList, password = Password
    }) when is_binary(Password) ->
    TargetMacBin = format_target_mac(TargetMacList),
    <<Sync:6/bytes, TargetMacBin:96/bytes, Password/binary>>.

parse_target_mac(<<>>) -> [];
parse_target_mac(<<A1,A2,A3,A4,A5,A6,T/binary>>) ->
    [<<A1, A2, A3, A4, A5, A6>>|parse_target_mac(T)].

format_target_mac(TargetMacList) ->
    F = fun(A, B) -> <<A/binary, B/binary>> end,
    lists:foldr(F, <<>>, TargetMacList).
