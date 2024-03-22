program untitled;
procedure descomponerNumero(n:integer);
var
	digito:integer;
begin
	while(n <> 0)do begin
		digito:= n mod 10;
		writeln(digito);
		n:= n div 10;
	end;
end;

procedure descomponerRecursivo(n:integer);
begin
	if(n<>0)then begin
		descomponerRecursivo(n div 10);
		write(' ',n mod 10,' ');
	end;
end;
procedure lectorDeNumeros();
var 
	x:integer;
begin
	readln(x);
	while(x <> 0)do begin
		descomponerRecursivo(x);
		writeln();
		readln(x);
	end;
end;
var 
	n:integer;
BEGIN
	lectorDeNumeros();
	
END.

