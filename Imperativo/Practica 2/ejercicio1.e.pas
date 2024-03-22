program untitled;
type
	lista = ^nodo;
	
	nodo = record
		caracter:char;
		sig:lista;
	end;
	
procedure agregarFinal(var l:lista;c:char);
var
	nuevo,aux:lista;
begin
	new(nuevo);
	nuevo^.caracter:= c;
	nuevo^.sig:= nil;
	if(l = nil)then l:= nuevo
	else begin
		aux:= l;
		while(aux^.sig <> nil)do
			aux:= aux^.sig;
		aux^.sig:= nuevo;
	end;
end;
procedure cargarLista(var l:lista);
var
	c:char;
begin
	readln(c);
	if(c <> '.')then begin
		agregarFinal(l,c);
		cargarLista(l);
	end;
end;
procedure imprimirCaracteres(l:lista);
begin
	if(l <> nil)then begin
		writeln(l^.caracter);
		imprimirCaracteres(l^.sig);
	end;
end;
procedure imprimirCaracteresInverso(l:lista);
begin
	if(l <> nil)then begin
		imprimirCaracteresInverso(l^.sig);
		writeln(l^.caracter);
	end;
end;
var
	l:lista;
BEGIN
	l:= nil;
	cargarLista(l);

	imprimirCaracteresInverso(l);
	 
END.

