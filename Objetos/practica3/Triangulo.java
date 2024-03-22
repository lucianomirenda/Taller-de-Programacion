/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author lucianomirenda
 */
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorLinea;
    private String colorRelleno;

    public Triangulo(double lado1, double lado2, double lado3, String colorLinea, String colorRelleno) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorLinea = colorLinea;
        this.colorRelleno = colorRelleno;
    }
    

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }
    
    public double calcularPerimetro(){
        return this.getLado1() + this.getLado2() + this.getLado3();
    }
    
    public double calcularArea(){
        double  s = calcularPerimetro() / 2;
        
        return Math.sqrt(s * (s - this.getLado1()) * (s - this.getLado2()) *  (s - this.getLado3())); 
                
    }

    @Override
    public String toString() {
        return "Triangulo{" + "lado1=" + lado1 + ", lado2=" + lado2 + ", lado3=" + lado3 + ", colorLinea=" + colorLinea + ", colorRelleno=" + colorRelleno + '}';
    }

    
    
}
