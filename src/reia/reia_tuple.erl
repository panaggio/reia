-module(reia_tuple).
-export([funcall/3]).

%% Tuple#to_list
%%   Convert a tuple to a list
funcall({tuple, Tuple}, to_list, []) ->
  {list, {erlang:tuple_to_list(Tuple), normal}};
    
%% Tuple#to_s
%%   Generate a string representation of a Tuple
funcall({tuple, Tuple}, to_s, []) ->
  Elements = [reia_dispatch:funcall(Element, to_s, []) || Element <- erlang:tuple_to_list(Tuple)],
  String = reia_erl:r2e(reia_list:funcall({list, {Elements, normal}}, join, [reia_erl:e2r(",")])),
  reia_list:funcall({list, {lists:concat(["(", String, ")"]), normal}}, to_string, []).
  
  