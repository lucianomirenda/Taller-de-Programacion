/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4.ejercicio6;

/**
 *
 * @author lucianomirenda
 */
public class Meses {
    private String []meses = new String[12];

    public Meses() {
        for (int i = 0; i < 12; i++) {
            this.meses[i] = new String();
        }
        this.meses[0] = "Enero";
        this.meses[1] = "Febrero";
        this.meses[2] = "Marzo";
        this.meses[3] = "Abril";
        this.meses[4] = "Mayo";
        this.meses[5] = "Junio";
        this.meses[6] = "Julio";
        this.meses[7] = "Agosto";
        this.meses[8] = "Septiembre";
        this.meses[9] = "Octubre";
        this.meses[10] = "Noviembre";
        this.meses[11] = "Diciembre";
    }

    public String getMeses(int mes) {
        if((mes >= 0)&(mes < 12)){
            return meses[mes];
        } else {
            return "Error";
        }
            
    }
    
    
    
    
    
}
