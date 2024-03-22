/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author lucianomirenda
 */
public class CrearTriangulo {
    
    public static void main(String[] args){
        Triangulo t1 = new Triangulo(10,15,12,"Verde","Rosa");
        
        System.out.println(t1.calcularArea());
        
        System.out.println(t1.calcularPerimetro()); 
        
    
    }
}
