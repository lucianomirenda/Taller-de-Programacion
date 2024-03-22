/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1;
import PaqueteLectura.Lector;
/**
 *
 * @author lucianomirenda
 */
public class ejercicio5 {
    
    public static void main(String[] args){
        //declaracion de variables
        int i,j;
        double suma;
    
        //estructuras
        double [][]criticas = new double[5][4];
        double []promedios = new double[4];
    
        //código 
        
        //leo las calificaciones
        for(i=0;i<5;i++){
            System.out.println("Cliente "+(i+1)+". ");
            for(j=0;j<4;j++){
                System.out.println("Calificación para el aspecto "+j+": ");
                criticas[i][j] = Lector.leerDouble();
            }
        }
        
        // obtengo los promedios
        for(j=0;j<4;j++){
            suma = 0;
            for(i=0;i<5;i++){
                suma = suma + criticas[i][j];
            }
            promedios[j] = suma / 5;
        }
        
        //imprimo los promedios
        for(i=0;i<4;i++)
            System.out.println("El promedio del aspecto "+i+" es: "+promedios[i]);
            
    
    
    }
}
