program untitled;
type 
	rFinal = record
		cod:integer;
		nota:integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		dato:rFinal;
		sig:lista;
	end;
	
	alumno = record
		legajo:integer;
		dni:integer;
		ingreso:integer;
		finales:lista;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato:alumno;
		hi:arbol;
		hd:arbol;
	end;
	
	lista2 = ^nodo2;
	
	infoB = record
		dni:integer;
		ingreso:integer;
	end;
	
	nodo2 = record
		dato:infoB;
		sig:lista2;
	end;
	
	lista3 = ^nodo3;
	
	infoF = record
		legajo:integer;
		promedio:real;
	end;
	
	nodo3 = record
		dato:infoF;
		sig:lista3;
	end;
	

procedure agregarAdelante(var l:lista;d:rFinal);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dato:= d;
	nuevo^.sig:= l;
	l:= nuevo;
end;

procedure agregarAdelante2(var l:lista2;dni,ingreso:integer);
var
	nuevo:lista2;
begin
	new(nuevo);
	nuevo^.dato.dni:= dni;
	nuevo^.dato.ingreso:= ingreso;
	nuevo^.sig:= l;
	l:= nuevo;
end;

procedure agregarAdelante3(var l:lista3;legajo:integer;promedio:real);
var
	nuevo:lista3;
begin
	new(nuevo);
	nuevo^.dato.legajo:= legajo;
	nuevo^.dato.promedio:= promedio;
	nuevo^.sig:= l;
	l:= nuevo;
end;


procedure lectura(var a:alumno);
var
	f:rFinal;
begin
	a.finales:= nil;
	
	writeln('Ingrese el legajo');
	readln(a.legajo);
	if(a.legajo <> 0)then begin
		writeln('Ingrese el DNI');
		readln(a.dni);
		writeln('Ingrese el ingreso');
		readln(a.ingreso);
		
		writeln('Ingrese el codigo de materia ');
		readln(f.cod);
		while(f.cod <> -1)do begin
			writeln('Ingrese la nota de la materia');
			readln(f.nota);
			agregarAdelante(a.finales,f);
			writeln('Ingrese el codigo de materia ');
			readln(f.cod);
		end;
	end;
end;

procedure agregarArbol(var a:arbol;alu:alumno);
begin
	if(a = nil)then begin
		new(a);
		a^.dato:= alu; a^.hi:= nil; a^.hd:= nil;
	end
	else if(alu.legajo <= a^.dato.legajo)then
			agregarArbol(a^.hi,alu)
		else
			agregarArbol(a^.hd,alu);
end;
procedure cargarArbol(var a:arbol);
var
	alu:alumno;
begin
	lectura(alu);
	while(alu.legajo <> 0)do begin
		agregarArbol(a,alu);
		lectura(alu);
	end;
end;


procedure recorrerB(a:arbol;leg:integer;var l2:lista2);
begin
	if(a <> nil)then
		if(a^.dato.legajo <= leg)then begin
			recorrerB(a^.hi,leg,l2);
			agregarAdelante2(l2,a^.dato.dni,a^.dato.ingreso);
			recorrerB(a^.hd,leg,l2);
		end
		else
			recorrerB(a^.hi,leg,l2);

end;

procedure puntoB(a:arbol;var l2:lista2);
var
	leg:integer;
begin
	writeln('Ingrese el número de legajo para buscar sus menores');
	readln(leg);
	recorrerB(a,leg,l2);
	
end;

function maxLegajo(a:arbol):integer;
begin
	if(a <> nil)then begin
		if(a^.hd <> nil)then 
			maxLegajo:= maxLegajo(a^.hd)
		else
			maxLegajo:= a^.dato.legajo;
	end
	else
		maxLegajo:= -1;
end;

function max(a,b:integer):integer;
begin
	if(a > b)then
		max:= a
	else
		max:= b;
end;

function maxDni(a:arbol):integer;
begin
	if(a = niL)then
		maxDni:= -1
	else
		maxDni:= max(a^.dato.dni, max(maxDni(a^.hi), maxDni(a^.hd)));

end;
procedure imprimir(l2:lista2);
begin
	while(l2 <> nil)do begin
		write('DNI: ');
		writeln(l2^.dato.dni);
		l2:= l2^.sig;
	end;

end;

function esImpar(n:integer):integer;
begin
	if(n mod 2 = 1)then
		esImpar:= 1
	else
		esImpar:= 0;
end;


function legajoImparSuma(a:arbol):integer;
begin
	if(a <> nil)then begin
		legajoImparSuma:= esImpar(a^.dato.legajo) + legajoImparSuma(a^.hi) + legajoImparSuma(a^.hd)
	end
	else
		legajoImparSuma:= 0;
end;

function retornarPromedio(l:lista):real;
var
	cant,suma:integer;
begin
	cant:= 0;
	suma:= 0;
	while(l <> nil)do begin
		suma:= l^.dato.nota + suma;
		cant:= cant + 1;
		l:= l^.sig;
	end;
	retornarPromedio:= suma / cant;
end;



procedure maxPromAlumno(a:arbol;var maxLegajo:integer;var maxPromedio:real);
var
	promedio:real;
begin
	if(a <> nil)then begin
		maxPromAlumno(a^.hi,maxLegajo,maxPromedio);
		promedio:= retornarPromedio(a^.dato.finales);
		if(promedio > maxPromedio)then begin
			maxPromedio:= promedio;
			maxLegajo:= a^.dato.legajo;
		end;
		maxPromAlumno(a^.hd,maxLegajo,maxPromedio);
	end;

end;

procedure inicializarMaxPromAlumno(a:arbol);
var
	maxLegajo:integer;
	maxPromedio:real;
begin
	maxPromedio:= -32768;
	maxPromAlumno(a,maxLegajo,maxPromedio);
	
	writeln('El alumno es ', maxLegajo,' y su promedio ', maxPromedio);
end;

procedure cargarPromedios(a:arbol;var l3:lista3;vara:integer);
var
	promedio:real;
begin
	if(a <> nil)then begin
		cargarPromedios(a^.hi,l3,vara);
		promedio:= retornarPromedio(a^.dato.finales);
		if(promedio > vara)then
			agregarAdelante3(l3,a^.dato.legajo,promedio);
		cargarPromedios(a^.hd,l3,vara);
	end;
end;
procedure imprimirLista3(l3:lista3);
begin
	while(l3 <> nil)do begin
		writeln('Legajo: ', l3^.dato.legajo);
		writeln('Promedio: ', l3^.dato.promedio);
		l3:= l3^.sig;
	end;
end;
var
	a:arbol;
	l2:lista2;
	l3:lista3;
	vara:integer;
BEGIN
	a:= nil;
	l2:= nil;
	l3:= nil;
	
	cargarArbol(a);
	puntoB(a,l2);
	imprimir(l2);
	
	writeln('El número de lenguaje más grande es: ', maxLegajo(a));
	writeln('La cantidad de alumnos con legajo impar es: ', legajoImparSuma(a));
	
	inicializarMaxPromAlumno(a);
	
	writeln('Ingrese la vara de los promedios');
	readln(vara);
	cargarPromedios(a,l3,vara);
	imprimirLista3(l3);
	
END.
