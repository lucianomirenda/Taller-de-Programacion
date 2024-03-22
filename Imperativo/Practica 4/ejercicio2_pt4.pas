program untitled;
type

	fecha = record
		dia:integer;
		mes:integer;
	end;
	
	datosIsbn = record
		numSocio:integer;
		f:fecha;
		cantDias:integer;
	end;
	
	prestamo = record
		isbn:integer;
		datos:datosIsbn;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record //arbol con todos los códigos
		p:prestamo;
		hi:arbol;
		hd:arbol
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		d:datosIsbn;
		sig:lista;
	end;
	
	isbnTabla = record
		isbn:integer;
		listaP:lista;
	end;
	
	arbol2 = ^nodoArbol2;
	
	nodoArbol2 = record //arbol con lista de prestamos por código
		tabla:isbnTabla;
		hi:arbol2;
		hd:arbol2;
	end;
	
	cantidad = record
		isbn:integer;
		cantPrestamos:integer;
	end;
	
	arbol3 = ^nodoArbol3;
	
	nodoArbol3 = record
		dato:cantidad;
		hi:arbol3;
		hd:arbol3;
	end;
	
	listaCant = ^nodoCant;
	
	nodoCant = record
		c:cantidad;
		sig:listaCant;
	end;
	
	
	
	
procedure cargarEstructuras(var a:arbol;var a2:arbol2);
	
	procedure leerPrestamo(var p:prestamo);
	begin
		writeln('ingrese isbn ');
		readln(p.isbn);
		if(p.isbn <> -1)then begin
			writeln('ingrese numero de socio ');
			readln(p.datos.numSocio);
			writeln('ingrese dia ');
			readln(p.datos.f.dia);
			writeln('ingrese mes');
			readln(p.datos.f.mes);
			writeln('ingrese cantidad de tiempo prestado ');
			readln(p.datos.cantDias);
		end;
	end;
	
	procedure cargarArbol(var a:arbol;p:prestamo);
	begin
		if(a = nil)then begin
			new(a);
			a^.p:= p;
			a^.hi:= nil;
			a^.hd:= nil;
		end else begin
			if(p.isbn < a^.p.isbn)then 
				cargarArbol(a^.hi,p)
			else
				cargarArbol(a^.hd,p);
		end;
	end;
	
	procedure agregarAdelante(var l:lista;d:datosIsbn);
	var
		nuevo:lista;
	begin
		new(nuevo);
		nuevo^.d:= d;
		nuevo^.sig:= l;
		l:= nuevo;
	end;
	
	procedure cargarArbol2(var a:arbol2;p:prestamo);
	begin
		if(a = nil)then begin
			new(a);
			a^.tabla.isbn:= p.isbn;
			a^.tabla.listaP:= nil;
			agregarAdelante(a^.tabla.listaP,p.datos);
			a^.hi:= nil;
			a^.hd:= nil;
		end	else begin
			if(a^.tabla.isbn = p.isbn)then 
				agregarAdelante(a^.tabla.listaP,p.datos)
			else begin
				if(p.isbn < a^.tabla.isbn)then
					cargarArbol2(a^.hi,p)
				else
					cargarArbol2(a^.hd,p);
			end;
		end;
	end;
var
	p:prestamo;
begin
	leerPrestamo(p);
	while(p.isbn <> -1)do begin
		cargarArbol(a,p);
		cargarArbol2(a2,p);
		leerPrestamo(p);
	end;
end;
function isbnMayorArbolUno(a:arbol):integer;
begin
	if(a^.hd <> nil)then begin
		isbnMayorArbolUno:= isbnMayorArbolUno(a^.hd);
	end else
		isbnMayorArbolUno:= a^.p.isbn;
end;

function isbnMayoArbolDos(a:arbol2):integer;
begin
	if(a^.hi <> nil)then begin
		isbnMayoArbolDos:= isbnMayoArbolDos(a^.hi);
	end else
		isbnMayoArbolDos:= a^.tabla.isbn;
end;
function cantPrestamosArbolUno(a:arbol;numSocio:integer):integer;
var
	valorI,valorD:integer;
begin
	if(a <> nil)then begin
		valorI:= cantPrestamosArbolUno(a^.hi,numSocio);
		valorD:= cantPrestamosArbolUno(a^.hd,numSocio);
		cantPrestamosArbolUno:= valorI + valorD;
		if(a^.p.datos.numSocio = numSocio)then
			cantPrestamosArbolUno:= cantPrestamosArbolUno + 1;
	end
	else
		cantPrestamosArbolUno:= 0;
end;

function cantPrestamosArbolUnoAux(a:arbol;numSocio:integer):integer; //con auxiliares
var
	valorI,valorD,aux,valorHijos:integer;
begin
	aux:=0;
	if(a <> nil)then begin
		valorI:= cantPrestamosArbolUnoAux(a^.hi,numSocio);
		valorD:= cantPrestamosArbolUnoAux(a^.hd,numSocio);
		valorHijos:= valorI + valorD;
		if(a^.p.datos.numSocio = numSocio)then
			aux:= aux + 1;
		cantPrestamosArbolUnoAux:= valorHijos + aux;
	end
	else
		cantPrestamosArbolUnoAux:= 0;
end;

function cantPrestamosArbolDos(a:arbol2;numSocio:integer):integer;
	
	function cantPrestamoLista(l:lista;numSocio:integer):integer;
	begin
		if(l <> nil)then begin
			if(l^.d.numSocio = numSocio)then 
				cantPrestamoLista:= cantPrestamoLista(l^.sig,numSocio)+ 1
			else
				cantPrestamoLista:= cantPrestamoLista(l^.sig,numSocio);
		end else
			cantPrestamoLista:= 0;
	end;

var
	valorI,valorD:integer;
begin
	if(a <> nil)then begin
		valorI:= cantPrestamosArbolDos(a^.hi,numSocio);
		valorD:= cantPrestamosArbolDos(a^.hd,numSocio);
		cantPrestamosArbolDos:= valorI + valorD + cantPrestamoLista(a^.tabla.listaP,numSocio);
	end else
		cantPrestamosArbolDos:= 0;
end;







//probar hacerlo con una lista
procedure nuevaEstructura(a:arbol;var a3:arbol3);

	procedure insertarArbol3(var a:arbol3;isbn:integer);
	begin
		if(a = nil)then begin
			new(a);
			a^.dato.isbn:= isbn;
			a^.dato.cantPrestamos:= 1;
			a^.hd:=nil;
			a^.hi:=nil;
		end else begin
			if(a^.dato.isbn = isbn)then begin
				a^.dato.cantPrestamos:= a^.dato.cantPrestamos + 1;
			end else
				if(isbn < a^.dato.isbn)then 
					insertarArbol3(a^.hi,isbn)
				else
					insertarArbol3(a^.hd,isbn);
		end;
	end;

begin
	if(a^.hi <> nil)then begin
		insertarArbol3(a3,a^.p.isbn);
		nuevaEstructura(a^.hi,a3);
		nuevaEstructura(a^.hd,a3);
	end
	
end;

procedure nuevaEstructuraLista(a:arbol;var l:listaCant);

	procedure insertarOrdenado(var l:listaCant;isbn:integer);
	var
		nuevo,act,ant:listaCant;
	begin
		act:= l;
		ant:= l;
		
		while(act <> nil)and(act^.c.isbn < isbn)do begin
			ant:= act;
			act:= act^.sig;
		end;
		
		if(act <> nil) and (act^.c.isbn = isbn)then begin
				act^.c.cantPrestamos:= act^.c.cantPrestamos + 1
		end else begin
				new(nuevo);
				nuevo^.c.isbn:= isbn;
				nuevo^.c.cantPrestamos:= 1;
				if(act = ant)then 
					l:= nuevo
				else
					ant^.sig:= nuevo;
				
				nuevo^.sig:= act;
			end;
		
	end;

begin
	if(a <> nil)then begin
		insertarOrdenado(l,a^.p.isbn);
		nuevaEstructuraLista(a^.hi,l);
		nuevaEstructuraLista(a^.hd,l);
	
	end;
end;
procedure imprimirLC(l:listaCant);
begin
	while(l <> nil)do begin
		writeln('ISBN: ', l^.c.isbn);
		writeln('Cantida de prestamos: ', l^.c.cantPrestamos);
		l:= l^.sig;
	end;
end;

procedure cargarListaArbol2(a:arbol2;var l:listaCant);
	
	function cantPrestamos(l:lista):integer;
	var
		cant:integer;
	begin
		cant:= 0;
		while(l <> nil)do begin
			cant:= cant + 1;
			l:= l^.sig;
		end;
		cantPrestamos:= cant;
	end;
	
	procedure insertarOrdenadoArbol2(var l:listaCant;t:isbnTabla);
	var
		act,ant,nuevo:listaCant;
	begin
		new(nuevo);
		nuevo^.c.isbn:= t.isbn;
		nuevo^.c.cantPrestamos:= cantPrestamos(t.listaP);
		
		act := l;
		ant := l;
		while(act <> nil) and (act^.c.isbn < t.isbn)do begin
			ant:= act;
			act:= act^.sig;
		end;
		
		if(act = ant)then
			l:= nuevo
		else
			ant^.sig:= nuevo;
		nuevo^.sig:= act;
	
	end;
	
begin
	if(a <> nil)then begin
		insertarOrdenadoArbol2(l,a^.tabla);
		cargarListaArbol2(a^.hi,l);
		cargarListaArbol2(a^.hd,l);
	end;
end;


function cantPrestamosRango(a:arbol;isbn1,isbn2:integer):integer;
begin
	if(a <> nil)then begin
		if(a^.p.isbn >= isbn1)and(a^.p.isbn <= isbn2)then begin
			cantPrestamosRango:= cantPrestamosRango(a^.hi,isbn1,isbn2) + cantPrestamosRango(a^.hd,isbn1,isbn2) + 1;
		end else begin
			if(a^.p.isbn < isbn1)then 
				cantPrestamosRango:= cantPrestamosRango(a^.hd,isbn1,isbn2)
			else
				cantPrestamosRango:= cantPrestamosRango(a^.hi,isbn1,isbn2);
		end;
	end else
		cantPrestamosRango:= 0;
end;

function cantPrestamosRangoArbol2(a:arbol2;isbn1,isbn2:integer):integer;
	
	function cantPrestamos(l:lista):integer;
	var
		cant:integer;
	begin
		cant:= 0;
		while(l <> nil)do begin
			cant:= cant + 1;
			l:= l^.sig;
		end;
		cantPrestamos:= cant;
	end;
begin
	if(a <> nil)then begin
		if(isbn1 <= a^.tabla.isbn)and(a^.tabla.isbn <= isbn2)then begin
			cantPrestamosRangoArbol2:= cantPrestamosRangoArbol2(a^.hi,isbn1,isbn2) + cantPrestamosRangoArbol2(a^.hd,isbn1,isbn2) + cantPrestamos(a^.tabla.listaP);
		end else
			begin
				if(isbn1 > a^.tabla.isbn)then
					cantPrestamosRangoArbol2:= cantPrestamosRangoArbol2(a^.hd,isbn1,isbn2)
				else
					cantPrestamosRangoArbol2:= cantPrestamosRangoArbol2(a^.hi,isbn1,isbn2);
			end;
	end
	else 
		cantPrestamosRangoArbol2:= 0;

end;

var 
	a:arbol;
	a2:arbol2;
	a3:arbol3;
	lc,lc2:listaCant;
	numSocio,isbn1,isbn2:integer;

BEGIN
	a:= nil;
	a2:= nil;
	a3:= nil;
	
	lc:= nil;
	lc2:= niL;
	
	cargarEstructuras(a,a2);
	writeln('El isbn mayor del arbol 1 es: ', isbnMayorArbolUno(a));
	writeln('El isbn menor del arbol 2 es: ', isbnMayoArbolDos(a2));
	
	writeln('Ingrese un número de socio');
	readln(numSocio);
	writeln('La cantidad de prestamos realizados por dicho socio es: ', cantPrestamosArbolUno(a,numSocio));
	writeln('La cantidad de prestamos realizados por dicho socio es: ', cantPrestamosArbolDos(a2,numSocio));
	
	nuevaEstructura(a,a3);
	
	nuevaEstructuraLista(a,lc);
	imprimirLC(lc);
	
	writeln('------------------------Arbol 2-----------------------------');
	cargarListaArbol2(a2,lc2);
	imprimirLC(lc2);
	
	
	writeln('Ingrese el isbn1');
	readln(isbn1);
	
	writeln('Ingrese el isbn2');
	readln(isbn2);
	
	writeln('La cantidad de prestamos realizados entre el isbn1 y isbn2 es de: ', cantPrestamosRango(a,isbn1,isbn2));
	
	writeln('(ARBOL 2) La cantidad de prestamos realizados entre el isbn1 y isbn2 es de: ', cantPrestamosRangoArbol2(a2,isbn1,isbn2));
END.

