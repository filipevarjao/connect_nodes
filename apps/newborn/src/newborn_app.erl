%%%-------------------------------------------------------------------
%% @doc newborn public API
%% @end
%%%-------------------------------------------------------------------

-module(newborn_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->

    case node() of 
        'nonode@nohost' -> 
        lager:log(warning,self(),"booted as no-node setting defaults",[]),
        set_defaults();
        Other -> 
        lager:log(warning,self(),"node : ~p",[Other])    
    end,
    exometer_admin:set_default([newborn,hello_world], counter, []),
    newborn_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================

set_defaults() ->

    {ok,NodeName} = application:get_env(newborn,node_name),
    {ok,Cookie} = application:get_env(newborn,erlang_cookie),
    lager:log(warning,self(),"running with default settings newborn name/cookie : ~p / ~p ",[NodeName,Cookie]),
    net_kernel:start([NodeName,longnames]),
    erlang:set_cookie(node(),Cookie),
    application:start(gen_rpc),
ok.