/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4;

/**
 *
 * @author sappydumb
 */
public class Cuadrado extends Figura {
    
    private int lado;
    
    public Cuadrado(int lado,String colorRelleno,String colorLinea){
        super(colorRelleno,colorLinea);
        this.setLado(lado);
    }
    
    public void setLado(int l){
        this.lado = l;
    }
    
    public int getLado(){
        return this.lado;
    }
    
    @Override
    public double calcularPerimetro() {
        return lado*4;
    }

    @Override
    public double calcularArea() {
        return lado*lado;
    }

    @Override
    public String toString() {
        return super.toString() + " Lado: "+ this.getLado();
    }
    
    @Override
    public int tuVieja(){
        return super.tuVieja() + 8;
    }
    
    
}
