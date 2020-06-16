# Sale asado con los pibes
### Planteo del problema: 
Si no llueve en mi ciudad y la mayoría de mis amigos pueden, me junto con ellos y hago asado en mi casa. Hoy no está lloviendo y casi todos pueden. Por lo tanto hoy hago asado. 

### Requerimientos:
1. Debe estar invitado.
2. No debe llover en la ciudad de quien asiste.
3. Si no llueve y la mayoría puede debo hacer asado únicamente. Para esto a todos los que asistan les debe gustar el asado.
4. Debe ser en la casa del organizador. Para eso deben vivir cerca (se toma en cuenta vivir cerca como estar dentro de CABA o La Matanza).
5. Cada uno debe poner mínimo $300. En caso de no tener el dinero suficiente el resto pondrá lo que falta por él. No es determinante para poder asistir al asado.

### Conceptos empleados:

1. En el predicado "puedeAsistir(Invitado,Ciudad)." se puede aplicar el concepto de inversibilidad para conocer el listado de personas que pueden asistir al asado. En la terminal se utiliza una variable de tipo universal y realiza lo comentado anteriormente.
2. El predicado leAlcanzaElDineroA(Invitado,DineroGastadoEnViaje,DineroDisponible). me permite conocer si a un invitado le alcanza el dinero para el asado. En caso de no alcanzarle el resto pondrá lo que falta por él. Es por eso que no es determinante para saber si puede asistir o no. El calculo se realiza en base al dinero que tiene disponible menos el dinero que debe gastar en viaje.
3. Mediante el predicado length aplicado a la lista de invitados se puede consultar la cantidad de invitados al evento.
4. Con el predicado member se puede consultar si una determinada persona forma parte de la lista de invitados aplicado al predicado listaDeInvitados([...]).

