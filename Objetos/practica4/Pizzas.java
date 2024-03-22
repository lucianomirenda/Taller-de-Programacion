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
public abstract class Pizzas {
    private double tamaño;
    private String nombre;

    public Pizzas(double tamaño, String nombre) {
        this.setTamaño(tamaño);
        this.setNombre(nombre);
    }

    public double getTamaño() {
        return tamaño;
    }

    public void setTamaño(double tamaño) {
        if (tamaño > 0)
            this.tamaño = tamaño;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public abstract void cocinarPizza();
    
}
