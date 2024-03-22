
package practica5.ejercicio4;

public class Director extends Persona{
    private int antiguedad;

    public Director(int antiguedad, String unNombre, int unDNI, int unaEdad) {
        super(unNombre, unDNI, unaEdad);
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return super.toString() + ", Antiguedad: " + antiguedad + "\n";
    }
    
    
    
}
