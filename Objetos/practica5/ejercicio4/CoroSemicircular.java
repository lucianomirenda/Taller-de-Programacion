package practica5.ejercicio4;

public class CoroSemicircular extends Coro{
    private Corista []corista;


    public CoroSemicircular(int df, String nombre, Director director) {
        super(nombre, director,df);
        this.setDf(df);
        this.setDl(0);
        this.corista = new Corista[this.getDf()];
    }

    
    public void agregarCorista(Corista c) {
        if(this.getDl() < this.getDf()){
            this.corista[this.getDl()] = c;
            this.incDl();
        }
    }

    @Override
    public boolean coroLleno() {
        return this.getDf() == this.getDl();
    }

    @Override
    public boolean bienFormado() {
        int i = 1,ant = this.corista[0].getTono();
        while(i < this.getDf()){
            if(ant < this.corista[i].getTono()){
                return false;
            } else {
               ant = this.corista[i].getTono();
            }
            i++;
        }
        return true;
    }

    @Override
    public String toString() {
        String aux = "";
        int i = 0;
        while(i < this.getDl()){
            aux = aux + this.corista[i].toString();
            i++;
        }
        return super.toString() + aux;
    }
    
    
    
        
}
