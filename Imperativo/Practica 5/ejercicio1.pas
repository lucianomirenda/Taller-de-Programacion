program untitled;
const
	df = 300;
type

	expensa = record
		id:integer;
		dni:integer;
		valor:real;
	end;

	vecExpensas =  array[1..df] of expensa;

procedure cargarVector(var v:vecExpensas;var dl:integer);

	procedure leerExpensa(var e:expensa);
	begin
		writeln('Ingrese la identificacion');
		readln(e.id);
		if(e.id <> -1)then begin
			writeln('Ingrese el dni');
			readln(e.dni);
			writeln('Ingrese el valor');
			readln(e.valor);
		end;
	end;
var
	e:expensa;
begin
	dl:= 0;
	leerExpensa(e);
	while(dl < df)and(e.id <> -1)do begin
		dl:= dl + 1;
		v[dl]:= e;
		leerExpensa(e);
	end;

end;

procedure algoritmoSeleccion(var v:vecExpensas;dl:integer);
var
	i,j,pos:integer;
	e:expensa;
begin
	for i:=1 to dl-1 do begin
		pos:= i;
		for j:=i+1 to dl do 
			if(v[j].id < v[pos].id)then pos:= j;
		e:= v[pos];
		v[pos]:= v[i];
		v[i]:= e;
	
	end;

end;

function busquedaDicotomica(v:vecExpensas;dl:integer;codId:integer):integer;
var
	int,fin,mid:integer;
begin
	int:= 1; fin:= dl; mid:= (int + fin) div 2;
	
	while((int <= fin)and(codId <> v[mid].id))do begin
		
		if(codId < v[mid].id)then
			fin:= mid - 1
		else
			int:= mid + 1;
		
		mid:= (int + fin) div 2;
		
	end;
	
	if((int <= fin)and(codId = v[mid].id))then 
		busquedaDicotomica:= mid
	else
		busquedaDicotomica:= 0;
	
end;

function montoTotalExpensas(v:vecExpensas;dl:integer):real;
begin
	if(dl<>0)then
		montoTotalExpensas:= montoTotalExpensas(v,dl-1) + v[dl].valor
	else
		montoTotalExpensas:= 0;
end;

var 
	v:vecExpensas;
	dl,pos,codigo:integer;
BEGIN
	cargarVector(v,dl);
	algoritmoSeleccion(v,dl);
	writeln('Ingrese un codigo de identificacion');
	readln(codigo);
	pos:= busquedaDicotomica(v,dl,codigo);
	if(pos <> 0)then
		writeln('DNI: ',v[pos].dni)
	else
		writeln('No se encontro');
		
	writeln('El monto total de todas las expensas es: ', montoTotalExpensas(v,dl));
END.

