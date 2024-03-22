/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author sappydumb
 */
public class Habitacion {
    private double precio = 0.0;
    private boolean disponible = false;
    private Persona cliente;
    
    public void setPrecio(double precio){
        this.precio = precio;
    }
    
    public void setCliente(Persona cliente){
        this.cliente = cliente;
    }
    
    public double getPrecio(){
        return this.precio;
    }
    
    public Persona getCliente(){
        return this.cliente;
    }
    
    public boolean getDisponible(){
        return this.disponible;
    }
    
    public void setDisponible(boolean disponible){
        this.disponible = disponible;
    }

    @Override
    public String toString() {
        String linea;
        if(this.getDisponible()){
                linea = ""+ this.getPrecio()+", Ocupada. "+ this.getCliente();
            } else {
                linea = ""+ this.getPrecio()+", Libre. ";
            }
        
        return linea;
    }
    
    
    
}
