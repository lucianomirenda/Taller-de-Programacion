program ejercicio1;
type
	materias = 1 .. 36;
	
	vecMat = array[materias] of integer;
	
	alumno = record
		apellido:string;
		numAlu:integer;
		ingreso:integer;
		cantAprobadas:integer;
		cantAplazos:integer;
		notas:vecMat;
	end;
	
	lista = ^nodo;
	
	nodo = record
		alu:alumno;
		sig:lista;
	end;
	
	alumno2 = record
		numAlu:integer;
		promedio:real;
	end;
	
	lista2 = ^nodo2;
	
	nodo2 = record
		alu2:alumno2;
		sig:lista2;
	end;
		
procedure leerAlu(var a:alumno);
var
	nota,cantNotas,aprobadas,aplazos:integer;
begin
	cantNotas:= 0;
	aprobadas:= 0;
	aplazos:= 0;
	writeln('Apellido: ');
	readln(a.apellido);
	writeln('Número de alumno: ');
	readln(a.numAlu);
	writeln('Año de ingreso: ');
	readln(a.ingreso);
	
	writeln('Ingresar la nota');
	readln(nota);
	while((nota <> -1)and (cantNotas <= 36))do begin
		cantNotas:= cantNotas + 1;
		if(nota >= 4)then begin
			aprobadas:= aprobadas + 1;
			a.notas[aprobadas]:= nota;
		end else begin
			aplazos:= aplazos + 1;
		end;
		writeln('Ingresar la nota');
		readln(nota);
	end;
	a.cantAprobadas:= aprobadas;
	a.cantAplazos:= aplazos;
end;
procedure agregarAdelante(var l:lista;a:alumno);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.sig:= l;
	nuevo^.alu:= a;
	l:= nuevo;
end;
procedure cargarLista(var l:lista);
var
	a:alumno;
begin
	repeat 
		leerAlu(a);
		agregarAdelante(l,a);
	until(a.numAlu = 11111);
end;
function promedioAlu(notas:vecMat;cantA:integer):real;
var
	i,suma:integer;
begin
	suma:= 0;
	for i:=1 to cantA do begin
		suma:= suma + notas[i];
	end;
	promedioAlu:= suma / cantA;
end;
procedure agregarAdelante2(var l2:lista2;a2:alumno2);
var
	nuevo:lista2;
begin
	new(nuevo);
	nuevo^.alu2:= a2;
	nuevo^.sig:= l2;
	l2:= nuevo;
end;
procedure cargarPromedios(var l2:lista2;l:lista);
var
	a2:alumno2;
begin
	while(l <> nil)do begin
		a2.numAlu:= l^.alu.numAlu;
		a2.promedio:= promedioAlu(l^.alu.notas,l^.alu.cantAprobadas);
		agregarAdelante2(l2,a2);
		l:= l^.sig;
	end;
end;
procedure imprimirPromedios(l2:lista2);
begin
	while(l2 <> nil)do begin
		writeln(l2^.alu2.numAlu);
		writeln(l2^.alu2.promedio:2:2);
		writeln('...............');
		l2:= l2^.sig;
	end;
end;
var
	l:lista;
	l2:lista2;
begin
	l2:= nil;
	l:= nil;
	cargarLista(l);
	cargarPromedios(l2,l);
	imprimirPromedios(l2);
end.





















