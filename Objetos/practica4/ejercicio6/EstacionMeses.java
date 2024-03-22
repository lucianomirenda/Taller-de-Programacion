/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4.ejercicio6;

public class EstacionMeses extends Estacion{

    public EstacionMeses(int añoI, int cantAños) {
        super(añoI, cantAños);
    }

    
    public double promedioAño(int año){
        double suma = 0;
        for (int i = 0; i < 12; i++) {
            suma = suma + this.obtenerTemperatura(año, i+1);
        }
        return suma / 12;
    }
    
    @Override
    public String toString() {
        String aux = super.toString();
        int año = this.getAñoInicial();
        
        for (int i = 0; i < this.getAños(); i++) {
            aux+= "\n- Año "+(año+i)+": "+this.promedioAño(año+i)+"ºC;";
        }   
        
        return aux;
    }
   
 
}
