package practica5.ejercicio4;

public class Corista extends Persona{
    private int tono;

    public Corista(int tono, String unNombre, int unDNI, int unaEdad) {
        super(unNombre, unDNI, unaEdad);
        this.tono = tono;
    }

    public int getTono() {
        return tono;
    }

    @Override
    public String toString() {
        return super.toString() + ", Tono: " + tono + "\n";
    }
    
    
    
}
