
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double []vectorAlturas = new double[15];
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i,cantSuperaPromedio = 0;
        double suma = 0,promedio;
        
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for(i=0;i<15;i++){
            System.out.println("Ingrese la altura del jugador "+i+" :");
            vectorAlturas[i] = Lector.leerDouble();
            suma = suma + vectorAlturas[i];
        }
        
        //Paso 7: Calcular el promedio de alturas, informarlo
        promedio = suma / 15;
        System.out.println("El promedio de todas las alturas es: "+promedio);
        
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        for(i=0;i<15;i++){
            if(vectorAlturas[i] > promedio)
                cantSuperaPromedio++;
        }
        
        //Paso 9: Informar la cantidad.
        
        System.out.println("La cantidad de altura que superan el promedio es: "+cantSuperaPromedio);
        
    }
    
}
