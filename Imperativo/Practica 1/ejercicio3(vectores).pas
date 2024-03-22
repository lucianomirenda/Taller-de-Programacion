program untitled;
type
	productos = record
		precio:real;
		stock:integer;
	end;
	
	detalle = record
		prodCod:integer;
		cant:integer;
		precio:real;
	end;
	
	vDetalle = array[1..5] of detalle;
		
	venta = record
		ventaCod:integer;
		prodVendidos:vDetalle;
		montoTotal:real;
	end;
	
	listaVenta = ^nodoVenta;
	
	nodoVenta = record
		ventas:venta;
		sig:listaVenta;
	end;
	
	vProductos = array[1..5] of productos;
	
procedure cargarVectorProductos(var v:vProductos);
var
	i:integer;
begin
	for i:= 1 to 5 do begin
		writeln('Producto n°',i,'. Stock: ');
		readln(v[i].stock);
		writeln('Producto n°',i,'. Precio: ');
		readln(v[i].precio);
	end;
end;
procedure leerDetalle(var d:detalle;var vProd:vProductos);
begin
	writeln('Cantidad de unidades: ');
	readln(d.cant);
	if(d.cant <> 0)then begin
		writeln('Código de producto: ');
		readln(d.prodCod);
		if(d.cant > vProd[d.prodCod].stock)then begin
			d.cant:= vProd[d.prodCod].stock;
			vProd[d.prodCod].stock:= 0;
		end
		else 
			vProd[d.prodCod].stock:= vProd[d.prodCod].stock - d.cant;
	
		d.precio:= vProd[d.prodCod].precio;
	end;
end;
procedure leerVenta(var v:venta;var vProd:vProductos);
var
	d:detalle;
	montoTotal:real;
begin
	montoTotal:= 0;
	writeln('Ingrese el código de venta');
	readln(v.ventaCod);
	if(v.ventaCod <> -1)then begin
		leerDetalle(d,vProd);
		while(d.cant <> 0)do begin
			montoTotal:= montoTotal + (d.cant * d.precio);
			v.prodVendidos[d.prodCod]:= d;
			leerDetalle(d,vProd);
		end;
		v.montoTotal:= montoTotal;
	end;
end;
procedure agregarAdelanteVentas(var l:listaVenta;v:venta);
var
	nuevo:listaVenta;
begin
	new(nuevo);
	nuevo^.sig:= l;
	nuevo^.ventas:= v;
	l:= nuevo;
end;
procedure cargarVentas(var lVentas:listaVenta;var vProd:vProductos);
var 
	vent:venta;
begin
	leerVenta(vent,vProd);
	while(vent.ventaCod <> (-1))do begin
		agregarAdelanteVentas(lVentas,vent);
		leerVenta(vent,vProd);
	end;

end;
procedure retornarUnidades(l:listaVenta;cod:integer;var unidades:integer);
begin
	unidades:= 0;
	while(l <> nil)do begin
		unidades:= unidades + l^.ventas.prodVendidos[cod].cant;
		l:= l^.sig;
	end;
end;
var
	l:listaVenta;
	v:vProductos;
	unidadesVendidas:integer;
	cod:integer;
BEGIN
	cargarVectorProductos(v);
	l:= nil;
	cargarVentas(l,v);
	writeln('Ingrese un código para buscar');
	readln(cod);
	retornarUnidades(l,cod,unidadesVendidas);	
	writeln('Las unidades vendidas son: ', unidadesVendidas);

END.

