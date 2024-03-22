
program untitled;

// recorrerArbol

procedure recorrerArbol(a:arbol);
begin
	if(a <> nil)then begin
		recorrer(a^.hi);
		writeln(a^.dato);
		recorrer(a^.hd);
	end;
end;

// retornar valor máximo/mínimo teniendo en cuenta el orden

function retornarMax(a:arbol):integer;
begin
	if(a <> nil)then begin
		if(a^.hd <> nil)then
			retornarMax:= retornarMax(a^.hd)
		else
			retornarMax:= a^.dato;
	end else
		retornarMax:= -1;
end;

function retornarMin(a:arbol):integer;
begin
	if(a <> nil)then begin
		if(a^.hi <> nil)then
			retornarMin:= retornarMin(a^.hi)
		else
			retornarMin:= a^.dato
	end else
		retornarMin:= -1
end;

// retornar máximo/mínimo de un dato que no esta ordenado en el arbol. 
// Es imposible con una función porque tenes que retornar dos valores. 

procedure maximo(a:arbol;var maxNum,maxDato:integer);
begin
	if(a <> nil)then begin
		maximo(a^.hi,maxNum,maxDato);
		if(a^.num > maxNum)then begin
			maxNum:= a^.num;
			maxDato:= a^.dato;
		end
		maximo(a^.hd,maxNum,maxDato);
	end;
end;

// suma de todos los valores en un arbol
function sumatoria(a:arbol):integer;
begin
	if(a <> nil)then begin
		sumatoria:= sumatoria(a^.hi) + sumatoria(a^.hd) + a^.valor;
	end
	else
		sumatoria:= 0;
end;

//buscar un dato teniendo en cuenta el orden
function buscarDato(a:arbol:dato:integer):boolean;
begin
	if(a <> nil)then begin
		if(a^.dato = dato)then begin
			buscarDato:= true;
		end else
			if(a^.dato > dato)then
				buscarDato:= buscarDato(a^.hi,n)
			else
				buscarDato:= buscarDato(a^.hd,n);
		end;
	end
	else 
		buscarDato:= false;
end;

//buscar un dato sin tener en cuenta el orden

function buscarDatoSinOrden(a:arbol:dato:integer):boolean
begin
	if(a <> nil)then begin
		if(a^.dato = dato)then 
			buscarDatoSinOrden:= true;
		else
			buscarDatoSinOrden:= buscarDatoSinOrden(a^.hi,dato) or buscarDatoSinOrden(a^.hd,dato);
	end
	else
		buscarDatoSinOrden:= false;
	
end;

//retornar menores/mayores 

function retornarMayores(a:arbol;valor:integer):integer;
begin
	if(a <> nil)then begin
		if(a^.num > valor)then 
			retornarMayores:= retornarMayores(a^.hi,valor) + retornarMayores(a^.hd) + 1
		else
			retornarMayores:= retornarMayores(a^.hd,valor);
	end
	else
		retornarMayores:= 0;
end;

//retornar mayores/menores en una lista

procedure retornarMayores(a:arbol;valor:integer;l:lista);
	
	procedure agregarAdelante(l:lista;valor);
	var
		nuevo:lista;
	begin
		new(nuevo);
		nuevo^.dato:= valor;
		nuevo^.sig:= l;
		l:= nuevo;
	end;
	
begin
	if(a <> nil)then begin
		if(a^.num > valor)then begin
			retornarMayores(a^.hi,valor); 
			agregarAdelante(l,a^.num);
			retornarMayores(a^.hd,valor);
		end
		else
			retornarMayores:= retornarMayores(a^.hd,valor);
	end
end;

//retornar la cantidad entre dos valores 

function cantidadRango(a:arbol;num1,num2:integer):integer;
begin
	if(a <> nil)then begin
		if(num1 < a^.num)and(a^.num < num2)then begin
			cantidadRango:= 1 + cantidadRango(a^.hi,num1,num2) + cantidadRango(a^.hd,num1,num2)
		end
		else
			if(num1 >= a^.num)then 
				cantidadRango:= cantidadRango(a^.hd,num1,num2)
			else
				cantidadRango:= cantidadRango(a^.hi,num1,num2);
	end
	else
		cantidadRango:= 0;
end;

// cantidad de ocurrencias de un dato recorriendo todo el arbol

function buscarDato(a:arbol;dato:integer):integer;
begin
	if(a<> nil)then begin
		if(a^.dato = dato)then 
			buscarDato:= 1 + buscarDato(a^.hi,dato) + buscarDato(a^.hd,dato)
		else
			buscarDato:= buscarDato(a^.hi,dato) + buscarDato(a^.hd,dato);
	end
	else
		buscarDato:= 0;
end;

//buscar dato/cantidad teniendo en cuenta el orden

function buscarDato


var i : byte;

BEGIN
	
	
END.

