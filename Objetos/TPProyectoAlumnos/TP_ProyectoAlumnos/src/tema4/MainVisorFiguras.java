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
public class MainVisorFiguras {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        VisorFiguras visor = new VisorFiguras();
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
        Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");
        
        System.out.println(visor.quedaEspacio());
        
        visor.guardar(r);
        visor.guardar(c1);
        visor.guardar(c2);
        visor.guardar(c2);
        visor.guardar(c2);
        visor.guardar(r);
        
        System.out.println(visor.quedaEspacio());
        
        
        
    }
    
}
