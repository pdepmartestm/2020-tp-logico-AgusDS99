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
%listaDeInvitados(["agustin","gabriel","martin","lucia","lucas","martina","javier","camila"]).

estaDisponible(agustin).
estaDisponible(gabriel).
estaDisponible(martin).
estaDisponible(lucia).
estaDisponible(lucas).
estaDisponible(martina).
estaDisponible(camila).

viveEn(agustin,ciudadEvita).
viveEn(gabriel,ciudadEvita).
viveEn(martin,parqueChacabuco).
viveEn(lucia,mataderos).
viveEn(lucas,sanJusto).
viveEn(martina,boedo).
viveEn(javier,almagro).
viveEn(camila,almagro).

clima(ciudadEvita,noEstaLloviendo).
clima(parqueChacabuco,estaLloviendo).
clima(mataderos,noEstaLloviendo).
clima(sanJusto,noEstaLloviendo).
clima(boedo,noEstaLloviendo).
clima(almagro,noEstaLloviendo).

quedaEn(ciudadEvita,laMatanza).
quedaEn(sanJusto,laMatanza).
quedaEn(almagro,bsas).
quedaEn(boedo,bsas).
quedaEn(mataderos,bsas).
quedaEn(parqueChacabuco,bsas).

%% Se toma en cuenta vivir cerca como estar dentro de CABA o La Matanza).

estaCerca(UnaCiudad,UnaCiudad).
estaCerca(UnaCiudad,OtraCiudad):-
    quedaEn(UnaCiudad,Zona),
    quedaEn(OtraCiudad,Zona).

leGustaElAsado(agustin).
leGustaElAsado(gabriel).
leGustaElAsado(martin).
leGustaElAsado(lucia).
leGustaElAsado(lucas).
leGustaElAsado(martina).

%% Me permite conocer si a un invitado le alcanza el dinero para el asado. En caso de no alcanzarle el resto pondrá lo que falta por él. Es por eso que no es determinante para saber
%% si puede asistir o no. El calculo se realiza en base al dinero que tiene disponible menos el dinero que debe gastar en viaje.

leAlcanzaElDineroA(Invitado,DineroGastadoEnViaje,DineroDisponible) :-
    invitado(Invitado),
    (DineroDisponible - DineroGastadoEnViaje) >=300.

%% Con el predicado "puedeAsistir(Invitado,Ciudad") se puede consultar si determinada persona puede asistir al asado. También, para obtener la totalidad de personas que pueden asistir,
%% se puede aplicar el concepto de inversibilidad para que me indique quién o quiénes hacen cumplir el predicado.

puedeAsistir(Invitado,CiudadAsado) :-
    invitado(Invitado),
    estaDisponible(Invitado),
    clima(CiudadAsado,noEstaLloviendo),
    viveEn(Invitado,Ciudad),
    estaCerca(Ciudad,CiudadAsado),
    leGustaElAsado(Invitado).