/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author alfredo
 */
public class ConectaBD {

    //cambiar de acuerdo a su nombre de usuario y contraseña
    public static Connection con;
    private static String bd = "restaurante";//Nombre de la base de datos
    public static String usuario = "root";
    //public static String passw = "Mike123*.";
    //public static String passw = "Fredy97@";
    public static String passw = "";
    public static String url = "jdbc:mysql://localhost/" + bd;

    public static Connection obtenerConexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, usuario, passw);
        } catch (Exception e) {
            System.out.println("Error en la conexion...");
            e.printStackTrace();
        }
        return con;

    }

    public static void cierraConexion() {
        try {
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            System.out.println("Error: No se logro cerrar conexion:\n" + e);
        }
    }
}
