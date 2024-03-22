/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;


public class DemoFiguras {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Cuadrado cuad = new Cuadrado(10,"Rojo", "Negro");
        
        System.out.println("Representacion del cuadrado: \n" + cuad.toString()); 
       
        Triangulo tri = new Triangulo(10,10,10,"Amarillo","Negro");
        
        System.out.println(tri.toString());
        
        Circulo redondo = new Circulo(13,"Verde","Azul");
        
        System.out.println(redondo.getColorLinea()+" "+ redondo.getColorRelleno());
        
        redondo.despintar();
        
        System.out.println(redondo.getColorLinea()+" "+ redondo.getColorRelleno());

    }
    
    
    
}
