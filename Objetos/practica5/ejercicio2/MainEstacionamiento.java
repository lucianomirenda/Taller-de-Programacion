/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5.ejercicio2;

/**
 *
 * @author lucianomirenda
 */
public class MainEstacionamiento {

    public static void main(String[] args) {
        Estacionamiento estacionamiento = new Estacionamiento("Pepe Garaje","Calle 32");
        
        Auto auto1 = new Auto("Juan","LOL666");
        Auto auto2 = new Auto("Pedro","8482");
        Auto auto3 = new Auto("Tom","1424");
        Auto auto4 = new Auto("Jorge","1234");
        
        estacionamiento.estacionarAuto(auto1, 1, 2);
        estacionamiento.estacionarAuto(auto2, 2, 2);
        estacionamiento.estacionarAuto(auto3, 4, 2);
        estacionamiento.estacionarAuto(auto4, 5, 2);
        
        System.out.println(estacionamiento.retornarPatente("LOL666"));
        
        System.out.println(estacionamiento.retornarPatente("XYDSH1"));
        
        System.out.println(estacionamiento.toString());
        
        System.out.println("La cantida de autos en la plaza 2 es: "+ estacionamiento.cantPlaza(2));
    }
    
}
