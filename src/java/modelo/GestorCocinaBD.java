/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

public class GestorCocinaBD {

    private Connection conexion;
    private ResultSet rs;
    private Statement st;

    public GestorCocinaBD() {
        conexion = ConectaBD.obtenerConexion();
    }
    
    public List<Cocina> getClaveAcceso() {
        /*Devuelve una lista con todos los usuarios 
         leidos de la base de datos*/

        List<Cocina> listaClaveCocina = new ArrayList<>();

        try {
            st = conexion.createStatement();
            rs = st.executeQuery("call getClaveAcceso();");
            while (rs.next()) {
                Cocina cocina = new Cocina();
                cocina.setId(rs.getInt(1));
                cocina.setClaveAcceso(rs.getString(2));

                listaClaveCocina.add(cocina);

            }
            rs.close();
            st.close();
            return listaClaveCocina;
        } catch (Exception e) {
            e.printStackTrace();

            return null;
        }
    }


    public void addClaveAcceso(Cocina cocina) {
        /*Almacena un objeto en la base de datos, 
         cada atributo se utiliza en la posición que le corresponde 
         de la instrucción SQL */

        try {
            PreparedStatement st = conexion.prepareStatement("call crearClaveAcceso (?);");
            st.setString(1, cocina.getClaveAcceso());

            st.execute();
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void updateClaveAcceso(String claveAcceso) {
        /*Modifica un objeto en la base de datos, 
         cada atributo se utiliza en la posición que le corresponde 
         de la instrucción SQL */
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "call updateClaveAcceso(?);");
            st.setString(1, claveAcceso);
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public void deleteClaveAcceso(int id) {
        /*Elimina un registro en la base de datos de acuerdo a su llave primaria */
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "call deleteClaveAcceso(?);");
            st.setInt(1, id);
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }
}
