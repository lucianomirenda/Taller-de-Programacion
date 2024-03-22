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
public class Estacionamiento {
    private String nombre;
    private String dirección;
    private String horaAbre;
    private String horaCierre;
    private Auto [][]edificio;
    private int pisos;
    private int plazas;

    public Estacionamiento(String nombre, String dirección) {
        this.setNombre(nombre);
        this.setDirección(dirección);
        this.setHoraAbre("8:00");
        this.setHoraCierre("21:00");
        this.setPisos(5);
        this.setPlazas(10);
        edificio = new Auto[this.getPisos()][this.getPlazas()];
    }

    public Estacionamiento(String nombre, String dirección, String horaAbre, String horaCierre, int pisos, int plazas) {
        this.setNombre(nombre);
        this.setDirección(dirección);
        this.setHoraAbre(horaAbre);
        this.setHoraCierre(horaCierre);
        this.setPisos(pisos);
        this.setPlazas(plazas);
        edificio = new Auto[this.getPisos()][this.getPlazas()];
    }
    
    public void estacionarAuto(Auto auto,int piso, int plaza){
        this.edificio[piso-1][plaza-1] = auto;
    }
    
    private boolean edificioNull(int piso,int plaza){
        return edificio[piso][plaza] == null;
    }
    
    public String retornarPatente(String patente){
        int i = 0,j = 0;
        while(i < this.getPisos()){
            while(j < this.getPlazas()){
                if(!this.edificioNull(i, j)){
                    if(this.edificio[i][j].isPatente(patente)){
                        return "Piso: "+(i+1)+". Plaza: "+(j+1);
                    }
                } 
                j++;
            }
            j = 0;
            i++;
        }
        return "Auto Inexistente";
    }
    
    
    private int getPisos() {
        return pisos;
    }

    private void setPisos(int pisos) {
        this.pisos = pisos;
    }

    private int getPlazas() {
        return plazas;
    }

    private void setPlazas(int plazas) {
        this.plazas = plazas;
    }
    
    private String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    private String getDirección() {
        return dirección;
    }

    private void setDirección(String dirección) {
        this.dirección = dirección;
    }

    private String getHoraAbre() {
        return horaAbre;
    }

    private void setHoraAbre(String horaAbre) {
        this.horaAbre = horaAbre;
    }

    private String getHoraCierre() {
        return horaCierre;
    }

    private void setHoraCierre(String horaCierre) {
        this.horaCierre = horaCierre;
    }
    
    public int cantPlaza(int plaza){
        int cant = 0;
        for (int i = 0; i < this.getPisos(); i++) {
            if(!this.edificioNull(i, plaza-1))
                cant++;
        }
        return cant;
    }
    
    
    @Override
    public String toString() {
        String aux = "";
        for (int i = 0; i < this.getPisos(); i++) {
            for (int j = 0; j < this.getPlazas(); j++) {
                aux = aux + "Piso: "+(i+1)+". Plaza: "+(j+1)+"\n";
                if(!this.edificioNull(i, j)){
                    aux = aux + edificio[i][j].toString();
                } else {
                    aux = aux + "Libre\n";
                }
            }
        }
        
        return aux;
    }
    
    

    

}
