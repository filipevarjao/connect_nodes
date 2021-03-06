-module(newborn_server).
 -behaviour(gen_server).
 -export([start_link/0]).
 -export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2,
         code_change/3]).

-define(NODECOUNT, 5).
%%%=============================================================================
%% API functions
%%%=============================================================================
start_link() ->
  gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).
 %%%=============================================================================
%% gen_server functions
%%%=============================================================================
 %% @hidden
init([]) ->
  % Sets current node's hostname and ensures it is alive before starting ?NODECOUNT slaves
  {ok, _Pid} = net_kernel:start(['newborn@127.0.0.1', longnames]),
  pong = net_adm:ping('newborn@127.0.0.1'),
  [spawn_node("newborn_" ++ integer_to_list(N)) || N <- lists:seq(1, ?NODECOUNT)],
  {ok, no_state}.

spawn_node(NodeName) ->
  NodeHost = '127.0.0.1',
  NodeOpts = "-setcookie " ++ atom_to_list(erlang:get_cookie()),
  slave:start_link(NodeHost, NodeName, NodeOpts).

%% @hidden
handle_call(_Request, _From, State) ->
  {reply, ok, State}.
 %% @hidden
handle_cast(_Msg, State) ->
  {noreply, State}.
 %% @hidden
handle_info(Msg, State) ->
  io:format("Unknown msg: ~p~n", [Msg]),
  {noreply, State}.
 %% @hidden
code_change(_OldVsn, State, _Extra) ->
  {ok, State}.
 %% @hidden
terminate(_Reason, _State) -> ok.
