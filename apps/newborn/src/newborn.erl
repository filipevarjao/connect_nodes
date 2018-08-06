-module(newborn).

-export([hello_world/0]).

hello_world() ->
    Start = erlang:system_time(),
    lager:log(error,self(),"current metric : ~p " , [exometer:get_value([ newborn, hello_world ]) ]),  
    exometer:update_or_create([newborn,hello_world], erlang:system_time() - Start),
ok.
