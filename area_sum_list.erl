-module(area_sum_list).
-export([area/1,tot_area/1,sum/1,sum/2,all_area/1]).


area({circle, {_,_}, R}) when R>0 -> 
    math:pi()*R*R;
  area({rectangle, {_,_}, H,W}) when (W>0) and (H>0) ->
     H*W;
  area({right_tri, B,H}) when (B>0) and (H>0) ->
     B*H/2;
  area({tri, S1,S2,S3}) when (S1>0) and (S2>0) and( S3>0) ->
    S = (S1+S2+S3)/2,
    math:sqrt(S*(S-S1)*(S-S2)*(S-S3)).

sum(Xs) ->
   sum(Xs,0).
sum([],P) ->
   P;
sum([X|Xs],P) ->
   sum(Xs, P+X).


tot_area(Shapes) ->
   sum([all_area(Shapes)]).

all_area([]) -> 
   [];
all_area([X|Xs]) ->
  [ area(X) | all_area(Xs)].

