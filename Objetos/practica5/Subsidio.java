package practica5;

public class Subsidio {

    private double montoPedido;
    private String motivo;
    private boolean entregado;

    public Subsidio(double montoPedido, String motivo) {
        this.montoPedido = montoPedido;
        this.motivo = motivo;
        this.entregado = false  ;
    }

    public double getMontoPedido() {
        return montoPedido;
    }

    public boolean isEntregado() {
        return entregado;
    }

    public void setEntregado(boolean entregado) {
        this.entregado = entregado;
    }
    
    
    
}
