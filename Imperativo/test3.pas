program ejemplo;
const
	df = 10;
type
	
	rango = 0..df;
	
	registro = record
		nombre:string;
		num:integer;
	end;
	
	completo = record
		letra:char;
		info:registro;
	end;
	
	lista = ^nodo;
	
	nodo = record
		info:registro;
		sig:lista;
	end;
	
	regArbol = record
		letra:char;
		tabla:lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		data:regArbol;
		hi:arbol;
		hd:arbol;
	end;

	vector = array[rango] of registro;
	
	registro2 = record
		letra:char;
		nombre:string;
	end;
	
	lista2 = ^nodo2;
	
	nodo2 = record
		info:registro2;
		sig:lista2;
	end;
	
	regArbol2 = record
		numero:integer;
		tabla:lista2;
	end;
	
	arbol2 = ^nodoArbol2;
	
	nodoArbol2 = record
		data:regArbol2;
		hi:arbol2;
		hd:arbol2;
	end;
	
	

procedure cargarEstructura(var a:arbol);
	
	procedure lectura(var r:completo);
	begin
		writeln('Ingrese una letra');
		readln(r.letra);
		if(r.letra <> '.')then begin
			writeln('Ingrese un nombre');
			readln(r.info.nombre);
			writeln('Ingrese un numero');
			readln(r.info.num);
		end;
	end;
	
	procedure agregarFinal(var l:lista;r:registro);
	var
		nuevo,aux:lista;
	begin
		new(nuevo);
		nuevo^.info:= r;
		nuevo^.sig:= nil;
		
		if(l = nil)then l:= nuevo
		else begin
			aux:= l;
			while(aux^.sig <> nil)do
				aux:= aux^.sig;
			aux^.sig:= nuevo;
		end;
		
	end;
	
	procedure insertarArbol(var a:arbol;r:completo);
	begin
		if(a = nil)then begin
			new(a);
			a^.data.letra:= r.letra;
			a^.data.tabla:= nil;
			agregarFinal(a^.data.tabla,r.info);
			a^.hi:= nil;
			a^.hd:= nil;
		end 
		else begin
			if(a^.data.letra = r.letra)then
				agregarFinal(a^.data.tabla,r.info)
			else begin
				if(a^.data.letra > r.letra)then
					insertarArbol(a^.hi,r)
				else
					insertarArbol(a^.hd,r);
			end;
		end;
	end;

var
	reg:completo;
begin
	lectura(reg);
	while(reg.letra <> '.')do begin
		insertarArbol(a,reg);
		lectura(reg);
	end;
end;

procedure punto1(a:arbol);

	function moduloRetornarCantidadLetras(a:arbol;letra:char):integer;

		function cantLetras(l:lista):integer;
		var
			cant:integer;
		begin
			cant:= 0;
			while(l <> nil)do begin
				cant:= cant + 1;
				l:= l^.sig;
			end;
			cantLetras:= cant;
		end;

	begin
		if(a <> nil)then begin
			if(a^.data.letra = letra)then
				moduloRetornarCantidadLetras:= cantLetras(a^.data.tabla)
			else begin
				if(a^.data.letra > letra)then begin
					writeln('Izquierda');
					moduloRetornarCantidadLetras:= moduloRetornarCantidadLetras(a^.hi,letra)
				end
				else begin
					writeln('Derecha');
					moduloRetornarCantidadLetras:= moduloRetornarCantidadLetras(a^.hd,letra);	
				end;
			end;
		end
		else
			moduloRetornarCantidadLetras:= -1;

	end;
var
	l:char;
begin
	writeln('Ingrese una letra');
	readln(l);
	writeln('La cantidad de elementos con esa letra es: ', moduloRetornarCantidadLetras(a,l));
end;

procedure punto2(a:arbol);
	
	function cantOcurrencias(l:lista;nombre:string):integer;
	var
		cant:integer;
	begin
		cant:= 0;
		while(l <> nil)do begin
			if(l^.info.nombre = nombre)then
				cant:= cant + 1;
			l:= l^.sig;
		end;
		cantOcurrencias:= cant;
	end;
	
	function buscarNombre(a:arbol;nombre:string):integer;
	begin
		if(a <> nil)then 
			buscarNombre:= buscarNombre(a^.hi,nombre) + buscarNombre(a^.hd,nombre) + cantOcurrencias(a^.data.tabla,nombre)
		else 
			buscarNombre:= 0;
		
	end;


var
	nombre:string;
begin
	writeln('Ingrese el nombre que desea buscar: ');
	readln(nombre);
	writeln('La cantidad de veces que aparece ese nombre es: ', buscarNombre(a,nombre));
end;

procedure imprimirVector(v:vector;dl:rango);
var
	i:rango;
begin
	for i:=1 to dl do begin
		writeln;
		writeln('nombre: ',v[i].nombre);
		writeln('numero: ',v[i].num);
		writeln;
	end;
end;


procedure punto3(a:arbol;var v:vector;var dl:rango);

	procedure calcularAgregar(l:lista;num1,num2:integer;var v:vector;var dl:rango);
	begin
		while(l <> nil)and(dl < df)do begin
			if(num1 < l^.info.num)and(l^.info.num < num2)then begin
				dl:= dl + 1;
				v[dl]:= l^.info;
			end;
			l:= l^.sig;
		end;
	end;
	
	procedure rangoCargarVector(a:arbol;num1,num2:integer;var v:vector;var dl:rango);
	begin
		if(a <> nil)and(dl < df)then begin
			rangoCargarVector(a^.hi,num1,num2,v,dl);
			calcularAgregar(a^.data.tabla,num1,num2,v,dl);
			rangoCargarVector(a^.hd,num1,num2,v,dl);
		end;
	end;
	
var
	num1,num2:integer;
begin
	dl:= 0;
	writeln('Ingrese el numero 1 del rango ');
	readln(num1);
	writeln('Ingrese el numero 2 del rango ');
	readln(num2);
	rangoCargarVector(a,num1,num2,v,dl);
	imprimirVector(v,dl);
end;

procedure punto4(v:vector;dl:rango);

	procedure ordenSeleccion(var v:vector;dl:rango);
	var
		i,j,pos:rango;
		aux:registro;
	begin
		for i:=1 to dl-1 do begin
			pos:= i;
			for j:= i+1 to dl do
				if(v[j].num < v[pos].num)then pos:= j; 
			aux:= v[i];
			v[i]:= v[pos];
			v[pos]:= aux;
		end;
	end;

	function busquedaBinaria(v:vector;dl:rango;num:integer):integer;
	var
		int,mid,fin:rango;
	begin
		int:= 1; fin:= dl; mid:=(int+fin) div 2;
		
		while(int <= fin)and(v[mid].num <> num)do begin
			if(v[mid].num > num)then
				fin:= mid - 1
			else
				int:= mid + 1;
				
			mid:= (int+fin) div 2;
		end;
		
		if(int <= fin)and(v[mid].num = num)then
			busquedaBinaria:= mid
		else
			busquedaBinaria:= -1;
		
	end;

var
	num,pos:integer;
begin
	writeln('Ordenamos el vector');
	ordenSeleccion(v,dl);
	imprimirVector(v,dl);
	writeln('Ingresa el numero que deseas buscar');
	readln(num);
	pos:= busquedaBinaria(v,dl,num);
	if(-1 <> pos)then
		writeln('El nombre del numero ingresado es: ',v[pos].nombre)
	else
		writeln('No se encontro el numero');
		
	
end;

procedure cargarArbol2(a:arbol;var a2:arbol2);
	
	procedure agregarAdelante(var l:lista2;reg2:registro2);
	var
		nuevo:lista2;
	begin
		new(nuevo);
		nuevo^.info:= reg2;
		nuevo^.sig:= l;
		l:= nuevo;
	end;
	
	procedure insertarArbol2(var a2:arbol2;num:integer;reg2:registro2);
	begin
		if(a2 = nil)then begin
			new(a);
			a2^.data.numero:= num;
			a2^.data.tabla:= nil;
			agregarAdelante(a2^.data.tabla,reg2);
			a2^.hi:= nil;
			a2^.hd:= nil;
		end 
		else begin
			if(a2^.data.numero = num)then 
				agregarAdelante(a2^.data.tabla,reg2)
			else begin
				if(a2^.data.numero > num)then
					insertarArbol2(a2^.hi,num,reg2)
				else
					insertarArbol2(a2^.hd,num,reg2);
			end;	
		end;
	end;
	
	procedure recorrerLista(c:char;l:lista;var a2:arbol2);
	var
		reg2:registro2;
	begin
		reg2.letra:= c;
		while(l <> nil)do begin
			reg2.nombre:= l^.info.nombre;
			insertarArbol2(a2,l^.info.num,reg2);
			l:= l^.sig;
		end;
	end;


begin
	if(a <> nil)then begin
		cargarArbol2(a^.hi,a2);
		recorrerLista(a^.data.letra,a^.data.tabla,a2);
		cargarArbol2(a^.hd,a2);
	end;
end;

procedure imprimirArbol2(a2:arbol2);
	
	procedure imprimir(d:regArbol2);
	begin
		writeln;
		writeln('El numero es: ',d.numero);
		while(d.tabla <> nil)do begin
			writeln('Letra: ',d.tabla^.info.letra);
			writeln('Letra: ',d.tabla^.info.nombre);
		end;
	end;

begin
	if(a2 <> nil)then begin
		imprimirArbol2(a2^.hi);
		imprimir(a2^.data);
		imprimirArbol2(a2^.hd);
	end;
end;

var 
	a:arbol;
	v:vector;
	dl:rango;
	a2:arbol2;
BEGIN
	a:= nil;
	a2:=nil;
	cargarEstructura(a);
	
	//punto1(a);
	//punto2(a);
	//punto3(a,v,dl);
	//punto4(v,dl);
	
	cargarArbol2(a,a2);	
	imprimirArbol2(a2);
	
END.

