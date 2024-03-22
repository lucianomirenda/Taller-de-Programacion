
package practica5.ejercicio4;

public abstract class Coro {
    private String nombre;
    private Director director;
    private int dl;
    private int df;

    public Coro(String nombre, Director director,int df) {
        this.setNombre(nombre);
        this.setDirector(director);
        this.setDl(0);
        this.setDf(df);
    }
    
    public void incDl(){
        this.dl++;
    }
    
    public int getDl() {
        return dl;
    }
    
    public int getDf() {
        return df;
    }

    public void setDf(int df) {
        this.df = df;
    }

    
    public void setDl(int dl) {
        this.dl = dl;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }
    
    public abstract void agregarCorista(Corista c);
    
    public abstract boolean coroLleno();
    
    public abstract boolean bienFormado();
   

    @Override
    public String toString() {
        return "Nombre del coro:\n" + this.getNombre() + "\n" +
               "Director: \n" + this.director.toString() +
               "Coristas: \n";
    }
    

}
