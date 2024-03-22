
package practica5.ejercicio4;

public class MainCoro {


    public static void main(String[] args) {
        
        Director director = new Director(14,"Pepe",339301,39);
        Director director2 = new Director(8,"Jose",73821,74);
        
        Corista corista1 = new Corista(2,"Juan",41824,24);
        Corista corista2 = new Corista(2,"Rodo",45321,24);
        Corista corista3 = new Corista(1,"Milo",41537,24);
        Corista corista4 = new Corista(1,"Papaleta",48274,24);
        
        CoroHileras corohileras = new CoroHileras(2,2,"The Pepe's",director);
        
        CoroSemicircular coroSemi = new CoroSemicircular(4,"The Jose's",director2);
        
        coroSemi.agregarCorista(corista1);
        coroSemi.agregarCorista(corista2);
        coroSemi.agregarCorista(corista3);
        coroSemi.agregarCorista(corista4);
        
        corohileras.agregarCorista(corista1);
        corohileras.agregarCorista(corista2);
        corohileras.agregarCorista(corista3);
        corohileras.agregarCorista(corista4);
        
        System.out.println("El coro por hileras esta: "+corohileras.coroLleno());
        System.out.println("El coro por semicircular esta: "+coroSemi.coroLleno());
        System.out.println("--------");
        System.out.println("El orden de semiCircular es "+coroSemi.bienFormado());
        System.out.println("El orden del coro de The Joeses es "+corohileras.bienFormado());
        System.out.println("--------");
        System.out.println(coroSemi.toString());
        System.out.println("--------");
        System.out.println(corohileras.toString());
        
        
    }
    
}
