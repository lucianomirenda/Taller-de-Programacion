/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
        //variables
        int i,j,sumaFila = 0,sumaColumna,num,posF,posC;
        boolean esta;
        
	//Paso 2. iniciar el generador aleatorio     
	 GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int [][]matriz = new int[5][5];
        
        //defino el vector
        int []vector = new int[5];
        
        for(i=0;i<5;i++)
            for(j=0;j<5;j++)
                matriz[i][j] = GeneradorAleatorio.generarInt(31);
        
        
        
        //Paso 4. mostrar el contenido de la matriz en consola
        for(i=0;i<5;i++){
            System.out.println("");
            for(j=0;j<5;j++)
                System.out.print("["+matriz[i][j]+"] ");
        }
        System.out.println("");
    
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        for (i=0;i<5;i++)
            sumaFila = sumaFila + matriz[1][i];
        
        System.out.println("La suma de los elementos de la fila 1 es: "+sumaFila);
        
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        
        for(j=0;j<5;j++){
            sumaColumna = 0;
            for(i=0;i<5;i++){
                sumaColumna = sumaColumna + matriz[i][j];
            }
            vector[j] = sumaColumna;
        }
        
        for(i=0;i<5;i++){
            System.out.println("la suma de la columna "+(i+1)+" es: "+vector[i]);
        }   

        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        
        System.out.println("Ingrese un número: ");
        num = Lector.leerInt();
        
        posF = 0;
        posC = 0;
        esta = false;
        
        while((posF<5)&&(!esta)){
            posC = 0;
            while((posC<5)&&(!esta)){
                if(matriz[posF][posC] == num)
                    esta = true;
                else
                    posC++;
            }
            if(!esta)
                posF++;
        }
        
        int tamaño = matriz.length;
        
        System.out.println(tamaño);
        
        if(esta)
            System.out.println("La posición del numero es fila: "+posF+" y columna "+posC);
        else
            System.out.println("No se encontre el elemento");
    
        
        
        String palabra = "Eso es queso";
        
        char letra = palabra.charAt(2);
        
        System.out.println(letra);
        
    }
    
    
    
   
    
}
