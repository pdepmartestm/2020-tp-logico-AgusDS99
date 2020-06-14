%% Base de conocimiento

%% El punto de encuentro es en Ciudad Evita. El organizador es agustin.

invitado(agustin).
invitado(gabriel).
invitado(martin).
invitado(lucia).
invitado(lucas).
invitado(martina).
invitado(javier).
invitado(camila).

%% Para más organización se colocó en una lista a todos los invitados. Utilizando la funcion member se puede consultar si determinada persona está dentro de la lista de invitados.

listaDeInvitados(["agustin","gabriel","martin","lucia","lucas","martina","javier","camila"]).

estaDisponible(agustin).
estaDisponible(gabriel).
estaDisponible(martin).
estaDisponible(lucia).
estaDisponible(lucas).
estaDisponible(martina).
estaDisponible(camila).

viveEn(agustin,ciudadEvita,noEstaLloviendo).
viveEn(gabriel,ciudadEvita,noEstaLloviendo).
viveEn(martin,parqueChacabuco,estaLloviendo).
viveEn(lucia,mataderos,noEstaLloviendo).
viveEn(lucas,sanJusto,noEstaLloviendo).
viveEn(martina,boedo,noEstaLloviendo).
viveEn(javier,almagro,noEstaLloviendo).
viveEn(camila,almagro,noEstaLloviendo).

%% Se toma en cuenta vivir cerca como estar dentro de CABA o La Matanza).

viveCerca(agustin).
viveCerca(gabriel).
viveCerca(martin).
viveCerca(lucia).
viveCerca(lucas).
viveCerca(martina).
viveCerca(javier).
viveCerca(camila).

leGustaElAsado(agustin,leGusta).
leGustaElAsado(gabriel,leGusta).
leGustaElAsado(martin,leGusta).
leGustaElAsado(lucia,leGusta).
leGustaElAsado(lucas,leGusta).
leGustaElAsado(martina,leGusta).
leGustaElAsado(javier,noLeGusta).

%% Me permite conocer si a un invitado le alcanza el dinero para el asado. En caso de no alcanzarle el resto pondrá lo que falta por él. Es por eso que no es determinante para saber
%% si puede asistir o no. El calculo se realiza en base al dinero que tiene disponible menos el dinero que debe gastar en viaje.

leAlcanzaElDineroA(Invitado,DineroGastadoEnViaje,DineroDisponible) :-
    invitado(Invitado),
    (DineroDisponible - DineroGastadoEnViaje) >=300.

%% Con el predicado "puedeAsistir(Invitado,Ciudad") se puede consultar si determinada persona puede asistir al asado. También, para obtener la totalidad de personas que pueden asistir,
%% se puede aplicar el concepto de inversibilidad para que me indique quién o quiénes hacen cumplir el predicado.

puedeAsistir(Invitado,Ciudad) :-
    invitado(Invitado),
    estaDisponible(Invitado),
    viveEn(Invitado,Ciudad,noEstaLloviendo),
    viveCerca(Invitado),
    leGustaElAsado(Invitado,leGusta).