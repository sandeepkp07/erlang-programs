-module(test_loop).
-export([loop/1]).
loop(N) when N>0 ->
io:format("~p~n", [N]),
loop(N-1);
loop(0) ->
0.
