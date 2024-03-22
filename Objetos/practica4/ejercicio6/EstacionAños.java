/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4.ejercicio6;

public class EstacionAños extends Estacion{
    
    private Meses meses;

    public EstacionAños(int añoI, int cantAños) {
        super(añoI, cantAños);
        this.meses = new Meses();
    }

    
    
    public double promedioMes(int mes){
        double suma = 0;
        int años = this.getAños();
        int añoI = this.getAñoInicial();
        for (int i = 0; i < años; i++) {
            suma = suma + this.obtenerTemperatura(i+añoI, mes+1);
        }
        return suma / años;
    
    }

    @Override
    public String toString() {
        String aux = super.toString();
        
        for (int i = 0; i < 12; i++) {
            aux = aux+ "\n" + "- " + this.meses.getMeses(i)+":"+this.promedioMes(i)+"ºC";
        }
        
        return aux;
    }
    
    
}
