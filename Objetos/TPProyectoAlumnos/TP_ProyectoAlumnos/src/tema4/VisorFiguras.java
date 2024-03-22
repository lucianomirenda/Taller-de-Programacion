/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author sappydumb
 */
public class VisorFiguras {
    private int guardadas;    
    private int capacidadMaxima=5;     
    private Figura [] vector;      
    
  
    public VisorFiguras(){
        vector = new Figura[5];
        guardadas = 0; 
    } 

    public void mostrar(Figura f){     
        System.out.println(f.toString());      

    }    

    public void guardar(Figura f){         
        if(guardadas < capacidadMaxima){
            vector[guardadas] = f;
            guardadas++;
        } else {
            System.out.println("Esta lleno");
        }
    } 
    
    public boolean quedaEspacio(){
        return (guardadas < capacidadMaxima);
    }              
    public void mostrar(){
        int i = 0;
        while(i < guardadas){
            System.out.println(vector[i].toString());
            i++;
        }
    }      
    public int getGuardadas() {
        return guardadas;     
    }
}
