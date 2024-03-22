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
	
	procedure insertarArbol(var a:arbolDni;r:reclamo);
		
		procedure agregarAdelante(var l:listaRec;rec:reclamoInfo);
		var
			nuevo:listaRec;
		begin
			new(nuevo);
			nuevo^.info:= rec;
			nuevo^.sig:= l;
			l:= nuevo;
		end;
		
	begin
		if(a = nil)then begin
			new(a);
			a^.dni.numero:= r.dni;
			a^.dni.cantReclamos:= 1;
			a^.dni.lista:= nil;
			agregarAdelante(a^.dni.lista,r.info);
			a^.hi:= nil;
			a^.hd:= nil;
		end else begin
			if(a^.dni.numero = r.dni)then begin
				agregarAdelante(a^.dni.lista,r.info);
				a^.dni.cantReclamos:= a^.dni.cantReclamos + 1;
			end else
				if(a^.dni.numero > r.dni)then
					insertarArbol(a^.hi,r)
				else
					insertarArbol(a^.hd,r);
		end;
	
	end;
	
var
	r:reclamo;
begin
	leerReclamo(r);
	while(r.info.cod <> -1)do begin
		insertarArbol(a,r);
		leerReclamo(r);
	end;
end;
	
function cantReclamos(a:arbolDni;dni:integer):integer;
begin
	if(a <> nil)then begin
		if(a^.dni.numero = dni)then
			cantReclamos:= a^.dni.cantReclamos
		else begin
			if(a^.dni.numero > dni)then
				cantReclamos:= cantReclamos(a^.hi,dni)
			else
				cantReclamos:= cantReclamos(a^.hd,dni);
		end;
	end else
		cantReclamos:= -1;
end;


function rangoCantReclamos(a:arbolDni;dniUno,dniDos:integer):integer;
begin
	if(a <> nil)then begin
		if(dniUno < a^.dni.numero)and(a^.dni.numero < dniDos)then begin
			rangoCantReclamos:= rangoCantReclamos(a^.hi,dniUno,dniDos) + rangoCantReclamos(a^.hd,dniUno,dniDos) + a^.dni.cantReclamos;
		end else begin
			if(dniUno >= a^.dni.numero)then 
				rangoCantReclamos:= rangoCantReclamos(a^.hd,dniUno,dniDos)
			else
				rangoCantReclamos:= rangoCantReclamos(a^.hi,dniUno,dniDos);
		end;
	end else
		rangoCantReclamos:= 0;
end;	

function retornarReclamosAnio(a:arbolDni;anio:integer):integer;

	function cantAnios(l:listaRec;anio:integer):integer;
	var
		cant:integer;
	begin
		cant:= 0;
		while(l <> nil)do begin
			if(l^.info.anio = anio)then
				cant:= cant + 1;
			l:= l^.sig;
		end;
		cantAnios:= cant;
	end;

var
	valorI,valorD:integer;
begin
	if(a <> nil)then begin
		valorI:= retornarReclamosAnio(a^.hi,anio);
		valorD:= retornarReclamosAnio(a^.hd,anio);
		retornarReclamosAnio:= valorI + valorD + cantAnios(a^.dni.lista,anio);
	end
	else
		retornarReclamosAnio:= 0;
	
	
end;


var 
	a:arbolDni;
	anio,dni,dniUno,dniDos:integer;
	
BEGIN
	a:=nil;
	cargarArbol(a);
	writeln('Ingrese un dni');
	readln(dni);
	writeln('La cantidad de reclamos realizados por ese dni es: ', cantReclamos0(a,dni));
	
	writeln('Ingrese el dni 1 ');
	readln(dniUno);
	writeln('Ingrese el dni 2 ');
	readln(dniDos);
	
	writeln('La cantidad de reclamos entre esos dos dnis es de: ', rangoCantReclamos(a,dniUno,dniDos));
	
	writeln('Ingrese un anio para saber cuantos reclamos se realizaron: ');
	readln(anio);
	writeln('La cantidad de reclamos realizados fue de: ', retornarReclamosAnio(a,anio));
	
	
END.

