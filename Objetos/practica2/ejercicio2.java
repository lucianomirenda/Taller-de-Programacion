/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica2;

import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author lucianomirenda
 */


public class ejercicio2 {
    public static void main(String[] args){
        
        GeneradorAleatorio.iniciar();
        
        Persona []vecPersonas = new Persona[15];
        
        int df = 15, edad;
        
        for (int i = 0; i < df; i++) {
            vecPersonas[i] = new Persona();
        }
        
        
        edad = GeneradorAleatorio.generarInt(100);
        
        for (int i = 0; (i < df)&&(edad != 0); i++) {
            vecPersonas[i].setEdad(edad);
            vecPersonas[i].setNombre(GeneradorAleatorio.generarString(13));
            vecPersonas[i].setDNI(GeneradorAleatorio.generarInt(1000));
            edad = GeneradorAleatorio.generarInt(100);
        }
       
        for (int i = 0; i < vecPersonas.length; i++) {
            System.out.println(vecPersonas[i].toString());
        }
        
        int cant = 0,min = 1000,minPersona = -1;
        
        for (int i = 0; i < vecPersonas.length; i++) {
            if(vecPersonas[i].getEdad() > 65)
                cant = cant + 1;
            if(vecPersonas[i].getDNI() < min){
                minPersona = i;
                min = vecPersonas[i].getDNI();
            }
        }
        
        System.out.println("La cantidad de personas con mayor edad a 65 años es: "+ cant);
            
        if(minPersona != -1){
            System.out.println("Persona con menor DNI: ");
            System.out.println(vecPersonas[minPersona].toString());
        } else {
            System.out.println("No hay personas cargadas.");
        }
        
    }
}
