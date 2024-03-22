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
public class TestPizza {
    public static void main(String[] args){
        PizzaItaliana pi = new PizzaItaliana(80,2.5,"La pizzota");
        
        System.out.println(pi.getTamaño());
        
        System.out.println(pi.getNombre());
    }
}
