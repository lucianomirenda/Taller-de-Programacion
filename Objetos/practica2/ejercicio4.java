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
public class ejercicio4 {
    public static void main(String[] args){
         GeneradorAleatorio.iniciar();
         Persona [][]casting = new Persona[5][8];
         int dl = -1;
         
         for (int i = 0; i < 5; i++) {
             for (int j = 0; j < 8; j++) {
                 casting[i][j] = new Persona("",-1,-1);
             }
        }
         
         
         System.out.println("Nombre: ");
         String nombre = Lector.leerString();
         
         while((dl<39)&&(!nombre.equals("ZZZ"))){
            
            System.out.println("Ingrese el día");
            int dia = Lector.leerInt() - 1;
            int turno = 0;
            
            
            boolean hayTurno = false;
            
            while((!hayTurno)&&(turno < 8)){
                if(casting[dia][turno].getDNI() == -1)
                    hayTurno = true;
                else{
                    turno++;
                }
            } 
            
            if(hayTurno){
                casting[dia][turno].setNombre(nombre);
                casting[dia][turno].setEdad(GeneradorAleatorio.generarInt(100));
                casting[dia][turno].setDNI(GeneradorAleatorio.generarInt(1000));
                dl++;
            } else {
                System.out.println("No hay turno para ese día");
            }
            System.out.println("Nombre: ");
            nombre = Lector.leerString();
            
        }
        for (int i = 0; i < 5; i++) {
            int cant = 0;
            System.out.println("Para el dia "+(i+1)+":");
            for (int j = 0; j < 8; j++) {
                if(casting[i][j].getDNI()!= -1){
                    System.out.println("Para el turno "+(j+1)+":");
                    System.out.println(casting[i][j].getNombre());
                    cant++;
                }
            }
            System.out.println("La cantidad de turnos  ocupados son:  "+cant);
        }
         
    }
}
