/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4.ejercicio6;

/**
 *
 * @author lucianomirenda
 */
public class MeteorologicoMain {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EstacionMeses esta = new EstacionMeses(2015,6);
        EstacionAños estaAños = new EstacionAños(2017,4);
        
        esta.registrarTemperatura(2020, 8, 100);
        
        System.out.println(esta.obtenerTemperatura(2015, 1));
        
        System.out.println(esta.getMaximoString());
        
        System.out.println(esta.toString());
        
        System.out.println("------------");
        System.out.println(estaAños.toString());
    }
}
