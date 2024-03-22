/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4;

/**
 *
 * @author sappydumb
 */
public class testFiguras {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Cuadrado square1 = new Cuadrado(4,"Rojo","Negro");
        Circulo circle1 = new Circulo(2,"Amarillo","Violeta");
        
        System.out.println(square1.toString() + " \n" + circle1.toString());
    }
    
}
