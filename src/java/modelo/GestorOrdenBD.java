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

public class GestorOrdenBD {

    private Connection conexion;
    private ResultSet rs;
    private Statement st;

    public GestorOrdenBD() {
        conexion = ConectaBD.obtenerConexion();
    }

    public List<Orden> getOrdenes() {
        /*Devuelve una lista con todos los usuarios 
         leidos de la base de datos*/

        List<Orden> listaOrdenes = new ArrayList<>();

        try {
            st = conexion.createStatement();
            rs = st.executeQuery("call getOrdenes();");
            while (rs.next()) {
                Orden orden = new Orden();
                orden.setId(rs.getInt(1));
                orden.setFk_sesionServicio(rs.getInt(2));
                orden.setEstadoOrden(rs.getString(3));
                orden.setStatus(rs.getInt(4));

                listaOrdenes.add(orden);

            }
            rs.close();
            st.close();
            return listaOrdenes;
        } catch (Exception e) {
            e.printStackTrace();

            return null;
        }
    }

    public Orden getOrdenPorID(int id) {
        /*Devuelve un objeto de tipo Cliente de acuerdo a su llave primaria */

        Orden orden = new Orden();
        try {
            PreparedStatement ps = conexion.prepareStatement("call getOrdenPorId(?);");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            rs.next();

             orden.setId(rs.getInt(1));
                orden.setFk_sesionServicio(rs.getInt(2));
                orden.setEstadoOrden(rs.getString(3));
                orden.setStatus(rs.getInt(4));

            rs.close();
            ps.close();
            return orden;
        } catch (Exception e) {
            e.printStackTrace();

            return orden;
        }
    }

    public int getOrdenNextId() {
        /*Devuelve el siguiente número de ID a utilizar*/
        int nextId = 0;
        try {
            st = conexion.createStatement();
            rs = st.executeQuery("CALL getOrdenNextId();");
            rs.next();
            nextId = rs.getInt(1);
            rs.close();
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return nextId;
    }

    public void addNuevaOrden(Orden orden) {
        /*Almacena un objeto en la base de datos, 
         cada atributo se utiliza en la posición que le corresponde 
         de la instrucción SQL */

        try {
            PreparedStatement st = conexion.prepareStatement("call insertarNuevaOrden(?);");
            
            st.setInt(1, orden.getFk_sesionServicio());

            st.execute();
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    public void indicarSolicitarOrden(int idOrdenASolicitar) {//Agregar y actualizar puntaje
//        Modifica un objeto en la base de datos, 
//         cada atributo se utiliza en la posición que le corresponde 
//         de la instrucción SQL 
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "call indicarSolicitarOrden(?);");
            st.setInt(1, idOrdenASolicitar);
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }
    
    public void indicarOrdenEnPreparacion(int idOrdenASolicitar) {//Agregar y actualizar puntaje
//        Modifica un objeto en la base de datos, 
//         cada atributo se utiliza en la posición que le corresponde 
//         de la instrucción SQL 
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "call indicarOrdenEnPreparacion(?);");
            st.setInt(1, idOrdenASolicitar);
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }
    
    
            
            
    public void indicarOrdenPreparada(int idOrdenPreparada) {//Agregar y actualizar puntaje
//        Modifica un objeto en la base de datos, 
//         cada atributo se utiliza en la posición que le corresponde 
//         de la instrucción SQL 
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "call indicarOrdenPreparada(?);");
            st.setInt(1, idOrdenPreparada);
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }
    
    public void indicarOrdenEntregada(int idOrdenEntregada) {//Agregar y actualizar puntaje
//        Modifica un objeto en la base de datos, 
//         cada atributo se utiliza en la posición que le corresponde 
//         de la instrucción SQL 
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "call indicarOrdenEntregada(?);");
            st.setInt(1, idOrdenEntregada);
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }
    
    public void deleteOrden(int id) {
//        Elimina un registro en la base de datos de acuerdo a su llave primaria 
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "call deleteOrden(?);");
            st.setInt(1, id);
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }
    
    
    public List<Orden> getOrdenesPorIdSesion(int idSesion) {
        ///Devuelve un objeto de tipo Cliente de acuerdo a su llave primaria 

        List<Orden> listaOrdenesDeUnaSesion = new ArrayList<>();

        try {
            PreparedStatement ps = conexion.prepareStatement("call getOrdenesPorIdSesion(?);");
            ps.setInt(1, idSesion);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                Orden orden = new Orden();
                 orden.setId(rs.getInt(1));
                orden.setFk_sesionServicio(rs.getInt(2));
                orden.setEstadoOrden(rs.getString(3));
                orden.setStatus(rs.getInt(4));
                listaOrdenesDeUnaSesion.add(orden);

            }
            rs.close();
            st.close();
            return listaOrdenesDeUnaSesion;
        } catch (Exception e) {
            e.printStackTrace();

            return null;
        }
    }
    
    public List<Orden> getOrdenesSolicitadasEnCocina() {
        /*Devuelve una lista con todos los usuarios 
         leidos de la base de datos*/

        List<Orden> listaOrdenes = new ArrayList<>();

        try {
            st = conexion.createStatement();
            rs = st.executeQuery("call getOrdenesSolicitadasEnCocina();");
            while (rs.next()) {
                Orden orden = new Orden();
                orden.setId(rs.getInt(1));
                orden.setFk_sesionServicio(rs.getInt(2));
                orden.setEstadoOrden(rs.getString(3));
                orden.setStatus(rs.getInt(4));

                listaOrdenes.add(orden);

            }
            rs.close();
            st.close();
            return listaOrdenes;
        } catch (Exception e) {
            e.printStackTrace();

            return null;
        }
    }

}
