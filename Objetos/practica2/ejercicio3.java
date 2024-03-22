/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;
import PaqueteLectura.Lector;
/**
 *
 * @author lucianomirenda
 */
public class ejercicio3 {
    public static void main(String[] args){
    
        Persona [][]casting = new Persona[5][8];
        
        int dl = -1;
        
        String nombre;
        
        System.out.println("Ingrese un nombre: ");
        nombre = Lector.leerString();
        
        while((dl<39)&&(!nombre.equals("ZZZ"))){
            dl++;
            int dia = dl / 5, turno = dl % 8;
            
            System.out.println("DIA: "+ dia);
            System.out.println("TURNO: "+ turno);
            
            casting[dia][turno] = new Persona();
            casting[dia][turno].setNombre(nombre);
            
            System.out.println("Ingrese su edad");
            casting[dia][turno].setEdad(Lector.leerInt());
            
            System.out.println("Ingrese su DNI");
            casting[dia][turno].setDNI(Lector.leerInt());
            
            System.out.println("Ingrese un nombre: ");
            nombre = Lector.leerString();
        }
        
        for (int i = 0; i <= dl; i++) {
            int dia = i / 5, turno = i % 8;
            
            System.out.println("DIA: "+ dia);
            System.out.println("TURNO: "+turno);
            System.out.println(casting[dia][turno].toString());
        }
    }
}
