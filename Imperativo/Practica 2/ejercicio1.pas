program untitled;
const
	df = 10;
type
	rango = 1 .. df;
	vector = array[rango] of char;
procedure leerCaracteres(var v:vector;i:integer);
begin
	if(i >= 1)then begin
		leerCaracteres(v,i-1);
		readln(v[i]);
	end;
end;
//MODULO HECHO POR EL PROFESOR
procedure cargarVector(var v:vector;var dl:integer);
var
	c:char;
begin
	readln(c);
	if(c <> '.')and(dl < 10)then
	begin
		dl:= dl + 1;
		v[dl]:= c;
		cargarVector(v,dl);
	end;
end;
procedure iniciarCarga(var v:vector;var dl:integer);
begin
	dl:=0;
	cargarVector(v,dl);
end;

procedure imprimirVector(v:vector);
var
	i:integer;
begin
	writeln('');
	for i:=1 to df do 
		writeln(v[i]);
	writeln('');
end;
procedure imprimirVectorRecursivo(v:vector;i:integer);
begin
	if(i >=1)then begin
		imprimirVectorRecursivo(v,i-1);
		writeln(v[i]);
	end;
end;
//Imprimir con dimensión lógica
procedure imprimirRec(v:vector;dl:integer);
begin
	if(dl > 0)then begin
		imprimirRec(v,dl-1);
		writeln(v[dl]);
	end;
end;



procedure contarCaracteres(var cant:integer);
var
	c:char;
begin
	readln(c);
	if(c <> '.')then begin
		cant:= cant + 1;
		contarCaracteres(cant);
	end;
end;

function contarCaracteres():integer;
var
	c:char;
begin
	readln(c);
	if(c <> '.')then
		contarCaracteres():= contarCaracteres() + 1;
	else
		contarCaracteres:= 0;
end;

var
	v:vector;
	i,cant:integer;
BEGIN
	//i:=df;
	//leerCaracteres(v,i);
	//imprimirVector(v);
	//writeln('-----------------------');
	//imprimirVectorRecursivo(v,i);
	cant:=0;
	contarCaracteres(cant);
	writeln('La cantidad de caracteres fue ', cant);
	 
END.

