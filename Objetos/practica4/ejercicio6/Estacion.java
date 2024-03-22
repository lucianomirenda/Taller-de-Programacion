
package practica4.ejercicio6;
import PaqueteLectura.GeneradorAleatorio;


public class Estacion {
    private String nombre = "La Plata";
    private double latitud = 34.921;
    private double longitud = - 57.955;
    private int años;
    private int añoInicial;
    private int meses = 12;
    private double [][]mediciones;
    
    public Estacion(int añoI,int cantAños){
        GeneradorAleatorio.iniciar();
        this.añoInicial = añoI;
        this.años = cantAños;
        
        this.mediciones = new double[años][meses];
        
        for (int i = 0; i < this.años; i++) {
            for (int j = 0; j < this.meses; j++) {
                this.mediciones[i][j] = GeneradorAleatorio.generarDouble(10)+40;
            }
        }
    }
    
    public void registrarTemperatura(int año, int mes,double temperatura){
        año = año - this.añoInicial;
        this.mediciones[año][mes-1] = temperatura;
    }
    
    public double obtenerTemperatura(int año,int mes){
        año = año - this.añoInicial;
        return this.mediciones[año][mes-1];
    }
    
    public String getMaximoString(){
        double maxTemp = -1;
        int maxAño = -1,maxMes = -1;
        
        for (int i = 0; i < this.años; i++) {
            for (int j = 0; j < this.meses; j++) {
                if(this.mediciones[i][j] > maxTemp){
                    maxTemp = this.mediciones[i][j];
                    maxAño = i;
                    maxMes = j;
                }
            }
        }
        
        return "La mayor temperatura se tomo en: \nEl año: "+(maxAño+añoInicial)+"\nEl mes: "+(maxMes+1);
    }

    public int getAños() {
        return años;
    }

    public int getAñoInicial() {
        return añoInicial;
    }

    
    
    
    @Override
    public String toString() {
        return nombre + "(" + latitud + "S - " + longitud + " O):";
    }
    
    
}
