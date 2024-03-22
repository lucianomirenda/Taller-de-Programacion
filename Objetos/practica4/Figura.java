
package practica4;

public abstract class Figura {
    private String colorRelleno;
    private String colorLinea;
    
    public Figura(String colorRelleno,String colorLinea){
        this.setColorRelleno(colorRelleno);
        this.setColorLinea(colorLinea); 
    }
    
    public void setColorRelleno(String colorRelleno){
        this.colorRelleno = colorRelleno;
    }
    
    public String getColorRelleno(){
        return this.colorRelleno;
    }
    
    public void setColorLinea(String colorLinea){
        this.colorLinea = colorLinea;
    }
    
    public String getColorLinea(){
        return this.colorLinea;
    }
    
    public abstract double calcularPerimetro();
    
    public abstract double calcularArea();

    @Override
    public String toString() {
        return "Area: "+ this.calcularArea() + " CR: " + colorRelleno + " CL: "+ colorLinea + ' ';
    }
    
    public int tuVieja(){
        return 2;
    }
    
}
