-module(simple_home_controller, [Req]).
-compile(export_all).

index('GET', []) ->
    {ok, [{hello, "hi"}]}.