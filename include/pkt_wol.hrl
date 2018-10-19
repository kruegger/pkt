-define(WOL_SYNC_STREAM, 16#FFFFFFFFFFFF).
-record(wol, {
        sync = <<0,0,0,0,0,0>> :: <<_:48>>,
        tmac = [] :: [<<_:48>>],
        password = <<>> :: binary()
    }).
