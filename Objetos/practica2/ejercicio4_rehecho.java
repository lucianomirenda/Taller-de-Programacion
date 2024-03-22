/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 *
 * @author lucianomirenda
 */
public class ejercicio4_rehecho {
    public static void main(String[] args){
        GeneradorAleatorio.iniciar();
        Persona [][]casting = new Persona[5][8];
        
        int dl = -1;
         
        int []dimTurnos = new int[5];
         
        for (int i = 0; i < 5; i++) {
            dimTurnos[i] = 0;
        }
         
         
         System.out.println("Nombre: ");
         String nombre = Lector.leerString();
         
         while((dl<39)&&(!nombre.equals("ZZZ"))){
            
            System.out.println("Ingrese el día");
            int dia = Lector.leerInt() - 1;

            if(dimTurnos[dia] < 5){
                casting[dia][dimTurnos[dia]] = new Persona(nombre,GeneradorAleatorio.generarInt(100),GeneradorAleatorio.generarInt(1000));    
                dimTurnos[dia]++;  
                dl++;
            } else {
                System.out.println("No hay turno para ese día");
            }
            System.out.println("Nombre: ");
            nombre = Lector.leerString();
            
        }
        
        for (int i = 0; i < 5; i++){
            System.out.println("La cantidad de turnos es "+dimTurnos[i]);
            for(int j = 0;j < dimTurnos[i];j++){
                System.out.println("Para el turno "+(j+1)+":");
                System.out.println(casting[i][j].getNombre());
            }
        }
        
    }
}
