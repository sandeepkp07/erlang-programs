-module(area_of_shapes).
-export([area/1,perimetre/1,hypo_size/2,square/1,enclose/1]).

hypo_size(B,C) -> % Used for right angle triangles.
	math:sqrt(square(B) + square(C)).

square(X) ->
   X*X.

area({circle, {_,_}, R}) when R>0 ->  % Value of the geometrical centre is not at all important.
   math:pi()*R*R;
area({rectangle, {_,_}, H,W}) when (W>0) and (H>0) ->
   H*W;
area({right_tri, B,H}) when (B>0) and (H>0) ->
   B*H/2;
area({tri, S1,S2,S3}) when (S1>0) and (S2>0) and( S3>0) ->
  S = (S1+S2+S3)/2, 
  math:sqrt(S*(S-S1)*(S-S2)*(S-S3)).


perimetre({circle, {_,_}, R}) when R>0 ->
   math:pi()*2*R;
perimetre({rectangle, {_,_}, H,W}) when (H>0) and (W>0)  ->
   (H+W)*2;
perimetre({right_tri, B,H}) when (B>0) and (H>0) ->
   B+H+hypo_size(B,H);
perimetre({tri, S1,S2,S3}) when (S1>0) and (S2>0) and (S3>0)  ->
   S1+S2+S3.


enclose({circle, {X,Y}, R}) when R>0 ->
   ({rectangle,  {X,Y},  R*2, R*2}); % Smallest rectangle enclosing this circle will be a square of side length equal to double of radius.
enclose({rectangle, {_X,_Y}, H,W}) when (H>0) and (W>0)  ->
   ({rectangle, {_X,_Y}, H,W});  % Same rectangle will be the smallest one.
enclose({right_tri, B,H}) when (B>0) and (H>0) ->
   ({rectangle,  B,H});  % I am not interested in finding the mid point of this rectangle. 
enclose({tri, S1,S2,S3}) when (S1>0) and (S2>0) and (S3>0) ->
    ({rectangle, max(max(S1,S2),S3), hypo_size(S1,(S2/2))}).  %I am not sure about this; It's only a wild guess, but I think thats enough.  






%Output:


%Eshell V8.2.1  (abort with ^G)
%1> c(area_of_shapes).
%{ok,area_of_shapes}
%2> area_of_shapes: area({circle, {5,10}, 12}).
%452.3893421169302
%3> area_of_shapes: perimetre({circle, {5,10}, 12}).
%75.39822368615503
%4> area_of_shapes: enclose({circle, {5,10}, 12}).  
%{rectangle,{5,10},24,24}
%5> area_of_shapes: area({rectangle, {5,10}, 10,12}).
%120
%6> area_of_shapes: perimetre({rectangle, {5,10}, 10,12}).
%44
%7> area_of_shapes: enclose({rectangle, {5,10}, 10,12}).  
%{rectangle,{5,10},10,12}
%8> area_of_shapes: area({right_tri,  6,8}).              
%24.0
%9> area_of_shapes: perimetre({right_tri,  6,8}).
%24.0
%10> area_of_shapes: enclose({right_tri,  6,8}).  
%{rectangle,6,8}
%11> area_of_shapes: area({tri,  3,4,5}).       
%6.0
%12> area_of_shapes: perimetre({tri,  3,4,5}).
%12
%13> area_of_shapes: enclose({tri,  3,4,5}).  
%{rectangle,5,3.605551275463989}
