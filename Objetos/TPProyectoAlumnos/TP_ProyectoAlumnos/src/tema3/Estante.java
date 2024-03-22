 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author sappydumb
 */
public class Estante {
    
    private int df;
    private Libro []vLibros;
    private int dl = -1;

    public Estante(int df) {
        this.df = df;
        vLibros = new Libro[df];
    }
    
    
    
    public int getAlmacenados(){
        return (this.dl+1);
    }
    
    public boolean getLleno(){
        return (this.dl == df-1);
    }
    
    public void setLibro(Libro l){
        if(dl < (df-1)){
            this.dl++;
            vLibros[this.dl] = l;
        }
    }
    
    public Libro getLibro(String titulo){
        int i = 0;
        while(i <= dl){
            if(titulo.equals(vLibros[i].getTitulo())){
                return vLibros[i];
            } else {
                i++;
            }
        }
            return null;
    }
    
}
