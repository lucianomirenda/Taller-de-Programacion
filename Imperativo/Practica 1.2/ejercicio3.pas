program untitled;
type
	lista= ^nodo;
	
	infoPelis=record
		genero:integer;
		codP:integer;
		pNota:real;
	end;
	
	nodo=record
		dato:infoPelis;
		sig:lista;
	end;

	vGenero= array [1..8] of lista; 

procedure inicialiarV(var vec:lista);
	var
		i:integer;
	begin
		for i:=1 to 8 do
			vec[i]:=nil;
	end;
	
procedure generarVector(var v:vGenero);
	procedure leerinfo(var reg:oficina);
		begin
			readln(reg.codP);
			if(reg.codP <> -1)then begin
				readln(reg.genero);
				readln(reg.pNota);
			end;
		end;
	procedure generarLista(var lis:lista;var ult:lista;reg:infoPelis)
		var
			aux:lista;
		begin
			new(aux);
			aux^.dato:=reg;
			if(lis=nil)then
			begin
				aux^.sig:=lis;
				lis:=aux;
				ult:=lis;
			end
			else
			begin
				aux^.sig:=nil;
				ult^.sig:=aux;
				ult:=aux;
			end;
		end;
var
	reg:infopelis;
	ult:lista;
begin
	leerinfo(reg);
	while(reg.codP<>-1) do
	begin
		generarList(v[reg.genero],ult,reg);
		leerinfo(reg);
	end
end;
BEGIN
	
	
END.

