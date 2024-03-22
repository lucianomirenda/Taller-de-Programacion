
package practica5.ejercicio4;

public class CoroHileras extends Coro{
    private Corista [][]coristas;
    private int filas;
    private int columnas;
    
    public CoroHileras(int filas, int columnas, String nombre, Director director) {
        super(nombre, director,filas*columnas);
        this.setFilas(filas);
        this.setColumnas(columnas);
        this.coristas = new Corista[this.getFilas()][this.getColumnas()];
    }

    public int getFilas() {
        return filas;
    }

    public void setFilas(int filas) {
        this.filas = filas;
    }

    public int getColumnas() {
        return columnas;
    }

    public void setColumnas(int columnas) {
        this.columnas = columnas;
    }

    @Override
    public void agregarCorista(Corista c) {
        if(this.getDl() < this.getDf()){
            this.coristas[this.getDl() / this.getColumnas()][this.getDl() % this.getColumnas()] = c;
            this.incDl();
        }
    }

    @Override
    public boolean coroLleno() {
        return this.getDl() == this.getDf();
    }
    

    @Override
    public boolean bienFormado() {
        
        int i = 1,ant = this.coristas[0][0].getTono(),tono;
        
        while(i < (this.getDl())){
            
            tono = this.coristas[i / this.getColumnas()][i % this.getColumnas()].getTono();
            
            if(i % this.getColumnas() == 0){
                if(ant < tono){
                    return false;
                } else {
                    ant = tono;
                }
            } else {
                if(ant != tono){
                    return false;
                } else {
                    ant = tono;
                }
            
            }
            i++;
        }
        
        return true;
    }

    @Override
    public String toString() {
        int i = 0;
        String aux = "";
        while(i < this.getDl()){
            aux = aux + this.coristas[i / this.getColumnas()][i % this.getColumnas()].toString();
            i++;
        }
        return super.toString() + aux;
    }
    
    
    
}
