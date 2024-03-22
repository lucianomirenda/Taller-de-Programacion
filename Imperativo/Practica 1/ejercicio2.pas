program ejercicio2;
type
	
	lista2 = ^nodo2;
	
	nodo2 = record
		codigo:integer;
		sig:lista2;
	end;

	lista = ^nodo;
	
	propiedad = record
		codigo:integer;
		tipo:string;
		precio:real;
	end;
	
	nodo = record
		prop:propiedad;
		sig:lista;
	end;
	
	vZonas = array[1..5] of lista;
	
procedure leerPropiedad(var p:propiedad;precioMetros:real);
var
	metros:real;
begin
	writeln('Ingrese los metros');
	readln(metros);
	writeln('Ingrese el código');
	readln(p.codigo);
	writeln('Ingrese el tipo');
	readln(p.tipo);
	p.precio:= precioMetros*metros;

end;
procedure insertarOrdenado(var l:lista;p:propiedad);
var
	ant,act,nuevo:lista;
begin
	new(nuevo);
	nuevo^.prop:= p;
	
	ant:= l;
	act:= l;
	
	while((act <> nil) and (p.tipo > act^.prop.tipo))do begin
		ant:= act;
		act:= act^.sig;
	end;
	
	if(ant = act)then 
		l:= nuevo
	else
		ant^.sig:= nuevo;
		
	nuevo^.sig:= act;
end;
procedure cargarVector(var v:vZonas);
var
	zona:integer;
	precioMetros:real;
	p:propiedad;
begin
	writeln('Ingrese el precio por metro');
	readln(precioMetros);
	while(precioMetros <> -1)do begin
		writeln('Ingrese la zona');
		readln(zona);
		leerPropiedad(p,precioMetros);
		insertarOrdenado(v[zona],p);
		writeln('Ingrese el precio por metro');
		readln(precioMetros);	
	end;
end;
procedure agregarAdelante(var l2:lista2;cod:integer);
var
	nuevo:lista2;
begin
	new(nuevo);
	nuevo^.codigo:= cod;
	nuevo^.sig:= l2;
	l2:= nuevo;
end;
procedure retornoCodigos(v:vZonas;zona:integer;tipo:string;var l2:lista2);
var
	fin:boolean;
begin
	fin:= false;
	while((v[zona] <> nil) and (not fin))do begin
		while((v[zona] <> nil) and (tipo = v[zona]^.prop.tipo))do begin
			agregarAdelante(l2,v[zona]^.prop.codigo);
			v[zona]:= v[zona]^.sig;			
			if(v[zona] <> nil)then begin
				if(tipo <> v[zona]^.prop.tipo)then
					fin:= true;
			end;
		end;
		if((v[zona] <> nil) and (not fin))then
			v[zona]:= v[zona]^.sig;
	end;
end;
procedure crearListasVector(var v:vZonas);
var
	i:integer;
begin
	for i:=1 to 5 do 
		v[i]:= nil;
end;
procedure imprimirLista2(l:lista2);
begin
	while(l <> nil)do begin
		writeln(l^.codigo);
		writeln('--');
		l:= l^.sig;
	end;
end;
var 
	vector:vZonas;
	l2:lista2;
	tipo:string;
	zona:integer;
begin
	crearListasVector(vector);
	l2:= nil;
	cargarVector(vector);
	writeln('Elija una zona');
	readln(zona);
	writeln('Elija un tipo');
	readln(tipo);
	retornoCodigos(vector,zona,tipo,l2);
	imprimirLista2(l2);
end.




















