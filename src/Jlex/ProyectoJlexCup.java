/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Jlex;

/**
 *
 * @author JairoJS
 */
public class ProyectoJlexCup {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        try {
            parser p = new parser(new Yylex(new java.io.FileInputStream("C:\\Users\\JairoJS\\Desktop\\ProyectoJlexCup\\prueba.mlp")));
            p.parse();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
