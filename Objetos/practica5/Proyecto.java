
package practica5;

public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private Investigador []investigadores;
    private int df = 50;
    private int dl = 0;

    public Proyecto(String nombre, int codigo, String nombreDirector) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nombreDirector = nombreDirector;
        
        this.investigadores = new Investigador[df];
    }
    
    public void agregarInvestigador(Investigador i){
        if(dl < df){
            this.investigadores[dl] = i;
            dl++;
        }
    }
    
    public double dineroTotalOtorgado(){
        double suma = 0;
        for (int i = 0; i < dl; i++) {
            suma = suma + investigadores[i].getTotalSubsidios();
        }
        return suma;
    }

    @Override
    public String toString() {
        
        String auxInvestigadores = "";
        
        for (int i = 0; i < dl; i++) {
            auxInvestigadores = auxInvestigadores + 
                                investigadores[i].toString()+"\n\n";
        }
        
        return "Nombre del proyecto: " + this.nombre + 
                "\nCodigo:" + this.codigo + 
                "\nNombre del Director:" + this.nombreDirector +
                "\nTotal de dinero otorgado: "+this.dineroTotalOtorgado() +
                "\nInvestigadores: \n"+auxInvestigadores;
    }
    
    
}
