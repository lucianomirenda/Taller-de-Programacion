program untitled;
type

	finales = record
		codAlumno:integer;
		codMateria:integer;
		nota:integer;
	end;
	
	// Estructura 1. Arbol de alumnos con la lista de notas aprobadas por código de alumno.
	
	listaNotas = ^nodoNotas;
	
	nodoNotas = record
		nota:integer;
		sig:listaNotas;
	end;

	alumno = record
		codAlu:integer;
		notas:listaNotas;
	end;
	
	arbolAlumnos = ^nodoArbolAlumnos;
	
	nodoArbolAlumnos = record
		alu:alumno;
		hi:arbolAlumnos;
		hd:arbolAlumnos;
	end;
	
	//Estructura 2. Vector de materias con la lista de finales por materia.
	
	listaFinales = ^nodoFinales;
	
	aluNota = record
		codAlu:integer;
		nota:integer;
	end;
	
	nodoFinales = record
		alu:aluNota;
		sig:listaFinales;
	end;

	
	vectorFinales = array[1..30] of listaFinales;
	
	listaPromedios = ^nodoPromedios;
	
	promedios = record
		codAlu:integer;
		prom:real;
	end;
	
	nodoPromedios = record
		p:promedios;
		sig:listaPromedios;
	end;
		
	

procedure inicializarVectorFinales(var v:vectorFinales);
var
	i:integer;
begin
	for i:=1 to 30 do
		v[i]:= nil;
end;

procedure cargarEstructuras(var a:arbolAlumnos;var vf:vectorFinales);

	procedure leerFinal(var f:finales);
	begin
		writeln('Ingrese la nota del final');
		readln(f.nota);
		if(f.nota <> -1)then begin
			writeln('Ingrese el código de alumno');
			readln(f.codAlumno);
			writeln('Ingrese el código de materia');
			readln(f.codMateria);
		end;
	end;
	
	procedure insertarArbolAlumnos(var a:arbolAlumnos;codAlu:integer;nota:integer);
		
		procedure agregarAdelante(var l:listaNotas;n:integer);
		var
			nuevo:listaNotas;
		begin
			new(nuevo);
			nuevo^.nota:= n;
			nuevo^.sig:= l;
			l:= nuevo;
		end;
	
	begin
		if(a = nil)then begin
			new(a);
			a^.alu.codAlu:= codAlu;
			a^.alu.notas:= nil;
			agregarAdelante(a^.alu.notas,nota);
			a^.hi:= nil;
			a^.hd:= nil;
		end else begin
			if(a^.alu.codAlu = codAlu)then 
				agregarAdelante(a^.alu.notas,nota)
			else begin
				if(a^.alu.codAlu > codAlu)then
					insertarArbolAlumnos(a^.hi,codAlu,nota)
				else
					insertarArbolAlumnos(a^.hd,codAlu,nota);
			end;
		end;
	end;

	procedure insertarVector(var v:vectorFinales;f:finales);
	
		procedure agregarAdelante(var l:listaFinales;a:aluNota);
		var
			nuevo:listaFinales;
		begin
			new(nuevo);
			nuevo^.alu:= a;
			nuevo^.sig:= l;
			l:= nuevo;
		end;
	
	var 
		a:aluNota;
	begin
		a.codAlu:= f.codAlumno;
		a.nota:= f.nota;
		agregarAdelante(v[f.codMateria],a);
	end;

var
	f:finales;
begin
	leerFinal(f);
	while(f.nota <> -1)do begin
		
		if(f.nota >= 4)then
			insertarArbolAlumnos(a,f.codAlumno,f.nota);
			
		insertarVector(vf,f);
		
		leerFinal(f);
	end;

end;



//corroborar estructura 1.
procedure imprimirArbol(a:arbolAlumnos);
	
	procedure imprimirLista(l:listaNotas);
	begin
		while(l <> nil)do begin
			writeln('Nota: ',l^.nota);
			l:= l^.sig;
		end;
	end;

begin
	if(a <> nil)then begin
		imprimirArbol(a^.hi);
		writeln('Codigo de alumno: ',a^.alu.codAlu);
		imprimirLista(a^.alu.notas);
		imprimirArbol(a^.hd);
	end;
end;

//corroborar estructura 2

procedure imprimirVector(v:vectorFinales);

	procedure imprimirLista(l:listaFinales);
	begin
		while(l<>nil)do begin
			writeln('Codigo de alumno: ', l^.alu.codAlu);
			writeln('Nota del final: ', l^.alu.nota);
			l:= l^.sig;
		end;
	end;

var
	i:integer; 
begin
	for i:=1 to 30 do begin
		writeln('Codigo de materia: ',i);
		imprimirLista(v[i]);
		
	end;
end;

procedure cargarMayoresPromedios(a:arbolAlumnos;codigo:integer;var l:listaPromedios); 

	function promedio(l:listaNotas):real;
	var
		cant,suma:integer;
	begin
		cant:= 0;
		suma:= 0;
		while(l <> nil)do begin
			cant:= cant + 1;
			suma:= suma + l^.nota;
			l:= l^.sig;
		end;
		promedio:= suma / cant;
	end;
	
	procedure agregarAdelante(var l:listaPromedios;p:promedios);
	var
		nuevo:listaPromedios;
	begin
		new(nuevo);
		nuevo^.p:= p;
		nuevo^.sig:= l;
		l:= nuevo;
	end;

var
	p:promedios;
begin
	if(a <> nil)then begin
		if(a^.alu.codAlu > codigo)then begin
			cargarMayoresPromedios(a^.hi,codigo,l);
			
			p.codAlu:= a^.alu.codAlu;
			p.prom:= promedio(a^.alu.notas);
			agregarAdelante(l,p);
		
			cargarMayoresPromedios(a^.hd,codigo,l);
		end else
			cargarMayoresPromedios(a^.hd,codigo,l);
	end;
end;

procedure imprimirPromedios(l:listaPromedios);
begin
	while(l <> nil)do begin
		writeln('Codigo de alumno: ', l^.p.codAlu);
		writeln('Promedio: ', (l^.p.prom):2:2);
		l:=l^.sig;
	end;
end;

function rangoAprobados(a:arbolAlumnos;cod1,cod2,nota:integer):integer;

	function cantFinalesIguales(l:listaNotas;nota:integer):integer;
	var
		cant:integer;
	begin
		cant:= 0;
		while(l <> nil)do begin
			if(l^.nota = nota)then
				cant:= cant + 1;
			l:= l^.sig;
		end;
		cantFinalesIguales:= cant;
	end;

begin
	if(a <> nil)then begin
		if(cod1 < a^.alu.codAlu)and(a^.alu.codAlu < cod2)then 
			rangoAprobados:= rangoAprobados(a^.hi,cod1,cod2,nota) + rangoAprobados(a^.hd,cod1,cod2,nota) + cantFinalesIguales(a^.alu.notas,nota)
		else
			if(cod1 > a^.alu.codAlu)then
				rangoAprobados:= rangoAprobados(a^.hd,cod1,cod2,nota)
			else
				rangoAprobados:= rangoAprobados(a^.hi,cod1,cod2,nota);
	end 
	else
		rangoAprobados:= 0;
	

end;


var 
	a:arbolAlumnos;
	vf:vectorFinales;
	l:listaPromedios;
	cod,nota,cod1,cod2:integer;
BEGIN
	a:=nil;
	l:=nil;
	
	cargarEstructuras(a,vf);
	imprimirArbol(a);
	imprimirVector(vf);
	
	
	writeln('Ingrese un codigo');
	readln(cod);
	cargarMayoresPromedios(a,cod,l);       
	
	imprimirPromedios(l);
	
	writeln('Ingrese el codigo 1');
	readln(cod1);
	writeln('Ingrese el codigo 2');
	readln(cod2);
	writeln('Ingrese la nota ');
	readln(nota);
	writeln('La cantidad alumnos entre ese rango de códigos con la nota ',nota,' es: ',rangoAprobados(a,cod1,cod2,nota)); 
	
END.

