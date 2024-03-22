/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author sappydumb
 */
public class Pepes {
    private int pepeNum;
    private int DNI;

    public Pepes(int pepeNum, int DNI) {
        this.pepeNum = pepeNum;
        this.DNI = DNI;
    }

    public int getPepeNum() {
        return pepeNum;
    }

    public void setPepeNum(int pepeNum) {
        this.pepeNum = pepeNum;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    @Override
    public String toString() {
        return "Pepes{" + "pepeNum=" + pepeNum + ", DNI=" + DNI + '}';
    }
 
    
}
