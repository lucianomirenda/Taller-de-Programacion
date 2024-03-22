/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pruebas;

/**
 *
 * @author sappydumb
 */
public class VectorPersonas {
    
    private int dl;
    private int df;
    private Persona []vector;

    public VectorPersonas(int dimensionFisica) {
        df = dimensionFisica;
        dl = 0;
        vector = new Persona[df];
    }
    
    public void agregarPersona(String nombre,int DNI){
        if(dl < df){
            vector[dl] = new Persona(nombre,DNI);
            dl++;
        }
    }
    
}
