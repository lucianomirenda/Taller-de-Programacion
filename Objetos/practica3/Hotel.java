/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;
import PaqueteLectura.GeneradorAleatorio;
/**
 *
 * @author sappydumb
 */
public class Hotel {
    private int df;
    private Habitacion []vHabitaciones;

    public Hotel(int df) {
        GeneradorAleatorio.iniciar();
        this.df = df;
        vHabitaciones = new Habitacion[df];
        
        for (int i = 0; i < df; i++) {
            vHabitaciones[i] = new Habitacion();
            vHabitaciones[i].setPrecio(GeneradorAleatorio.generarDouble(6000)+2000);
        }
        
    }
    
    public void ingresarCliente(Persona c, int n){
        vHabitaciones[n-1].setCliente(c);
        vHabitaciones[n-1].setDisponible(true);
    }
    
    public void aumentarPrecio(double x){
        for (int i = 0; i < df; i++) {
            vHabitaciones[i].setPrecio(vHabitaciones[i].getPrecio()+ x);
        }
    }

    @Override
    public String toString() {
        
        String aux,linea,disponible;
        aux = "";
        
       
        for (int i = 0; i < df; i++) {
            aux = aux + vHabitaciones[i].toString()+"\n";
        }

        return aux;
    }
    
    
}
