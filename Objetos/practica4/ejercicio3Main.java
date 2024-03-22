/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4;

/**
 *
 * @author lucianomirenda
 */
public class ejercicio3Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona juan = new Persona("Juan",666,18);
        
        System.out.println(juan.toString());
    
        Trabajadores pablo = new Trabajadores("Pintor","Pablo",123,909);
        
        System.out.println(pablo.toString());
    
    }
    
}
