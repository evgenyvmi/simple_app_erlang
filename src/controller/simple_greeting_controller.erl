-module(simple_greeting_controller, [Req]).
-export([hello/2]).
 
hello('GET', []) ->
    {output, "<strong>Rahm says hello!</strong>"}.