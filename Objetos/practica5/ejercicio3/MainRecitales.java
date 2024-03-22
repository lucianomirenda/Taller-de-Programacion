package practica5.ejercicio3;

public class MainRecitales {

    public static void main(String[] args) {
        
        Gira gira = new Gira("CipoPaluza",9,"Vrule",7);
        
        Fecha fecha = new Fecha(13,"Cipolletti");
        
        Evento evento = new Evento(3,"Pepe",13,"Linkin Park",8);
        
        
        gira.agregarTema("Locos");
        gira.agregarTema("Rock por siempre");
        gira.agregarTema("Angeles en la lluvia");
        gira.agregarTema("Cafe con leche");
        
        evento.agregarTema("In the end");
        evento.agregarTema("Numb");
        evento.agregarTema("faint");
        
        gira.agregarFecha(fecha);
        
        gira.actuar();
        gira.actuar();
        evento.actuar();
    
        System.out.println("El costo de la gira "+gira.getNombreGira()+" es: "+gira.calcularCosto()+"$");
        System.out.println("El costo del evento de "+evento.getNombreContratante()+" es: "+evento.calcularCosto()+"$");
    }
    
    
    /*
        ¿Esta bien que acceda a todas las variables y valores a través de métodos?
        ¿Esta bien que haga métodos tan especificos como actualizarFecha, incTemas, getTemas
        y acceda a la dimension fisica y lógica a través de geters?
        Yo en la clase gira, si bien se cuanta fechas son, no tengo las fechas almacenadas, 
        de hecho tengo que crear un método agregar fecha, esta bien que tenga una dimension lógica?
        ¿Esta bien como resolvi el actualizar fecha y la fecha actual?
    */
}
