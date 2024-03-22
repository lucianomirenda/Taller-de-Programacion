program ejercicio1;
type
	materias = 1 .. 36;
	
	vecMat = array[materias] of integer;
	
	alumno = record
		apellido:string;
		numAlu:integer;
		ingreso:integer;
		cantAprobadas:integer;
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
	i:integer;
begin
	writeln('Apellido: ');
	readln(a.apellido);
	writeln('Número de alumno: ');
	readln(a.numAlu);
	writeln('Año de ingreso: ');
	readln(a.ingreso);
	writeln('Cantidad de materias aprobadas: ');
	readln(a.cantAprobadas);
	for i:=1 to a.cantAprobadas do begin
		writeln('Ingresa la nota ',i,': ');
		readln(a.notas[i]);
	end;
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
end.





















