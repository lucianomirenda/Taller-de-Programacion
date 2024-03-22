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
public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;

    public Empleado(String nombre, double sueldo, int antiguedad) {
        this.setNombre(nombre);
        this.setSueldo(sueldo);
        this.setAntiguedad(antiguedad);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public abstract double calcularEfectividad();
    
    public double calcularSueldoACobrar(){
        return this.getSueldo()+ ((this.getSueldo()*0.1)*this.getAntiguedad());
    }
    
    public String toString(){
        return "Nombre: "+ this.getNombre() + 
               "\nEfectividad: "+ this.calcularEfectividad() +
               "\nSueldo: "+ this.calcularSueldoACobrar();
    }
    
}
