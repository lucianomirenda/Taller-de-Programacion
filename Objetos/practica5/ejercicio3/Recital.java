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
public abstract class Recital {
    private String nombreBanda;
    private String []listaTemas;
    private int dimTemas;
    private int dl = 0;

    public Recital(String nombreBanda, int dimTemas) {
        this.setNombreBanda(nombreBanda);
        this.setDimTemas(dimTemas);
        listaTemas = new String[this.getDimTemas()];
    
    }
    
    public void agregarTema(String tema){
        if(this.getDl() < this.getDimTemas()){
            this.listaTemas[this.getDl()] = tema;
            this.incTemas();
        }
    }
    
    public void actuar(){
        for (int i = 0; i < this.getDl(); i++) {
            System.out.println("y ahora tocaremos.."+ this.getTema(i));
        }
    }
    
    private String getTema(int pos){
        return this.listaTemas[pos];
    }
    
    private int getDl(){
        return this.dl;
    }
    
    private void incTemas(){
        this.dl++;
    }
    
    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public String[] getListaTemas() {
        return listaTemas;
    }

    public void setListaTemas(String[] listaTemas) {
        this.listaTemas = listaTemas;
    }

    public int getDimTemas() {
        return dimTemas;
    }

    public void setDimTemas(int dimTemas) {
        this.dimTemas = dimTemas;
    }
    
    public abstract double calcularCosto();
    
    
}
