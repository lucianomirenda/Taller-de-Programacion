/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4.ejercicio2;

/**
 *
 * @author sappydumb
 */
public class ClubMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Jugador pedro = new Jugador(10,70,"Pedro",10000,5);
        Entrenador jose = new Entrenador(10,"jose",10000,5);
        
        System.out.println(pedro.toString());
        System.out.println(jose.toString());
        
        /* 
            Preguntar si esta bien la forma de invocar el método calcularSueldo en el 
            toString a pesar de que ya haya un método como tal dentro de la super clase
        */
    }
    
}
