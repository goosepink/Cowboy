%%%-------------------------------------------------------------------
%% @doc server_cowboy public API
%% @end
%%%-------------------------------------------------------------------

-module(server_cowboy_app).

-behaviour(application).

-export([start/2, stop/1]).

%% Iniciar la aplicación
start(_Type, _Args) ->
    %% Definir las rutas
    Dispatch = cowboy_router:compile([
        {'_', [
            {"/", server_handler, []},
	{"/saludar", saludar_handler, []}
        ]}
    ]),
    %% Iniciar Cowboy en el puerto 8080
    {ok, _} = cowboy:start_clear(http_listener,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}),
    server_cowboy_sup:start_link().

%% Detener la aplicación
stop(_State) ->
    ok.
