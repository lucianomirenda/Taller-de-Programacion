/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5.ejercicio2;

/**
 *
 * @author lucianomirenda
 */
public class Auto {
    private String dueño;
    private String patente;

    public Auto(String dueño, String patente) {
        this.setDueño(dueño);
        this.setPatente(patente);
    }

    public boolean isPatente(String p){
        return p == this.getPatente();
    }
        
    public String getDueño() {
        return dueño;
    }

    public void setDueño(String dueño) {
        this.dueño = dueño;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    @Override
    public String toString() {
        return "- Due\u00f1o: " + dueño + "\n- Patente: " + patente + "\n";
    }
    
    
}
