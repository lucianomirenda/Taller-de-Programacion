/*
Demo que crea objetos Libro invocando a los constructores definidos. 
 */
package tema3;

/**
 *
 * @author vsanz
 */
public class Demo01ConstructoresLibro {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Autor pAutor = new Autor("Pepe","Murio joven","Tailandia");
        Autor luisito = new Autor("Jose ","Murio de cancer","Bolivia");
        Autor jorge = new Autor("JorgeTron","Sigue vivo..por ahora","Tierra del Fuego");
        
        Estante estante = new Estante(5);
        
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 pAutor, "978-0071809252", 21.72);
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               luisito, "978-1512108347");

        Libro libro3 = new Libro("coca","Pepe publishing",luisito,"666");
        
        Libro libro4 = new Libro("Mujercitas","Tu mami enterprises",jorge,"1234");
        
        estante.setLibro(libro3);
        
        System.out.println(estante.getAlmacenados());
        
        System.out.println(estante.getLleno());
        
        estante.setLibro(libro2);
        estante.setLibro(libro1);
        estante.setLibro(libro4);
        
        System.out.println(estante.getAlmacenados());
        
        System.out.println(estante.getLibro("coca").getISBN());
        
        System.out.println(estante.getLibro("Mujercitas").getPrimerAutor());
        
        System.out.println(estante.getLleno());
    }
    
}
