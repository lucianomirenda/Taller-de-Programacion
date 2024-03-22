program untitled;
type
	lista = ^nodo;
	
	nodo = record
		num:integer;
		sig:lista;
	end;
procedure agregarAdelante(var l:lista;n:integer);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.num:= n;
	nuevo^.sig:= l;
	l:= nuevo;
end;
procedure cargarLista(var l:lista);
var
	n:integer;
begin
	n:= random(101);
	if(n <> 0)then begin
		cargarLista(l);
		agregarAdelante(l,n);
	end else
		l:= nil;
	
end;
procedure minimoRecursivo(l:lista;var min:integer);
begin
	if(l<> nil)then begin
		if(l^.num < min)then
			min:= l^.num;
		minimoRecursivo(l^.sig,min);
	end;
end;
procedure iniciarMinimo(l:lista);
var
	min:integer;
begin
	min:= 32767;
	minimoRecursivo(l,min);
	writeln('El minimo es: ',min); 
end;
function min(a,b:integer):integer;
begin
	if(a<b)then 
		min:= a
	else
		min:= b;
end;

function minimo(l:lista):integer;
begin
	if(l = nil)then
		minimo:= 9999
	else
		minimo:= min(l^.num,minimo(l^.sig));
end;

function max(a,b:integer):integer;
begin
	if(a > b)then
		max:= a
	else
		max:= b;
end;

function maximo(l:lista):integer;
begin
	if(l = nil)then
		maximo:= -32768
	else
		maximo:= max(l^.num,maximo(l^.sig));
end;














//function minimo(l:lista):integer;
//begin
//	if(l<> nil)then
//		minimo:= l^.num < minimo(l^.sig)
//	else
//		minimo:= 999;
//end;
var
	l:lista;
BEGIN
	randomize;
	cargarLista(l);
	//iniciarMinimo(l);
	writeln(minimo(l));
	writeln(maximo(l));
	
	
END.

