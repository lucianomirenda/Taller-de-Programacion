program untitled;
const
	rubros = 8;
type
	rangoRubro = 1..rubros;

	producto = record
		codigo:integer;
		codigoRubro:rangoRubro;
		precio:real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		prod:producto;
		sig:lista;
	end;
	
	vProductos = array[rangoRubro] of lista;
	vRubro3 = array[1..30] of producto;
procedure crearLista(var v:vProductos);
var
	i:integer;
begin
	for i:=1 to rubros do
		v[i]:= nil;
end;
procedure leerProducto(var p:producto);
begin
	writeln('Ingrese el precio');
	readln(p.precio);
	if(p.precio <> 0)then begin
		writeln('Ingrese el código de producto');
		readln(p.codigo);
		writeln('Ingrese el código de rubro');
		readln(p.codigoRubro);
	end;
end;
procedure insertarOrdenado(var l:lista;p:producto);
var
	nuevo,act,ant:lista;
begin
	new(nuevo);
	nuevo^.prod:= p;
	
	act:= l;
	ant:= l;
	
	while(act <> nil)and(act^.prod.codigo < p.codigo)do begin
		ant:= act;
		act:= act^.sig;
	end;
	
	if(act = ant)then
		l:= nuevo
	else
		ant^.sig:= nuevo;
	nuevo^.sig:= act;

end;
procedure cargarLista(var v:vProductos);
var
	p:producto;
begin
	leerProducto(p);
	while(p.precio <> 0)do begin
		insertarOrdenado(v[p.codigoRubro],p);
		leerProducto(p);
	end;
end;
procedure mostrarProductos(v:vProductos);
var
	i:integer;
begin
	for i:= 1 to rubros do begin
		writeln('Códigos del rubro',i);
		if(v[i] = nil)then writeln('No hay productos de ese rubro');
		while(v[i] <> nil)do begin
			writeln('Codigo: ',v[i]^.prod.codigo);
			v[i]:= v[i]^.sig;
		end;
	end;
end;
procedure cargarVectorRubro3(l:lista;var v:vRubro3;var dl:integer);
begin
	dl:= 0;
	while(l <> nil) and (dl < 30)do begin
		dl:= dl + 1;
		v[dl]:= l^.prod;
		l:= l^.sig;
	end;
end;
procedure imprimirV3(v:vRubro3;dl:integer);
var
	i:integer;
begin
	for i:=1 to dl do 
		writeln('Producto ',i, '. Codigo: ',v[i].codigo);
end;
procedure ordenarVector3(var v:vRubro3;dl:integer);
var 
	pos:integer;
begin
end;
var
	v:vProductos;
	v3:vRubro3;
	dlV3:integer;
BEGIN
	crearLista(v);
	cargarLista(v);
	mostrarProductos(v);
	cargarVectorRubro3(v[3],v3,dlV3);	
	imprimirV3(v3,dlV3);
	
END.

