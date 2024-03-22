program untitled;
const
	df = 10;
type
	rango = 0..df;

	vector = array[rango] of integer;

procedure cargarVector(var v:vector;var dl:rango);
var
	n:integer;
begin
	dl:= 0;
	writeln('Ingrese un numero');
	readln(n);
	while(n <> -1)do begin
		dl:= dl + 1;
		v[dl]:= n;
		writeln('Ingrese un numero');
		readln(n);
	end;
end;

procedure imprimirVector(v:vector;dl:rango);
var
	i:rango;
begin
	writeln;
	for i:= 1 to dl do begin
		write('[',v[i],'] ');
	end;
	writeln;
end;

procedure ordenarSeleccion(var v:vector;dl:rango);
var
	i,j,pos:rango;
	aux:integer;
begin
	for i:=1 to dl-1 do begin
		pos:= i;
		for j:=i+1 to dl do 
			if(v[j] < v[pos])then pos:= j;
		aux:= v[i];
		v[i]:= v[pos];
		v[pos]:= aux;
	end;
end;

procedure ordenarSeleccio(var v:vector;dl:rango);
var
	i,j,pos:rango;
	aux:integer;
begin
	for i:=1 to dl-1 do begin
		pos:= i;
		for j:=i+1 to dl do 
			if(v[j] < v[pos])then pos:= j;
		aux:= v[i];
		v[i]:= v[pos];
		v[pos]:= aux;
	end;
end;

procedure buscarNumero(v:vector;dl:rango);

	function busquedaDicotomica(v:vector;dl:rango;dato:integer):boolean;
	var
		int,mid,fin:integer;
	begin
		int:=1; fin:= dl; mid:= (int+fin) div 2;
	
		while(int <= fin)and(v[mid] <> dato)do begin
			if(dato < v[mid])then
				fin:= mid -1
			else
				int:= mid + 1;
				
			mid:= (int+fin) div 2;
		end;
	
		if(int <= fin)and(dato = v[mid])then
			busquedaDicotomica:= true
		else
			busquedaDicotomica:= false;
	
	end;
var
	n:integer;
begin
	writeln('Ingresa el número a buscar');
	readln(n);
	
	if(busquedaDicotomica(v,dl,n))then
		writeln('El valor existe')
	else
		writeln('El valor NO existe');
	
end;

function busquedaLoca(v:vector;dl:rango;valor:integer):boolean;
var
	int,mid,fin:integer;
begin
	int:= 1; fin:= dl; mid:= (int+fin) div 2;
	
	while(int <= fin)and(valor <> v[mid])do begin
		
		if(valor < v[mid])then
			fin:= mid - 1
		else
			int:= mid + 1;
	
		mid:= (fin+int) div 2
	end;
		
	if(int <= fin)and(valor = v[mid])then
		busquedaLoca:= true
	else
		busquedaLoca:= false;
	
end;


var 
	v:vector;
	dl:rango;
	n:integer;
BEGIN
	cargarVector(v,dl);
	imprimirVector(v,dl);
	ordenarSeleccion(v,dl);
	imprimirVector(v,dl);
	writeln('numero: ');
	readln(n);
	writeln(busquedaLoca(v,dl,n));
END.

