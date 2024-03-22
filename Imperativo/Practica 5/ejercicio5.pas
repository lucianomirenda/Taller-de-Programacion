program untitled;
type
	reclamoInfo = record
		cod:integer;
		anio:integer;
		tipo:integer;
	end;
	
	reclamo = record
		dni:integer;
		info:reclamoInfo;
	end;
	
	listaRec = ^nodoRec;
	
	nodoRec = record
		info:reclamoInfo;
		sig:listaRec;
	end;
	
	dniInfo = record
		numero:integer;
		cantReclamos:integer;
		lista:listaRec;
	end;
	
	arbolDni = ^nodoDni;
	
	nodoDni = record
		dni:dniInfo;
		hi:arbolDni;
		hd:arbolDni;
	end;

procedure cargarArbol(var a:arbolDni);

	procedure leerReclamo(var r:reclamo);
	begin
		writeln('Ingrese el codigo de reclamo');
		readln(r.info.cod);
		if(r.info.cod <> -1)then begin
			writeln('Ingrese el dni');
			readln(r.dni);
			writeln('Ingrese el anio');
			readln(r.info.anio);
			writeln('Ingrese el tipo de reclamo');
			readln(r.info.tipo);
		end;
	end;
	
	procedure agregarAdelante(var l:listaRec;rec:reclamoInfo);
	var
		nuevo:listaRec;
	begin
		new(nuevo);
		nuevo^.info:= rec;
		nuevo^.sig:= l;
		l:= nuevo;
	end;
	
	procedure insertarArbol(var a:arbolDni;d:dniInfo);
	begin
		if(a = nil)then begin
			new(a);
			a^.dni:= d;
			a^.hi:= nil;
			a^.hd:= nil;
		end else begin
			if(a^.dni.numero > d.numero)then
				insertarArbol(a^.hi,d)
			else
				insertarArbol(a^.hd,d);
		end;
	
	end;
	
var
	r:reclamo;
	d:dniInfo;
	dniActual:integer;
begin
	leerReclamo(r);
	while(r.info.cod <> -1)do begin
		dniActual:= r.dni; 
		d.numero:= r.dni;
		d.cantReclamos:= 0;
		d.lista:= nil;
		while(dniActual = r.dni)and(r.info.cod <> -1)do begin
			d.cantReclamos:= d.cantReclamos + 1;
			agregarAdelante(d.lista,r.info);
			leerReclamo(r);
		end;
		insertarArbol(a,d);
	end;
end;
procedure imprimirArbol(a:arbolDni);
begin
	if(a <> nil)then begin
		imprimirArbol(a^.hi);
		writeln('DNI: ', a^.dni.numero);
		imprimirArbol(a^.hd);
	end;
end;

var 
	a:arbolDni;

BEGIN
	a:=nil;
	cargarArbol(a);
	imprimirArbol(a);
END.

