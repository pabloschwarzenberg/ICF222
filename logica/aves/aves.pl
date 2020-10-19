:- dynamic disco_facial_corazon/1,penachos/1,rayas_transversales/1,rayas_verticales/1,moteado/1,emplumados/1,forma/2.
cabeza(X) :- ave(X).
cola(X) :- ave(X).
pecho(X) :- ave(X).
alas(X) :- ave(X).
plumaje(X) :- ave(X).
patas(X) :- ave(X).
dedos(X) :- patas(X).
vertebrado(X) :- ave(X).
ave(pequen).
ave(X) :- estrigiforme(X).
disco_facial(X) :- estrigiforme(X).

es(X,Y) :- ave(X),forma(disco_facial(X),corazon),Y=lechuza.
es(X,Y) :- ave(X),penachos(X),not(emplumados(dedos(X))),Y=tucuquere.
es(X,Y) :- ave(X),penachos(X),emplumados(dedos(X)),Y=nuco.
es(X,Y) :- ave(X),rayas_transversales(pecho(X)),Y=concon.
es(X,Y) :- ave(X),moteado(plumaje(X)),Y=pequen.
es(X,Y) :- ave(X),moteado(alas(X)),cafe(bandas(cola(X))),castano(bandas(cola(X))),Y=chuncho_austral.
es(X,Y) :- ave(X),moteado(alas(X)),cafe(bandas(cola(X))),blanco(bandas(cola(X))),Y=chuncho_nortino.
que_es(X) :- es(X,Y),write(Y).

moteado(plumaje(pequen)).

% assert(ave(x))
% assert(disco_facial(x)).
% assert(forma(disco_facial(x),corazon)).
% que_es(x).