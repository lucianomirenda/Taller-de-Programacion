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
public class Persona {
    private String nombre;
    private int DNI;
    private int Edad;

    public Persona(String nombre, int DNI, int Edad) {
        this.setNombre(nombre);
        this.setDNI(DNI);
        this.setEdad(Edad);
    }

    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return Edad;
    }

    public void setEdad(int Edad) {
        this.Edad = Edad;
    }

    @Override
    public String toString() {
        return "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + Edad + " años.";
    }
    
    
    
}
