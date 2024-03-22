/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4;

/**
 *
 * @author sappydumb
 */
public class PizzaItaliana extends Pizzas{
    private int cantPeproni;

    public PizzaItaliana(int cantPeproni, double tamaño, String nombre) {
        super(tamaño, nombre);
        this.cantPeproni = cantPeproni;
    }

    public int getCantPeproni() {
        return cantPeproni;
    }

    public void setCantPeproni(int cantPeproni) {
        this.cantPeproni = cantPeproni;
    }

    @Override
    public String toString() {
        return "PizzaItaliana{" + "cantPeproni=" + cantPeproni + '}'+ this.getTamaño();
    }

    
    public void cocinarPizza() {
        System.out.println("Cocinada");
    }
    
    
    
}
