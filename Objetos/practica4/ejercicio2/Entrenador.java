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
public class Entrenador extends Empleado{
    private int cantCampeonatos;

    public Entrenador(int cantCampeonatos, String nombre, double sueldo, int antiguedad) {
        super(nombre, sueldo, antiguedad);
        this.cantCampeonatos = cantCampeonatos;
    }
    
    
    public int getCantCampeonatos() {
        return cantCampeonatos;
    }

    public void setCantCampeonatos(int cantCampeonatos) {
        this.cantCampeonatos = cantCampeonatos;
    }
    
    @Override
    public double calcularEfectividad(){
        return this.getCantCampeonatos() / this.getAntiguedad();
    }
    
    
    @Override
    public double calcularSueldoACobrar(){
        
        if(this.getCantCampeonatos() > 0){
            
            if(this.getCantCampeonatos() > 4){
                
                if(this.getCantCampeonatos() > 10){
                    
                    return super.calcularSueldoACobrar() + 50000;
                    
                } else {
                    
                    return super.calcularSueldoACobrar() + 30000;
                }
            } else {
                
                return super.calcularSueldoACobrar() + 5000;
            }
        } else {
            
            return super.calcularSueldoACobrar();
        }
        
    }
}
