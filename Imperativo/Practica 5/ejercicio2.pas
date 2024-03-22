program untitled;
type
	rangoAnios = 2010 .. 2018;
	
	infoMarca = record
		patente:string;
		anio:rangoAnios;
		modelo:string;
	end;
	
	infoAuto = record
		marca:string;
		info:infoMarca;
	end;
	
	//arbol 1 de patentes
	
	arbolPatentes = ^nodoPatentes;
	
	nodoPatentes = record
		auto:infoAuto;
		hi:arbolPatentes;
		hd:arbolPatentes;
	end;
	
	//arbol 2 de Marcas
	
	listaAutos = ^nodoAutos;
	
	nodoAutos = record
		auto:infoMarca;
		sig:listaAutos;
	end;
	
	regMarca = record
		nombre:string;
		lista:listaAutos;
	end;
	
	arbolMarcas = ^nodoMarcas;
	
	nodoMarcas = record
		marca:regMarca;
		hi:arbolMarcas;
		hd:arbolMarcas;
	end;
	
	// vector de años con la informacion
	
	infoAnios = record
		marca:string;
		patente:string;
		modelo:string;
	end;
	
	listaAnios = ^nodoAnios;
	
	nodoAnios = record
		info:infoAnios;
		sig:listaAnios;
	end;
	
	vecAnios = array[2010 .. 2018] of listaAnios;
		
procedure cargarEstructuras(var aM:arbolMarcas;var aP:arbolPatentes);

	procedure leerAuto(var a:infoAuto);
	begin
		writeln('Ingrese la marca');
		readln(a.marca);
		if(a.marca <> 'fin')then begin
			writeln('Ingrese la patente');
			readln(a.info.patente);
			writeln('Ingrese el anio');
			readln(a.info.anio);
			writeln('Ingrese el modelo');
			readln(a.info.modelo);
		end;
	end;
	
	procedure insertarArbolPatente(var aP:arbolPatentes;a:infoAuto);
	begin
		if(aP = nil)then begin
			new(aP);
			aP^.auto:= a;
			aP^.hi:= nil;
			aP^.hd:= nil;
		end else
			if(aP^.auto.info.patente > a.info.patente)then 
				insertarArbolPatente(aP^.hi,a)
			else
				insertarArbolPatente(aP^.hd,a);
	end;
	
	procedure insertarArbolMarcas(var aM:arbolMarcas;auto:infoAuto);
		
		procedure agregarAdelante(var l:listaAutos;info:infoMarca);
		var
			nuevo:listaAutos;
		begin
			new(nuevo);
			nuevo^.auto:= info;
			nuevo^.sig:= l;
			l:= nuevo;
		end;
		
	begin
		if(aM = nil)then begin
			new(aM);
			aM^.marca.nombre:= auto.marca;
			aM^.marca.lista:= nil;
			agregarAdelante(aM^.marca.lista,auto.info);
			aM^.hi:= nil;
			aM^.hd:= nil;
		end
		else
			if(aM^.marca.nombre = auto.marca)then
				agregarAdelante(aM^.marca.lista,auto.info)
			else begin
				if(aM^.marca.nombre > auto.marca)then
					insertarArbolMarcas(aM^.hi,auto)
				else
					insertarArbolMarcas(aM^.hd,auto);
			end;
	end;
var
	auto:infoAuto;
begin
	leerAuto(auto);
	while(auto.marca <> 'fin')do begin
		insertarArbolPatente(aP,auto);
		insertarArbolMarcas(aM,auto);
		leerAuto(auto);
	end;
end;

function cantMarca(a:arbolPatentes;marca:string):integer;
var
	valorI,valorD:integer;
begin
	if(a <> nil)then begin
		valorI:= cantMarca(a^.hi,marca);
		valorD:= cantMarca(a^.hd,marca);
		cantMarca:= valorI + valorD;
		if(a^.auto.marca = marca)then
			cantMarca:= cantMarca + 1;
	end else
		cantMarca:= 0;
end;

function cantMarca2II(a:arbolMarcas;marca:string):integer;
	
	function cantAutos(l:listaAutos):integer;
	var
		cant:integer;
	begin
		cant:= 0;
		while(l <> nil)do begin
			cant:= cant + 1;
			l:= l^.sig;
		end;
		cantAutos:= cant;
	end;

	procedure buscarMarca(a:arbolMarcas;marca:string;var cant:integer);
	begin
		if(a <> nil)then begin
			if(a^.marca.nombre = marca)then
				cant:= cantAutos(a^.marca.lista)
			else begin
				if(a^.marca.nombre > marca)then 
					buscarMarca(a^.hi,marca,cant)
				else
					buscarMarca(a^.hd,marca,cant);
			end;
		end;
	end;

var
	cant:integer;
begin
	buscarMarca(a,marca,cant);
	cantMarca2II:= cant;
end;

function buscarMarca(a:arbolMarcas;marca:string):integer;

	function cantAutos(l:listaAutos):integer;
	var
		cant:integer;
	begin
		cant:= 0;
		while(l <> nil)do begin
			cant:= cant + 1;
			l:= l^.sig;
		end;
		cantAutos:= cant;
	end;


begin
	if(a<>nil)then begin
		if(a^.marca.nombre >= marca)then begin
			if(a^.marca.nombre = marca)then 
				buscarMarca:= cantAutos(a^.marca.lista)
			else
				buscarMarca:= buscarMarca(a^.hi,marca);
		end
		else
			buscarMarca:= buscarMarca(a^.hd,marca);
	end else
		buscarMarca:= 0;

end;

function buscarMarca(a:arbolMarcas;marca:string):integer;
begin
	if(a<> nil)then begin
		if(a^.marca.nombre = marca)then 
			buscarMarca:= marca
		else begin
			if(a^.marca.nombre > marca)then
				buscarMarca:= buscarMarca(a^.hd,marca)
			else
				buscarMarca:= buscarMarca(a^.hi,marca);
			
		end;
	end
	else
		buscarMarca:= -1;
	
end;





procedure inicializarVectorAnios(var v:vecAnios);
var
	i:integer;
begin
	for i:= 2010 to 2018 do 
		v[i]:= nil;
end;	

procedure cargarVectorAnios(aP:arbolPatentes;var v:vecAnios);
	
	procedure crearInfoAuto(autoPatente:infoAuto;var autoAnios:infoAnios);
	begin
		autoAnios.marca:= autoPatente.marca;
		autoAnios.patente:= autoPatente.info.patente;
		autoAnios.modelo:= autoPatente.info.modelo;
	end;
	
	
	procedure agregarAdelante(var l:listaAnios;auto:infoAnios);
	var
		nuevo:listaAnios;
	begin
		new(nuevo);
		nuevo^.info:= auto;
		nuevo^.sig:= l;
		l:= nuevo;
	end;
var
	autoAnios:infoAnios;
begin
	if(aP <> nil)then begin
		cargarVectorAnios(aP^.hi,v);
		
		crearInfoAuto(aP^.auto,autoAnios);
		agregarAdelante(v[aP^.auto.info.anio],autoAnios);
		
		cargarVectorAnios(aP^.hd,v);
	end;
end;

procedure imprimirVectorAnios(v:vecAnios);
	procedure imprimirLista(l:listaAnios);
	begin
		while(l <> nil)do begin
			writeln('La marca es ',l^.info.marca);
			l:= l^.sig;
		end;
	end;
var
	i:integer;
begin
	for i:= 2010 to 2018 do begin 
		writeln('Los autos del año ', i, ' son: ');
		imprimirLista(v[i]);
	end;
end;

procedure buscarModelo(a:arbolPatentes;patente:string;var modelo:string);
begin
	if(a <> nil)then begin
		if(a^.auto.info.patente = patente)then
			modelo:= a^.auto.info.modelo
		else begin
			if(a^.auto.info.patente > patente)then
				buscarModelo(a^.hi,patente,modelo)
			else
				buscarModelo(a^.hd,patente,modelo);
		end;
	end;
end;

procedure buscarModeloMarca(a:arbolMarcas;patente:string;var modelo:string;var ok:boolean);

	procedure buscarLista(l:listaAutos;patente:string;var modelo:string;var ok:boolean);
	begin
		while(l<>nil)and(not ok)do begin
			if(l^.auto.patente = patente)then begin
				modelo:= l^.auto.modelo;
				ok:= true;
			end;
			l:= l^.sig;
		end;
	end;

begin
	if(a <> nil)and(not ok)then begin
		buscarModeloMarca(a^.hi,patente,modelo,ok);
		buscarLista(a^.marca.lista,patente,modelo,ok);
		buscarModeloMarca(a^.hd,patente,modelo,ok);
	end;
end;



var 
	v:vecAnios;
	aM:arbolMarcas;
	aP:arbolPatentes;
	modelo1,modelo2,patente,marca:string;
	ok:boolean;
BEGIN
	aP:= nil;
	aM:= nil;
	cargarEstructuras(aM,aP);
	writeln('Ingrese una marca');
	readln(marca);
	writeln('La cantidad de auto de esa marca en el arbol es de: ', cantMarca(aP,marca));
	writeln('La cantidad de auto de esa marca en el arbol es de: ', buscarMarca	(aM,marca));
	
	inicializarVectorAnios(v);
	cargarVectorAnios(aP,v);
	imprimirVectorAnios(v);
	
	writeln('Ingrese una patente');
	readln(patente);
	buscarModelo(aP,patente,modelo1);
	writeln('El modelo de esa patente es ', modelo1);
	
	ok:= false;
	buscarModeloMarca(aM,patente,modelo2,ok);
	writeln('El modelo de esa patente es ', modelo2);
END.

