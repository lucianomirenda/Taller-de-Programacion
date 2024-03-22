program untitled;
const
	df = 5;
type
	rangoId = 1 .. 5;
	rangoPapelesFlores = 0 ..10;
	rangoCalleAvenida = 1 .. 100;
	
	esquina = record
		calle:rangoCalleAvenida;
		avenida:rangoCalleAvenida;
	end;
	
	infoEsquina = record
		cantPapeles:rangoPapelesFlores;
		cantFlores:rangoPapelesFlores;
		esq:esquina;
	end;
	
	regRobot = record
		id:rangoId;
		info:infoEsquina;
	end;
	
	arbolEsquinas = ^nodoEsquinas;
	
	nodoEsquinas = record
		data:infoEsquina;
		hi:arbolEsquinas;
		hd:arbolEsquinas;
	end;
	
	vectorId = array[rangoId] of arbolEsquinas;
	
	listaAvenida = ^nodoAvenida;
	
	regAvenida = record
		numero:rangoCalleAvenida;
		cantFlores:integer;
		cantCeroPapeles:integer;
	end;
	
	nodoAvenida = record
		avenida:regAvenida;
		sig:listaAvenida;
	end;
	
	arbolFlores = ^nodoFlores;
	
	
	nodoFlores = record
		data:regAvenida;
		hi:arbolFlores;
		hd:arbolFlores;
	end;
	
	

procedure moduloPuntoA(var v:vectorId);
	
	procedure recibirMensaje(var r:regRobot);
	begin
		writeln('Ingrese id');
		readln(r.id);
		writeln('Ingrese la cantidad de papeles');
		readln(r.info.cantPapeles);
		writeln('Ingrese la cantidad de flores');
		readln(r.info.cantFlores);
		writeln('Ingrese la avenida');
		readln(r.info.esq.avenida);
		writeln('Ingrese la calle');
		readln(r.info.esq.calle);
	end;
	
	procedure cargarMensaje(var a:arbolEsquinas;info:infoEsquina);
	begin
		if(a = nil)then begin
			new(a);
			a^.data:= info;
			a^.hi:= nil;
			a^.hd:= nil;
		end	
		else if(a^.data.esq.avenida > info.esq.avenida)then
				cargarMensaje(a^.hi,info)
			else
				cargarMensaje(a^.hd,info);
	end;

var
	r:regRobot;
	i:integer;
begin
	for i:=1 to 100 do begin
		recibirMensaje(r);
		cargarMensaje(v[r.id],r.info);
	end;
end;

procedure cargarListaAvenida(v:vectorId;var l:listaAvenida);

	procedure insertarOrdenado(var l:listaAvenida;r:regAvenida);
	var
		nuevo,act,ant:listaAvenida;
	begin
		new(nuevo);
		nuevo^.avenida:= r;
	
		act:= l;
		ant:= l;
		
		while(act <> nil)and(r.numero > act^.avenida.numero)do begin
			ant:= act;
			act:= act^.sig;
		end;

		
		if(act = ant)then begin
			l:= nuevo;
			nuevo^.sig:= act;
		end
		else begin
			if(r.numero = act^.avenida.numero)then begin
				dispose(nuevo);
				act^.avenida.cantFlores:= act^.avenida.cantFlores + r.cantFlores; 
				act^.avenida.cantCeroPapeles:= act^.avenida.cantCeroPapeles + r.cantCeroPapeles;
			end 
			else begin
				ant^.sig:= nuevo;
				nuevo^.sig:= act;
			end;
		end;
		
		
	end;
	
	procedure crearInfo(datos:infoEsquina;var r:regAvenida);
	begin
		r.numero:= datos.esq.avenida;
		r.cantFlores:= datos.cantFlores;
		if(datos.cantPapeles = 0)then 
			r.cantCeroPapeles:= 1
		else 
			r.cantCeroPapeles:= 0;
	
	end;

	procedure insertarAvenida(a:arbolEsquinas;var l:listaAvenida);
	var
		r:regAvenida;
	begin
		if(a <> nil)then begin
			insertarAvenida(a^.hi,l);
			crearInfo(a^.data,r);
			insertarOrdenado(l,r);
			insertarAvenida(a^.hd,l);
		end;	
	end;

var
	i:rangoId;
begin
	for i:=1 to df do begin
		insertarAvenida(v[i],l);
	end;
end;

procedure cargarArbolFlores(l:listaAvenida;var a:arbolFlores);
	
	procedure insertarArbol(a:arbolFlores;f:regAvenida);
	begin
		if(a = niL)then begin
			new(a);
			a^.data:= f;
			a^.hi:= nil;;
			a^.hd:= nil;
		end 
		else begin
			if(a^.data.cantFlores > f.cantFlores)then
				insertarArbol(a^.hi,f)
			else
				insertarArbol(a^.hd,f);
		end;
	end;
	
var
	f:regAvenida;
begin
	while(l <> nil)do begin
		f:= l^.avenida;
		insertarArbol(a,f);
		l:= l^.sig;
	end;
end;

procedure iniVector(var v:vectorId);
var
	i:rangoId;
begin
	for i:=1 to df do
		v[i]:= nil;
end;

var
	v:vectorId;
	l:listaAvenida;
	af:arbolFlores;
BEGIN
	iniVector(v);
	af:= nil;
	l:= nil;
	
	moduloPuntoA(v);
	cargarListaAvenida(v,l);
	cargarArbolFlores(l,af);
	
END.

