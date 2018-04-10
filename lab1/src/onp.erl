%%%-------------------------------------------------------------------
%%% @author Aleksander
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. mar 2018 12:03
%%%-------------------------------------------------------------------
-module(onp).
-author("Aleksander").

%% API
-export([onp/1,solveOnp/2,isOperand/1]).
solveOnp([V_head|[V_head2|V_tail]],["+"|E_tail]) -> solveOnp([(V_head)+(V_head2)]++V_tail,E_tail);
solveOnp([V_head|[V_head2|V_tail]],["*"|E_tail]) -> solveOnp([(V_head)*(V_head2)]++V_tail,E_tail);
solveOnp([V_head|[V_head2|V_tail]],["/"|E_tail]) -> solveOnp([(V_head)/(V_head2)]++V_tail,E_tail);
solveOnp([V_head|[V_head2|V_tail]],["-"|E_tail]) -> solveOnp([(V_head)-(V_head2)]++V_tail,E_tail);
solveOnp([V_head|[V_head2|V_tail]],["pow"|E_tail]) -> solveOnp([math:pow((V_head),(V_head2))]++V_tail,E_tail);
solveOnp([V_head|V_tail],["sqrt"|E_tail]) -> solveOnp([math:sqrt((V_head))]++V_tail,E_tail);
solveOnp(V,[E_head|E_tail]) -> solveOnp(V++[E_head],E_tail);
solveOnp([V_head|_],[]) -> V_head.

isOperand("*")->"*";
isOperand("-")->"-";
isOperand("/")->"/";
isOperand("+")->"+";
isOperand("pow")->"pow";
isOperand("sqrt")->"sqrt";
isOperand(X) -> list_to_float(X).
onp(Expression) -> solveOnp([],lists:flatmap(fun(X)->[isOperand(X)] end,string:split(Expression," ", all))).


