program practica1_ejercicio1;
const
	df = 5;
type
	oficina = record
		codigo:integer;
		dni:integer;
		valor:real;
	end;
	
	vOficina = array[1 .. 5] of oficina;

procedure cargarEstrcutura(var v:vOficina; dl:integer);
	procedure leerinfo(var reg:oficina);
	begin
		readln(reg.codigo);
		if(reg.codigo <> -1)then begin
			readln(reg.dni);
			readln(reg.valor);
		end;
	end;
var
	reg:oficina;
begin
	leerinfo(reg);
	while(reg.codigo <> -1)and(dl < df) do begin
		dl:= dl + 1;
		v[dl]:= reg;
		leerinfo(reg);
	end;

end;
procedure ordenarSeleccion(var v:vOficina;dl:integer);
var
	i,j,pos:integer;
	aux:oficina;
begin
	for i:= 1 to dl-1 do begin
		pos:= i;
		for j:= i+1 to dl do 
			if(v[j].codigo < v[pos].codigo)then pos:= i;
		aux:= v[pos];
		v[pos]:= v[i];
		v[i]:= aux;
	end;

end;


BEGIN
	
	
END.

