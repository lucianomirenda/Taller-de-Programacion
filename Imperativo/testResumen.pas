 program untitled;
type
	
	reg = record
		c:char;
		num:integer
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato:reg;
		hi:arbol;
		hd:arbol;
	end;
	
procedure cargarEstructura(var a:arbol);

	procedure leerRegistro(var r:reg);
	begin
		writeln('Ingresa un caracter');
		readln(r.c);
		if(r.c <> '-')then begin
			writeln('Ingrese un numero');
			readln(r.num);
		end;
	end;
	
	procedure cargarArbol(var a:arbol;r:reg);
	begin
		if(a = nil)then begin
			new(a);
			a^.dato:= r;
			a^.hi:= nil;
			a^.hd:= nil;
		end
		else begin
			if(a^.dato.c > r.c)then	
				cargarArbol(a^.hi,r)
			else
				cargarArbol(a^.hd,r);
		end;
	end;

var
	r:reg;
begin
	leerRegistro(r);
	while(r.c <> '-')do begin
		cargarArbol(a,r);
		leerRegistro(r);
	end;

end;
	
procedure imprimirArbol(a:arbol);
begin
	if(a<>nil)then begin
		imprimirArbol(a^.hi);
		writeln;
		writeln('Caracter: ',a^.dato.c);
		writeln('Numero: ', a^.dato.num);
		imprimirArbol(a^.hd);
	end;
end;

//retornar la vocal máxima 
// 1° caso. Buscar el dato máximo en un arbol ordenado.
	
function retornarMaxVocal(a:arbol):char;
begin
	if(a<>niL)then begin
		if(a^.hd <> nil)then
			retornarMaxVocal:= retornarMaxVocal(a^.hd)
		else	
			retornarMaxVocal:= a^.dato.c;
	end;
end;

//buscar el número máximo 
// 2° caso. Buscar el valor máximo en un arbol ordenado por otro valor que no es mi máximo.

function retornarMaxNum(a:arbol):integer;

	function max(a,b:integer):integer;
	begin
		if(a > b)then
			max:=a
		else
			max:=b;
	end;
begin
	if(a<>nil)then begin
		retornarMaxNum:= max(a^.dato.num,max(retornarMaxNum(a^.hi),retornarMaxNum(a^.hd)));
	end
	else
		retornarMaxNum:= -1;
end;

// retornar la vocal que contiene el numero máximo
// 3° caso. Buscar un maximo en un arbol que no esta ordenado en ese tipo de valor y retornar
// un valor relacionado a ese maximo (no el máximo. 
function retornarVocalMaxNum(a:arbol):char;
	
	procedure maximoLetra(a:arbol;var letraMax:char;var numMax:integer);
	begin
		if(a <> nil)then begin
			maximoLetra(a^.hi,letraMax,numMax);
			if(a^.dato.num > numMax)then begin
				letraMax:= a^.dato.c;
				numMax:= a^.dato.num;
			end;
			maximoLetra(a^.hd,letraMax,numMax);
		end;
	end;
	
var
	letraMax:char;
	numMax:integer;
begin
	numMax:= -1;
	maximoLetra(a,letraMax,numMax);
	retornarVocalMaxNum:= letraMax;
end;

// retornar la suma de todos los valores del arbol

function sumatoriaArbol(a:arbol):integer;
begin
	if(a <> nil)then begin
		sumatoriaArbol:= sumatoriaArbol(a^.hi) + sumatoriaArbol(a^.hd) + a^.dato.num;
	end
	else
		sumatoriaArbol:= 0;
end;

// buscar un dato teniendo en cuenta el orden

procedure moduloBuscarOrdenado(a:arbol);

	function buscarOrdenado(a:arbol;c:char):boolean;
	begin
		if(a <> nil)then begin
			if(a^.dato.c = c)then begin
				buscarOrdenado:= true;
			end
			else begin
				if(a^.dato.c > c)then 
					buscarOrdenado:= buscarOrdenado(a^.hi,c)
				else
					buscarOrdenado:= buscarOrdenado(a^.hd,c);
			end;
		end
		else
			buscarOrdenado:= false;
	end;
var
	l:char;
begin
	writeln('Ingrese el caracter que desea buscar: ');
	readln(l);
	if(buscarOrdenado(a,l))then
		writeln('El caracter existe')
	else
		writeln('El caracter no existe');
end;

//buscar un dato sin tener en cuenta el orden

procedure moduloSinOrden(a:arbol);
	
	function buscarDatoSinOrden(a:arbol;n:integer):boolean;
	begin
		if(a <> nil)then begin
			if(a^.dato.num = n)then
				buscarDatoSinOrden:= true
			else
				buscarDatoSinOrden:= buscarDatoSinOrden(a^.hi,n) or buscarDatoSinOrden(a^.hd,n);
		end
		else
			buscarDatoSinOrden:= false;
	end;
var
	n:integer;
begin
	writeln('Ingrese el numero que desea búscar');
	readln(n);
	if(buscarDatoSinOrden(a,n))then
		writeln('El numero existe')
	else
		writeln('El numero no existe');

end;

// buscar un dato y retornar uno relacionado en orden

procedure moduloRetornarOrdenado(a:arbol);

	function retornarOrdenado(a:arbol;c:char):integer;
	begin
		if(a <> nil)then begin
			if(a^.dato.c = c)then
				retornarOrdenado:= a^.dato.num
			else begin
				if(a^.dato.c > c)then 
					retornarOrdenado:= retornarOrdenado(a^.hi,c)
				else
					retornarOrdenado:= retornarOrdenado(a^.hd,c);
			end;
		end else
			retornarOrdenado:= -1;
	end;

var
	c:char;
begin
	writeln('Ingrese un caracter para retornar el número que le corresponde');
	readln(c);
	writeln('El numero asociado a ese caracter es: ',retornarOrdenado(a,c));
end;

// buscar un dato y retornar uno relacionado sin orden

procedure moduloRetornarDesordenado(a:arbol);

	procedure retornarDesordenado(a:arbol;num:integer;var caracter:char;var ok:boolean);
	begin
		if(a <> nil)and(not ok)then begin
			if(a^.dato.num = num)then begin
				caracter:= a^.dato.c;
				ok:=true;
			end
			else begin
				retornarDesordenado(a^.hi,num,caracter,ok);
				retornarDesordenado(a^.hd,num,caracter,ok);
			end;
		end;
	end;

var
	n:integer;
	caracter:char;
	ok:boolean;
begin
	caracter:= '-';
	ok:= false;
	writeln('Ingrese un numero para buscar su caracter asociado: ');
	readln(n);
	retornarDesordenado(a,n,caracter,ok);
	if(ok)then 
		writeln('El caracter asociado a el numero ',n,' es: ',caracter)
	else
		writeln('Ese numero no tiene ningun caracter asociado');
	
end;

procedure moduloRetornarCantidadMayores(a:arbol);
	
	function retornarCantidadMayor(a:arbol;c:char):integer;
	begin
		if(a <> nil)then begin
			if(a^.dato.c > c)then begin
				retornarCantidadMayor:= retornarCantidadMayor(a^.hi,c) + retornarCantidadMayor(a^.hd,c) + 1;
			end else
				retornarCantidadMayor:= retornarCantidadMayor(a^.hd,c);
		end
		else
			retornarCantidadMayor:= 0;
	end;

var
	c:char;
begin
	writeln('Ingrese el caracter para contar todos los mayores a este: ');
	readln(c);
	writeln('La cantidad de caracteres mayores a ese es: ',retornarCantidadMayor(a,c));
end;

procedure moduloRetornarMayores(a:arbol);
type 
	lista = ^nodo;
	nodo = record
		c:char;
		sig:lista;
	end;
	
	procedure retornarMayores(a:arbol;c:char;var l:lista);
		
		procedure agregarAdelante(var l:lista;c:char);
		var
			nuevo:lista;
		begin
			new(nuevo);
			nuevo^.c:= c;
			nuevo^.sig:= l;
			l:= nuevo;
		end;
			
	begin
		if(a<> nil)then begin
			if(a^.dato.c > c)then begin
				retornarMayores(a^.hi,c,l);
				agregarAdelante(l,a^.dato.c);
				retornarMayores(a^.hd,c,l);
			end else
				retornarMayores(a^.hd,c,l);
		end;
	end;
	
	procedure imprimirLista(l:lista);
	begin
		while(l <> nil)do begin
			writeln('----');
			writeln('Caracter: ',l^.c);
			l:= l^.sig;
		end;
	end;

var
	c:char;
	l:lista;
begin
	l:= nil;
	writeln('Ingrese el caracter para retornar todos los mayores a ese: ');
	readln(c);
	retornarMayores(a,c,l);
	imprimirLista(l);
end;

procedure moduloCantidadRango(a:arbol);

	function rangoCantidad(a:arbol;char1,char2:char):integer;
	begin
		if(a<> nil)then begin
			if(char1 < a^.dato.c)and(a^.dato.c < char2)then
				rangoCantidad:= rangoCantidad(a^.hi,char1,char2) + rangoCantidad(a^.hd,char1,char2) + 1
			else begin
				if(char1 >= a^.dato.c)then
					rangoCantidad:= rangoCantidad(a^.hd,char1,char2)
				else
					rangoCantidad:= rangoCantidad(a^.hi,char1,char2);
			end;
		end else
			rangoCantidad:= 0;
	end;


var
	char1,char2:char;
begin
	writeln('Ingrese el primer caracter');
	readln(char1);
	writeln('Ingrese el segundo caracter');
	readln(char2);
	writeln('La cantidad de caracteres que hay entre el primero y el segundo es: ', rangoCantidad(a,char1,char2));

end;

procedure moduloRetornarRango(a:arbol);
type
	lista = ^nodo;

	nodo = record
		c:char;
		sig:lista;
	end;

	procedure agregarFinal(var l:lista;c:char);
	var
		nuevo,aux:lista;
	begin
		new(nuevo);
		nuevo^.c:= c;
		nuevo^.sig:= nil;
		
		if(l = nil)then 
			l:= nuevo
		else begin
			aux:= l;
			while(aux^.sig <> nil)do begin
				aux:= aux^.sig;
			end;
			aux^.sig:= nuevo;
		end;
	end;
	
	procedure retornarRango(a:arbol;char1,char2:char;var l:lista);
	begin
		if(a <> nil)then begin
			if(char1 < a^.dato.c)and(a^.dato.c < char2)then begin
				retornarRango(a^.hi,char1,char2,l);
				agregarFinal(l,a^.dato.c);
				retornarRango(a^.hd,char1,char2,l);
			end
			else begin
				if(a^.dato.c <= char1)then
					retornarRango(a^.hd,char1,char2,l)
				else
					retornarRango(a^.hi,char1,char2,l);
					
			end;
		end;
	end;
	
	procedure imprimirLista(l:lista);
	begin
		while(l<>nil)do begin
			writeln('----');
			writeln('CARACTER: ',l^.c);
			l:= l^.sig;
		end;
	end;
	
var
	l:lista;
	char1,char2:char;
begin
	l:= nil;
	writeln('Ingrese el caracter 1');
	readln(char1);
	writeln('Ingrese el caracter 2');
	readln(char2);
	retornarRango(a,char1,char2,l);
	imprimirLista(l);
end;

procedure moduloOcurrencias(a:arbol);

	function cantOcurrencias(a:arbol;num:integer):integer;
	begin
		if(a <> nil)then begin
			if(a^.dato.num = num)then
				cantOcurrencias:= cantOcurrencias(a^.hi,num) + cantOcurrencias(a^.hd,num) + 1
			else
				cantOcurrencias:= cantOcurrencias(a^.hi,num) + cantOcurrencias(a^.hd,num);
		end
		else
			cantOcurrencias:= 0;
	end;	

var
	num:integer;
begin
	writeln('Ingrese el número que quiere saber la cantidad de veces que aparece');
	readln(num);
	writeln('La cantidad de veces que aparece el numero ',num,' es: ',cantOcurrencias(a,num));
end;

var 
	a:arbol;
BEGIN
	a:= nil;
	cargarEstructura(a);
	imprimirArbol(a);
	
	writeln('La letra maxima es: ', retornarMaxVocal(a));
	writeln('El numero maximo es: ',retornarMaxNum(a));
	writeln('La letra con el numero maximo es: ', retornarVocalMaxNum(a));
	writeln('La suma de todos los numeros guardados en el arbol es: ', sumatoriaArbol(a));
	
	//moduloBuscarOrdenado(a);
	//moduloSinOrden(a);
	//moduloRetornarOrdenado(a);
	//moduloRetornarDesordenado(a);
	
	//moduloRetornarCantidadMayores(a);
	//moduloRetornarMayores(a);
	//moduloCantidadRango(a);
	//moduloRetornarRango(a);
	moduloOcurrencias(a);
END.

