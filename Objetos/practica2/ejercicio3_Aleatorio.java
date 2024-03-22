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
public class ejercicio3_Aleatorio {
    public static void main(String[] args){
    
        Persona [][]casting = new Persona[5][8];
        GeneradorAleatorio.iniciar();
        int dl = -1;
        
        String nombre = GeneradorAleatorio.generarString(3);
        
        while((dl<39)&&(!nombre.equals("ZZZ"))){
            dl++;
            int dia = dl / 8, turno = dl % 8;

            casting[dia][turno] = new Persona(nombre,GeneradorAleatorio.generarInt(100),GeneradorAleatorio.generarInt(1000));
   
            nombre = GeneradorAleatorio.generarString(3);
        }
        
        for (int i = 0; i <= dl; i++) {
            int dia = i / 8, turno = i % 8;
            
            System.out.println("DIA: "+ dia);
            System.out.println("TURNO: "+turno);
            System.out.println(casting[dia][turno].toString());
        }
    }
}
