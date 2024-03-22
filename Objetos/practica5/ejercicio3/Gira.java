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
public class Gira extends Recital{
    private String nombreGira;
    private Fecha []fechas;
    private int fechaActual;
    private int dimFechas;
    private int dlFechas = 0;

    public Gira(String nombreGira, int dimFechas, String nombreBanda, int dimTemas) {
        super(nombreBanda, dimTemas);
        this.setNombreGira(nombreGira);
        this.setDimFechas(dimFechas); 
        fechas = new Fecha[this.getDimFechas()];
        fechaActual = 0;
    }
    
    public void agregarFecha(Fecha f){
        if(this.getDlFechas() < this.getDimFechas()){
            fechas[this.getDlFechas()] = f;
            this.incFechas();
        }
    }
    
    public void actuar(){
        if(this.getFechaActual() < this.getDlFechas()){
            System.out.println("Buenas noches.. "+ this.getNombreFecha(this.getFechaActual()));
            super.actuar();
            this.actualizarFechaActual();
        } else {
            System.out.println("Esa fue la ultima fecha");
        }
        
    }
    
    private int getFechaActual(){
        return this.fechaActual;
    }
    
    private void actualizarFechaActual(){
        this.fechaActual++;
    }
    
    private String getNombreFecha(int pos){
        return this.fechas[pos].getCiudad();
    }
    
    private void incFechas(){
        this.dlFechas++;
    }
    
    public int getDlFechas(){
        return this.dlFechas;
    }
    
    public int getDimFechas() {
        return dimFechas;
    }

    public void setDimFechas(int dimFechas) {
        this.dimFechas = dimFechas;
    }
    
    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    @Override
    public double calcularCosto() {
        return this.getDimFechas()*30000;
    }
    
    
    
}
