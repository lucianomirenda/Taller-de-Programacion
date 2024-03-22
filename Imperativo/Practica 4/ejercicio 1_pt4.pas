program untitled;
type
	venta = record
		codVenta:integer;
		codProd:integer;
		cantUnidades:integer;
		precioUnidades:real;
	end;
	
	producto = record
		codProd:integer;
		cantVentas:integer;
		montoTotal:real;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		p:producto;
		hi:arbol;
		hd:arbol;
	end;


procedure cargarArbol(var a:arbol);

	procedure leerVenta(var v:venta);
	begin
		writeln('Ingrese el codigo de venta');
		readln(v.codVenta);
		if(v.codVenta <> -1)then begin
			writeln('Ingrese el codigo de producto');
			readln(v.codProd);
			writeln('Ingrese la cantidad de unidades');
			readln(v.cantUnidades);
			writeln('Ingrese el precio x unidad');
			readln(v.precioUnidades);
		end;
	end;
	
	procedure asignarProducto(v:venta;var p:producto);
	begin
		p.codProd:= v.codProd;
		p.cantVentas:= v.cantUnidades;
		p.montoTotal:= v.cantUnidades * v.precioUnidades;
	end;
	
	procedure agregarArbol(var a:arbol;p:producto);
	begin
		if(a = nil)then begin
			new(a);
			a^.p:= p;
			a^.hi:= nil;
			a^.hd:= nil;
		end else
			if(a^.p.codProd = p.codProd)then begin
				a^.p.montoTotal:= a^.p.montoTotal + p.montoTotal;
				a^.p.cantVentas:= a^.p.cantVentas + p.cantVentas;
			end
			else begin
				if(p.codProd < a^.p.codProd)then agregarArbol(a^.hi,p)
				else
					agregarArbol(a^.hd,p);
			end;
	end;
var
	p:producto;
	v:venta;
begin
	leerVenta(v);
	while(v.codVenta <> -1)do begin
		asignarProducto(v,p);
		agregarArbol(a,p);
		leerVenta(v);
	end;

end;
procedure imprimirArbol(a:arbol);
begin
	writeln;
	if(a<>nil)then begin
		imprimirArbol(a^.hi);
		writeln('Codigo de producto: ',a^.p.codProd);
		writeln('Cantidad de ventas: ',a^.p.cantVentas);
		writeln('Monto total: ',a^.p.montoTotal:4:2);
		imprimirArbol(a^.hd);
	end;
	writeln;
end;

function codigoMaxVentas(a:arbol):integer;

	procedure maximo(a:arbol;var maxCodigo,maxVentas:integer);
	begin
		if(a <> nil)then begin
			maximo(a^.hi,maxCodigo,maxVentas);
			if(a^.p.cantVentas > maxVentas)then begin
				maxVentas:= a^.p.cantVentas;
				maxCodigo:= a^.p.codProd;
			end;
			maximo(a^.hd,maxCodigo,maxVentas);
		end;
	end;
var
	maxCodigo,maxVentas:integer;
begin
	maxVentas:= -1;
	maximo(a,maxCodigo,maxVentas);
	codigoMaxVentas:= maxCodigo;
end;
function cantCodigosMenores(a:arbol;cod:integer):integer;
begin
	if(a <> nil)then begin
		if(a^.p.codProd < cod)then
			cantCodigosMenores:= cantCodigosMenores(a^.hi,cod) + cantCodigosMenores(a^.hd,cod) + 1
		else
			cantCodigosMenores:= cantCodigosMenores(a^.hi,cod);
	end else
		cantCodigosMenores:= 0;

end;
function rangoCodigos(a:arbol;cod1,cod2:integer):integer;
begin
	if(a <> nil)then begin
		if(cod1 < a^.p.codProd)and(a^.p.codProd < cod2)then 
			rangoCodigos:= rangoCodigos(a^.hi,cod1,cod2) + rangoCodigos(a^.hd,cod1,cod2) + 1
		else begin
			if(a^.p.codProd < cod1)then
				rangoCodigos:= rangoCodigos(a^.hd,cod1,cod2)
			else
				rangoCodigos:= 	rangoCodigos(a^.hi,cod1,cod2);
		end;
	end else
		rangoCodigos:= 0;
end;

var 
	a:arbol;
	codMenor,codigo1,codigo2:integer;
BEGIN
	a:= nil;
	
	cargarArbol(a);
	imprimirArbol(a);
	writeln('El codigo con mayores ventas es: ', codigoMaxVentas(a));
	
	writeln('Ingrese un codigo para buscar la cantidad de codigos menores: ');
	readln(codMenor);
	writeln('La cantida de codigos menores a ese es: ', cantCodigosMenores(a,codMenor));
	
	writeln('Ingrese el codigo 1');
	readln(codigo1);
	
	writeln('Ingrese el codigo 2');
	readln(codigo2);
	
	writeln('La cantidad que de códigos que hay en el medio son: ', rangoCodigos(a,codigo1,codigo2));
	
END.

