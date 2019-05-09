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

public class GestorSesionServicioBD {

    private Connection conexion;
    private ResultSet rs;
    private Statement st;

    public GestorSesionServicioBD() {
        conexion = ConectaBD.obtenerConexion();
    }

    public List<SesionServicio> getSesiones() {
        /*Devuelve una lista con todos los usuarios 
         leidos de la base de datos*/

        List<SesionServicio> listaSesiones = new ArrayList<>();

        try {
            st = conexion.createStatement();
            rs = st.executeQuery("call getSesiones();");
            while (rs.next()) {
                SesionServicio sesionServicio = new SesionServicio();
                sesionServicio.setId(rs.getInt(1));
                sesionServicio.setFk_cliente(rs.getInt(2));
                sesionServicio.setFk_mesero(rs.getInt(3));
                sesionServicio.setNumMesa(rs.getInt(4));
                sesionServicio.setPuntajeMeseroServicio(rs.getDouble(5));
                sesionServicio.setTotalVenta(rs.getDouble(6));
                sesionServicio.setTipoPago(rs.getString(7));
                sesionServicio.setEstadoSesion(rs.getInt(8));
                sesionServicio.setStatus(rs.getInt(9));
                listaSesiones.add(sesionServicio);

            }
            rs.close();
            st.close();
            return listaSesiones;
        } catch (Exception e) {
            e.printStackTrace();

            return null;
        }
    }

    public SesionServicio getSesionPorID(int id) {
        /*Devuelve un objeto de tipo Cliente de acuerdo a su llave primaria */

        SesionServicio sesionServicio = new SesionServicio();
        try {
            PreparedStatement ps = conexion.prepareStatement("call getSesionPorId(?);");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            rs.next();
            sesionServicio.setId(rs.getInt(1));
            sesionServicio.setFk_cliente(rs.getInt(2));
            sesionServicio.setFk_mesero(rs.getInt(3));
            sesionServicio.setNumMesa(rs.getInt(4));
            sesionServicio.setPuntajeMeseroServicio(rs.getDouble(5));
            sesionServicio.setTotalVenta(rs.getDouble(6));
            sesionServicio.setTipoPago(rs.getString(7));
            sesionServicio.setEstadoSesion(rs.getInt(8));
            sesionServicio.setStatus(rs.getInt(9));
            rs.close();
            ps.close();
            return sesionServicio;
        } catch (Exception e) {
            e.printStackTrace();

            return sesionServicio;
        }
    }

    public int getSesionNextId() {
        /*Devuelve el siguiente número de ID a utilizar*/
        int nextId = 0;
        try {
            st = conexion.createStatement();
            rs = st.executeQuery("CALL getSesionNextId();");
            rs.next();
            nextId = rs.getInt(1);
            rs.close();
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return nextId;
    }

    public void addSesionServicio(SesionServicio sesionServicio) {
        /*Almacena un objeto en la base de datos, 
         cada atributo se utiliza en la posición que le corresponde 
         de la instrucción SQL */

        try {
            PreparedStatement st = conexion.prepareStatement("call insertarNuevaSesion (?, ?, ?);");
            st.setInt(1, sesionServicio.getFk_cliente());
            st.setInt(2, sesionServicio.getFk_mesero());
            st.setInt(3, sesionServicio.getNumMesa());

            st.execute();
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void updatePuntajeMeseroSesion(SesionServicio sesionServicio) {//Agregar y actualizar puntaje
//        Modifica un objeto en la base de datos, 
//         cada atributo se utiliza en la posición que le corresponde 
//         de la instrucción SQL 
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "call updatePuntajeMeseroSesion(?,?);");
            st.setInt(1, sesionServicio.getId());
            st.setDouble(2, sesionServicio.getPuntajeMeseroServicio());
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public void updateTotalVentaYTipoPagoSesion(SesionServicio sesionServicio) {
//        Modifica un objeto en la base de datos, 
//         cada atributo se utiliza en la posición que le corresponde 
//         de la instrucción SQL 
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "call updateTotalVentaYTipoPagoSesion(?,?,?);");
            st.setInt(1, sesionServicio.getId());
            st.setDouble(2, sesionServicio.getTotalVenta());
            st.setString(3, sesionServicio.getTipoPago());
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public void deleteSesion(int id) {
//        Elimina un registro en la base de datos de acuerdo a su llave primaria 
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "call deleteSesion(?);");
            st.setInt(1, id);
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public List<SesionServicio> calcularTotalPorOrdenEnVentaDeUnaSesion(int id) {
        ///Devuelve un objeto de tipo Cliente de acuerdo a su llave primaria 

        List<SesionServicio> listaSesionesTotalPorOrden = new ArrayList<>();

        try {
            PreparedStatement ps = conexion.prepareStatement("call calcularTotalPorOrdenEnVentaDeUnaSesion(?);");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                SesionServicio sesionServicio = new SesionServicio();
                sesionServicio.setId(rs.getInt(1));
                sesionServicio.setFk_cliente(rs.getInt(2));
                sesionServicio.setFk_mesero(rs.getInt(3));
                sesionServicio.setNumMesa(rs.getInt(4));
                sesionServicio.setPuntajeMeseroServicio(rs.getDouble(5));
                sesionServicio.setTotalVenta(rs.getDouble(6));
                sesionServicio.setTipoPago(rs.getString(7));
                sesionServicio.setEstadoSesion(rs.getInt(8));
                sesionServicio.setIdOrden(rs.getInt(9));
                sesionServicio.setTotalPorOrdenCalculado(rs.getDouble(10));
                listaSesionesTotalPorOrden.add(sesionServicio);

            }
            rs.close();
            st.close();
            return listaSesionesTotalPorOrden;
        } catch (Exception e) {
            e.printStackTrace();

            return null;
        }
    }

    public List<SesionServicio> calcularTotalGeneralEnVentaDeUnaSesion(int id) {
        ///Devuelve un objeto de tipo Cliente de acuerdo a su llave primaria 

        List<SesionServicio> listaSesionesTotalPorOrden = new ArrayList<>();

        try {
            PreparedStatement ps = conexion.prepareStatement("call calcularTotalGeneralEnVentaDeUnaSesion(?);");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                SesionServicio sesionServicio = new SesionServicio();
                sesionServicio.setId(rs.getInt(1));
                sesionServicio.setFk_cliente(rs.getInt(2));
                sesionServicio.setFk_mesero(rs.getInt(3));
                sesionServicio.setNumMesa(rs.getInt(4));
                sesionServicio.setPuntajeMeseroServicio(rs.getDouble(5));
                sesionServicio.setTotalVenta(rs.getDouble(6));
                sesionServicio.setTipoPago(rs.getString(7));
                sesionServicio.setEstadoSesion(rs.getInt(8));
                sesionServicio.setTotalPorSesionCalculado(rs.getDouble(9));
                listaSesionesTotalPorOrden.add(sesionServicio);

            }
            rs.close();
            st.close();
            return listaSesionesTotalPorOrden;
        } catch (Exception e) {
            e.printStackTrace();

            return null;
        }
    }

}
