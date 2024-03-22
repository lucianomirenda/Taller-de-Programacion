
package practica5;

public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio []subsidios;
    private int df = 5;
    private int dl = 0;

    public Investigador(String nombre, int categoria, String especialidad) {
        this.nombre = nombre;
        this.categoria = categoria;
        this.especialidad = especialidad;
        
        this.subsidios = new Subsidio[df];
    }
    
    public void agregarSubsidio(Subsidio s){
        if(dl < df){
            this.subsidios[dl] = s;
            dl++;
        }
    }
    
    public double getTotalSubsidios(){
        double suma = 0;
        for (int i = 0; i < dl; i++) {
            if(this.subsidios[i].isEntregado()){
                suma = suma + subsidios[i].getMontoPedido();
            }
        }
        return suma;
    }
    
    public void otorgarSubsidio(int i){
        i=i-1;
        if((i >= 0)&(i < dl)){
        subsidios[i].setEntregado(true);
        }
    }
    
    public void otorgarTodos(){
        for (int i = 0; i < dl; i++) {
            this.subsidios[i].setEntregado(true);
        }
    }

    @Override
    public String toString() {
        return "Nombre: " + this.nombre + 
               "\nCategoria: " + this.categoria + 
               "\nEspecialidad: " + this.especialidad + 
               "\nSubsidios(monto total): "+this.getTotalSubsidios();
    }
    
    
    
}
