program untitled;
const
	df = 10;
type
	rango = 1..df;
	vec = array[rango] of integer;

procedure insertarVector(var v:vec;var dl:integer);
var
	num:integer;
begin
	dl:= 0;
	readln(num);
	while(dl < df)and(num <> -1)do begin
		dl:= dl + 1;
		v[dl]:= num;
		readln(num);
	end;
end;
procedure algoritmoSeleccion(var v:vec;dl:rango);
var
	i,j,pos:rango;
	aux:integer;
begin
	for i:=1 to dl-1 do begin
		pos:= i;
		for j:=i+1 to dl do 
			if(v[j] < v[pos])then pos:= j;
		
		aux:= v[pos];
		v[pos]:= v[i];
		v[i]:= aux;  
	end;
end;
procedure imprimirVector(v:vec;dl:integer);
var
	i:integer;
begin
	for i:=1 to dl do begin
		writeln(v[i]);
	end;
end;

procedure algoSeleccion(var v:vec;dl:integer);
var
	i,j,pos,dato:integer;
begin
	for i:=1 to dl do begin
		pos:= i;
		for j:=i+1 to dl do
			if(v[j] > v[pos])then pos:= j;
		dato:= v[pos];
		v[pos]:= v[i];
		v[i]:= dato;
	end;
	
end;

var 
	v:vec;
	dl:integer;
BEGIN
	insertarVector(v,dl);
	algoritmoSeleccion(v,dl);
	imprimirVector(v,dl);
END.

