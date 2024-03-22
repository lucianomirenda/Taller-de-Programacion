/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5.ejercicio3;

/**
 *
 * @author sappydumb
 */
public class Evento extends Recital{
    private int motivo;
    private String nombreContratante;
    private int dia;

    public Evento(int motivo, String nombreContratante, int dia, String nombreBanda, int dimTemas) {
        super(nombreBanda, dimTemas);
        this.setMotivo(motivo);
        this.setNombreContratante(nombreContratante);
        this.setDia(dia);
    }
    
    private String mensajeMotivo(){
        if(this.getMotivo() == 1){
            return "Recuerden colaborar con.. "+this.getNombreContratante();
        } else if(this.getMotivo() == 2){
            return "Un feliz cumpleaños para.. "+this.getNombreContratante();
        } else if(this.getMotivo() == 3){
            return "Saludos amigos televidentes";
        } else return "error"+"\n";
    }
    
    
    
    public void actuar(){
        System.out.println(this.mensajeMotivo());
        super.actuar();
    }
    
    public int getMotivo() {
        return motivo;
    }

    public void setMotivo(int motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    @Override
    public double calcularCosto() {
        if(this.getMotivo()== 1){
            return 0;
        } else if(this.getMotivo() == 2){
            return 50000;
        } else if(this.getMotivo() == 3){
            return 150000;
        } else return -1;
    }
    
    
    
}
