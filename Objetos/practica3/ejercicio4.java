/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author sappydumb
 */
public class ejercicio4 {
    public static void main(String[] args){
        Persona juan = new Persona("Juan",999,24);
        Persona pepe = new Persona("Pepe",666,30);
        Persona carlos = new Persona("Carlos",777,44);
        
        Hotel shaoShao = new Hotel(5);
        
        shaoShao.ingresarCliente(juan, 2);
        shaoShao.ingresarCliente(pepe, 3);
        shaoShao.ingresarCliente(carlos,5);
        
        System.out.println(shaoShao.toString());
        
        shaoShao.aumentarPrecio(400);
        
        System.out.println(shaoShao.toString());
    }
}
