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
                sesionServicio.setEstadoSesion(rs.getString(8));
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
            sesionServicio.setEstadoSesion(rs.getString(8));
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
/*
    public void updatePuntajeMeseroSesion(SesionServicio sesionServicio) {//Agregar y actualizar puntaje
//        Modifica un objeto en la base de datos, 
//         cada atributo se utiliza en la posición que le corresponde 
//         de la instrucción SQL 
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "call updatePuntajeMeseroSesion(?,?,?,?,?,?);");
            st.setInt(1, sesionServicio.getId());
            st.setBlob(2, sesionServicio.getImagen());
            st.setString(3, sesionServicio.getNombre());
            st.setString(4, sesionServicio.getDescripcion());
            st.setDouble(5, sesionServicio.getPrecio());
            st.setString(6, sesionServicio.getCategoria());
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public void updatePlatilloNoImage(Platillo platillo) {
//        Modifica un objeto en la base de datos, 
//         cada atributo se utiliza en la posición que le corresponde 
//         de la instrucción SQL 
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "call updatePlatilloNoImage(?,?,?,?,?);");
            st.setInt(1, platillo.getId());
            st.setString(2, platillo.getNombre());
            st.setString(3, platillo.getDescripcion());
            st.setDouble(4, platillo.getPrecio());
            st.setString(5, platillo.getCategoria());
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public void DeletePlatillo(int id) {
//        Elimina un registro en la base de datos de acuerdo a su llave primaria 
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "call deletePlatillo(?);");
            st.setInt(1, id);
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    

    public List<Platillo> getPlatillosPorNombre(String nombre) {
//        Devuelve una lista con todos los usuarios 
//         leidos de la base de datos

        List<Platillo> listaPlatillo = new ArrayList<>();

        try {
            PreparedStatement prest = conexion.prepareStatement("call getPlatillosPorNombre(?);");

            prest.setString(1, nombre);

            rs = prest.executeQuery();

            while (rs.next()) {
                Platillo platillo = new Platillo();
                platillo.setId(rs.getInt(1));
                platillo.setImagen(rs.getBinaryStream(2));
                platillo.setNombre(rs.getString(3));
                platillo.setDescripcion(rs.getString(4));
                platillo.setPrecio(rs.getDouble(5));
                platillo.setCategoria(rs.getString(6));
                platillo.setPuntuacionTotal(rs.getDouble(7));
                platillo.setNumeroPuntuaciones(rs.getInt(8));
                platillo.setStatus(rs.getInt(9));
                listaPlatillo.add(platillo);

            }
            rs.close();
            prest.close();
            return listaPlatillo;
        } catch (Exception e) {
            e.printStackTrace();

            return null;
        }
    }

    public List<Platillo> getPlatillosPorCategoria(String categoria) {
//        Devuelve una lista con todos los usuarios 
//         leidos de la base de datos

        List<Platillo> listaPlatillo = new ArrayList<>();

        try {
            PreparedStatement prest = conexion.prepareStatement("call getPlatillosPorCategoria(?);");

            prest.setString(1, categoria);

            rs = prest.executeQuery();

            while (rs.next()) {
                Platillo platillo = new Platillo();
                platillo.setId(rs.getInt(1));
                platillo.setImagen(rs.getBinaryStream(2));
                platillo.setNombre(rs.getString(3));
                platillo.setDescripcion(rs.getString(4));
                platillo.setPrecio(rs.getDouble(5));
                platillo.setCategoria(rs.getString(6));
                platillo.setPuntuacionTotal(rs.getDouble(7));
                platillo.setNumeroPuntuaciones(rs.getInt(8));
                platillo.setStatus(rs.getInt(9));
                listaPlatillo.add(platillo);

            }
            rs.close();
            prest.close();
            return listaPlatillo;
        } catch (Exception e) {
            e.printStackTrace();

            return null;
        }
    }

    public List<Object> getPuntajeDePlatillo(int idPlatillo) {//Arreglo, en posicion [0]=puntajeTotal, [1]=numPuntuaciones
// Devuelve una lista con todos los usuarios 
//         leidos de la base de datos

        List<Object> listaPuntaje = new ArrayList<>();

        try {
            PreparedStatement prest = conexion.prepareStatement("call getPuntajePlatillo(?);");

            prest.setInt(1, idPlatillo);

            rs = prest.executeQuery();

            while (rs.next()) {
                double puntuacion = rs.getDouble(1);
                int numPuntuacion = rs.getInt(2);
                listaPuntaje.add(puntuacion);
                listaPuntaje.add(numPuntuacion);

            }
            rs.close();
            prest.close();
            return listaPuntaje;
        } catch (Exception e) {
            e.printStackTrace();

            return null;
        }
    }

    public void updatePuntaje(Platillo platillo) {
//        Modifica un objeto en la base de datos, 
//         cada atributo se utiliza en la posición que le corresponde 
//         de la instrucción SQL 
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "call updatePuntajePlatillo(?,?,?);");
            st.setInt(1, platillo.getId());
            st.setDouble(2, platillo.getPuntuacionTotal());
            st.setInt(3, platillo.getNumeroPuntuaciones());
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }
*/

}
