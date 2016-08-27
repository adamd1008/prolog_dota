/*
   Copyright (c) 2016 Adam Dodd
   
   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:
   
   The above copyright notice and this permission notice shall be included in
   all copies or substantial portions of the Software.
   
   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   SOFTWARE.
*/

:- [dota_items].

same_elements(X, Y) :-
   msort(X, S), msort(Y, S).

/*
   Predicate `quick_buy'
   
   Take an item and add its components to the resultant list.
   Do this recursively until a component item isn't a build. Then, just add the
   item itself.
*/

quick_buy(Item, Comps) :-
   item(Item), resolve_build([Item], Comps).

resolve_build([], []).

resolve_build([Item| Tail], Out) :-
   build(Item, B), !, resolve_build(B, C), resolve_build(Tail, A),
   append(C, A, Out).

resolve_build([Item| Tail], Out) :-
   resolve_build(Tail, A), append([Item], A, Out).

/*
   Predicate `build_contains(Item, Build)'
   
   List all builds that contain Item, or vice versa.
*/

build_contains(Item, Build) :-
   item(Item), build(Build, Items), member(Item, Items).
