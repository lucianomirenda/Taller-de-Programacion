
package tema4;


public class test {

    public static void main(String[] args) {
        
        Pepes pepe1 = new Pepes(13,666);
        
        Pepes []vector = new Pepes[5];
        
        vector[0] = pepe1;
        
        System.out.println(vector[0].toString());
        
        int num = 23;
        int dni = 808;
        
        vector[1] = new Pepes(1,1);
        
        vector[1].setPepeNum(num);
        vector[1].setDNI(dni);
        
        System.out.println(vector[1].toString());
    }
    
}
