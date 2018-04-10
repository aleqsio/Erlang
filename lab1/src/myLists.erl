%%%-------------------------------------------------------------------
%%% @author Aleksander
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. mar 2018 11:47
%%%-------------------------------------------------------------------
-module(myLists).
-author("Aleksander").

%% API
-export([contains/2,duplicateElements/1,sumFloats/1,sumFloats/2]).

contains([],Val) -> false;
contains([A|B], Val) -> A=:=Val orelse contains(B,Val).

duplicateElements([])-> [];
duplicateElements([A|B]) -> [A]++[A]++duplicateElements(B).


sumFloats([]) -> 0;
sumFloats([A|B])  when is_float(A) -> A + sumFloats(B);
sumFloats([A|B]) -> 0 + sumFloats(B).

sumFloats([],Acc) -> Acc;
sumFloats([A|B],Acc)  when is_float(A) -> sumFloats(B,Acc+A);
sumFloats([A|B],Acc) -> sumFloats(B,Acc).
