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
public class Circulo extends Figura{
    
    private double radio;
    
    public Circulo(double radio,String colorRelleno,String colorLinea){
        super(colorRelleno,colorLinea);
        this.setRadio(radio);
    
    }
    
    public double getRadio(){
        return this.radio;
    }
    
    public void setRadio(double radio){
        this.radio = radio;
    }
    
    @Override
    public double calcularArea(){
        return Math.PI * (getRadio() * getRadio());
    }
    
    @Override
    public double calcularPerimetro(){
        return Math.PI * getRadio() * 2;
    }

    @Override
    public String toString() {
        return super.toString() +" Radio: "+ this.getRadio();
    }

    
}
