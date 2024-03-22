/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4;

/**
 *
 * @author lucianomirenda
 */
public class Trabajadores extends Persona{
    private String trabajo;

    public Trabajadores(String trabajo, String nombre, int DNI, int Edad) {
        super(nombre, DNI, Edad);
        this.setTrabajo(trabajo);
    }

   

    
    public String getTrabajo() {
        return trabajo;
    }

    public void setTrabajo(String trabajo) {
        this.trabajo = trabajo;
    }
    
    public String toString(){
        return super.toString() + "Soy "+ this.getTrabajo();
    }
}
