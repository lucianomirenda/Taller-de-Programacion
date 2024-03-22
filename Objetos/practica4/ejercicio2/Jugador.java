/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4.ejercicio2;

/**
 *
 * @author sappydumb
 */
public class Jugador extends Empleado{
    private int cantPartidos;
    private int cantGoles;

    public Jugador(int cantPartidos, int cantGoles, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.setCantPartidos(cantPartidos);
        this.setCantGoles(cantGoles);
    }

    
    
    public int getCantPartidos() {
        return cantPartidos;
    }

    public void setCantPartidos(int cantPartidos) {
        this.cantPartidos = cantPartidos;
    }

    public int getCantGoles() {
        return cantGoles;
    }

    public void setCantGoles(int cantGoles) {
        this.cantGoles = cantGoles;
    }
    
    @Override
    
    public double calcularEfectividad(){
        return this.getCantGoles() / this.getCantPartidos();
    }
    
    @Override
    public double calcularSueldoACobrar(){
        if(this.calcularEfectividad() > 0.5){
            return super.calcularSueldoACobrar() + this.getSueldo();
        } else {
            return super.calcularSueldoACobrar();
        }
    }
    
}
