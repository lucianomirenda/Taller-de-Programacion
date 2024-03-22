program untitled;
const
	df = 3;
type
	rubroRango = 1..df;
	
	infoProd = record
		codigo:integer;
		stock:integer;
		precio:real;
	end;
	
	producto = record
		rubro:rubroRango;
		info:infoProd;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		prod:infoProd;
		hi:arbol;
		hd:arbol;
	end;
	
	vecProductos = array[rubroRango] of arbol;
	
	mayores = record
		codigo:integer;
		stock:integer;
	end;
	
	
	vecMayores = array[rubroRango] of mayores;
	
	vecCantidades = array[rubroRango] of integer;
	

procedure initVector(var v:vecProductos);
var
	i:rubroRango;
begin
	for i:=1 to df do 
		v[i]:= nil;
end;

procedure cargarVector(var v:vecProductos);
	
	procedure leerProducto(var p:producto);
	begin
		writeln('Ingresa el código de producto');
		readln(p.info.codigo);
		if(p.info.codigo <> -1)then begin
			writeln('Ingresa el rubro del producto');
			readln(p.rubro);
			writeln('Ingresa el stock');
			readln(p.info.stock);
			writeln('Ingresa el precio unitario');
			readln(p.info.precio);
		end;
	end;
	
	procedure insertarArbol(var a:arbol;p:infoProd);
	begin
		if(a = nil)then begin
			new(a);
			a^.prod:= p;
			a^.hi:= nil;
			a^.hd:= nil;
		end else
			begin
				if(a^.prod.codigo > p.codigo)then
					insertarArbol(a^.hi,p)
				else
					insertarArbol(a^.hd,p);
			end;
	end;
	
var
	p:producto;
begin
	leerProducto(p);
	while(p.info.codigo <> -1)do begin
		insertarArbol(v[p.rubro],p.info);
		leerProducto(p);
	end;
end;

function buscarProducto(v:vecProductos;rubro:integer;codigo:integer):boolean;
	
	function existeProducto(a:arbol;codigo:integer):boolean;
	begin
		if(a <> nil)then begin
			if(a^.prod.codigo = codigo)then begin
				existeProducto:= true
		end else begin
				if(a^.prod.codigo > codigo)then
					existeProducto:= existeProducto(a^.hi,codigo)
				else
					existeProducto:= existeProducto(a^.hd,codigo);
		end;
	end else
		existeProducto:= false;
	
	end;

begin
	buscarProducto:= existeProducto(v[rubro],codigo);
end;

function buscarProducto2(v:vecProductos;rubro:integer;codigo:integer):boolean;
begin
	if(v[rubro]<>nil)then begin
		if(v[rubro]^.prod.codigo = codigo)then
			buscarProducto2:= true
		else 
			if(v[rubro]^.prod.codigo > codigo)then
				buscarProducto2:= buscarProducto2(v[rubro]^.hi,codigo)
			else
				buscarProducto2:= buscarProducto2(v[rubro]^.hd,codigo)
	end else
		buscarProducto2:= false;
end;




procedure codigosMayores(v:vecProductos;var vM:vecMayores);
	
	procedure buscarMayor(a:arbol;var m:mayores);
	begin
		if(a <> nil)then begin
			if(a^.hd <> nil)then
				buscarMayor(a^.hd,m)
			else begin
				m.codigo:= a^.prod.codigo;
				m.stock:= a^.prod.stock;
			end;
			
		end
	end;



var
	i:integer;
begin
	for i:=1 to df do begin
		buscarMayor(v[i],vM[i]);
	end;
	
end;

procedure imprimirMayores(v:vecMayores);
var
	i:integer;
begin
	for i:=1 to df do begin
		writeln('El codigo del rubro ',i,' es: ',v[i].codigo);
	end;
end;

procedure retornarVectorCantidades(v:vecProductos;var vC:vecCantidades;codigo1,codigo2:integer);

	function cantCodigos(a:arbol;codigo1,codigo2:integer):integer;
	begin
		if(a <> nil)then begin
			if(codigo1 < a^.prod.codigo)and(a^.prod.codigo < codigo2)then begin
				cantCodigos:= cantCodigos(a^.hi,codigo1,codigo2) + cantCodigos(a^.hd,codigo1,codigo2) + 1;
			end
			else begin
				if(codigo1 > a^.prod.codigo)then
					cantCodigos:= cantCodigos(a^.hd,codigo1,codigo2)
				else
					cantCodigos:= cantCodigos(a^.hi,codigo1,codigo2);				
			end;
		end
		else
			cantCodigos:= 0;
	end;

var
	i:integer;
begin
	for i:=1 to df do begin
		vC[i]:= cantCodigos(v[i],codigo1,codigo2);
	end;
	
end;

procedure imprimirCantidades(v:vecCantidades);
var
	i:integer;
begin
	for i:=1 to df do begin
		writeln('La cantidad en el rubro ',i,' es: ',v[i]);
	end;
end;


var 
	v:vecProductos;
	vM:vecMayores;
	vC:vecCantidades;
	rubro,codigo,cod1,cod2:integer;
BEGIN
	initVector(v);
	cargarVector(v);
	
	writeln('Ingrese el rubro');
	readln(rubro);
	writeln('Ingrese el codigo');
	readln(codigo);
	
	if(buscarProducto2(v,rubro,codigo))then
		writeln('El producto existe')
	else
		writeln('El producto no existe');
	
	codigosMayores(v,vM);
	imprimirMayores(vM);
	
	writeln('Ingrese el codigo 1');
	readln(cod1);
	writeln('Ingrese el codigo 2');
	readln(cod2);
	retornarVectorCantidades(v,vc,cod1,cod2);
	imprimirCantidades(vc);
END.

