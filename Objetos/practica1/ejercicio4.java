/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

/*
problema: Nosotros tenemos que simular un dificio con 8 pisos y 4 oficinas. La persona que ingresa,
ingresa números del 1 al 8. Es más, debemos detenernos cuando se ingresa el 9. 
El problema es que nuestra matriz en realidad trabaja con posiciones que van de 0 a 7 y 0 a 4
¿Esta bien mi solución?
*/

/**
 *
 * @author lucianomirenda
 */
public class ejercicio4 {
    public static void main(String[] args){
        GeneradorAleatorio.iniciar();
        //variables
        int piso,oficina,i,j;
        //estructuras de datos
        int [][]edificio = new int[8][4];
        
        //inicializo la matriz
        for(i=0;i<8;i++)
            for(j=0;j<4;j++)
                edificio[i][j] = 0;
        
        
        //llegada de personas
        System.out.println("Ingrese el piso: ");
        piso = GeneradorAleatorio.generarInt(8)+1;
        
        while(piso != 9){
            System.out.println("Ingrese la oficina: ");
            oficina = GeneradorAleatorio.generarInt(4)+1;
            edificio[piso-1][oficina-1] = edificio[piso-1][oficina-1] + 1;
            
            System.out.println("Piso: "+piso+" Oficina: "+oficina);
            
            System.out.println("Ingrese el piso: ");
            piso = GeneradorAleatorio.generarInt(9)+1;
        }
        
        for(i=0;i<8;i++){
            System.out.println("En el piso "+(i+1)+":");
            for(j=0;j<4;j++)
                System.out.println("Oficina "+(j+1)+": "+ edificio[i][j]);
            
            System.out.println("-");
        
        }
    }
}
