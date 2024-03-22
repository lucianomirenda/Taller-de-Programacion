package project2;


import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Project2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        //variables
        int i,j,max;
        int df = 10;
        
        //inicialización
        GeneradorAleatorio.iniciar();
        max = -1;
        
        //código
        
        int matriz[][] = new int[5][5];
        
        for(i = 0;i < 5;i++){
            System.out.println("------------------------------------------------------------------------------------------------");
            for(j = 0; j < 5; j++){
                matriz[i][j] = GeneradorAleatorio.generarInt(500);
                System.out.print("Pos("+i+","+j+"): "+matriz[i][j] + " | ");
            }
            System.out.println("");
        }
        
        
  
    }
    
}