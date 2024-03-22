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
public class ejercicio1 {
    
    public static void main(String[] args){
        Persona pepe = new Persona("pepe",1234,22);
        
        System.out.println("Nombre: "+ pepe.getNombre());
        System.out.println("Dni: "+ pepe.getDNI());
        System.out.println("Edad: "+ pepe.getEdad());
        
        Persona jorge = new Persona();
        
        System.out.println("Ingrese su nombre: ");
        jorge.setNombre(Lector.leerString());
        
        System.out.println("Ingrese la edad: ");
        jorge.setEdad(Lector.leerInt());
        
        System.out.println("Ingrese el DNI: ");
        jorge.setDNI(Lector.leerInt());
        
        System.out.println(jorge.toString());
    }   
}
