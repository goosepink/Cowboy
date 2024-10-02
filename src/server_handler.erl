%% Declaración del módulo y exportación de funciones
-module(server_handler).
-export([init/2]).

%% Función de inicialización del manejador
init(Req, State) ->
    %% Enviar una respuesta HTTP 200 con "¡Hola Mundo desde Cowboy!"
    {ok, Resp} = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"¡Hola Mundo desde Cowboy!">>,
        Req),
    %% Terminar el proceso
    {ok, Resp, State}.
