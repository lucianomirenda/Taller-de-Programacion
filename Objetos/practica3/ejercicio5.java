package practica3;
import PaqueteLectura.Lector;


public class ejercicio5 {
    
    public static void main(String[] args){
        
        System.out.println("Ingrese en orden la información del circulo. \n 1. RADIO \n 2. Color Relleno \n 3. Color Linea");
        Circulo circuloUno = new Circulo(Lector.leerDouble(),Lector.leerString(),Lector.leerString());
        
        System.out.println("Perimetro: "+ circuloUno.calcularPerimetro());
        System.out.println("Area: "+ circuloUno.calcularArea());
        
        
    }
}
