%%%-------------------------------------------------------------------
%%% @author Aleksander
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. mar 2018 11:29
%%%-------------------------------------------------------------------
-module(test_module).
-author("Aleksander").
-export([power/2]).


power(_,0) -> 1;
power(X,Y) -> X * power(X,Y-1).

