-module(newborn).

-export([hello_world/0]).

hello_world() ->
    Start = erlang:system_time(),
    lager:log(error,self(),"logging a message "),  
    exometer:update_or_create([newborn,hello_world], erlang:system_time() - Start),
ok.