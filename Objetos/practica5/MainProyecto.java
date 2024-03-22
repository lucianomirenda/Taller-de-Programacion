
package practica5;

public class MainProyecto {

    public static void main(String[] args) {
        Investigador juan = new Investigador("Juan",3,"Energia Nuclear");
        Investigador pepe = new Investigador("Pepe",5,"IA");
        Investigador cuqui = new Investigador("Cuqui",2,"Hacer Café");
        
        Subsidio sub1 = new Subsidio(10000,"Ser pobre");
        Subsidio sub2 = new Subsidio(20000,"Sin transporte");
        Subsidio sub3 = new Subsidio(5000,"Sin casa");
        Subsidio sub4 = new Subsidio(70000,"Perdida de un dedo");
        
        juan.agregarSubsidio(sub4);
        juan.agregarSubsidio(sub3);
        
        pepe.agregarSubsidio(sub1);
        pepe.agregarSubsidio(sub2);
        
        cuqui.agregarSubsidio(sub1);
        cuqui.agregarSubsidio(sub4);
        
        juan.otorgarSubsidio(2);
        pepe.otorgarTodos();
        cuqui.otorgarSubsidio(1);
        
        Proyecto proyecto = new Proyecto("Cura del Cancer",666,"Jorge Sanchez");
        proyecto.agregarInvestigador(cuqui);
        proyecto.agregarInvestigador(juan);
        proyecto.agregarInvestigador(pepe);
        
        System.out.println(proyecto.toString());
    }
    
}
