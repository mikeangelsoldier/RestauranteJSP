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

public class GestorPlatilloBD {

    private Connection conexion;
    private ResultSet rs;
    private Statement st;

    public GestorPlatilloBD() {
        conexion = ConectaBD.obtenerConexion();
    }

    public List<Platillo> getPlatillos() {
        /*Devuelve una lista con todos los usuarios 
         leidos de la base de datos*/

        List<Platillo> listaPlatillo = new ArrayList<>();

        try {
            st = conexion.createStatement();
            rs = st.executeQuery("call getPlatillos();");
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
            st.close();
            return listaPlatillo;
        } catch (Exception e) {
            e.printStackTrace();

            return null;
        }
    }

    public void addPlatillo(Platillo platillo) {
        /*Almacena un objeto en la base de datos, 
         cada atributo se utiliza en la posición que le corresponde 
         de la instrucción SQL */

        try {
            PreparedStatement st = conexion.prepareStatement("call insertarPlatillo (?, ?, ?, ?, ?);");
            st.setBlob(1, platillo.getImagen());
            st.setString(2, platillo.getNombre());
            st.setString(3, platillo.getDescripcion());
            st.setDouble(4, platillo.getPrecio());
            st.setString(5, platillo.getCategoria());

            st.execute();
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public Platillo getPlatillo(int id) {
        /*Devuelve un objeto de tipo Cliente de acuerdo a su llave primaria */

        Platillo platillo = new Platillo();
        try {
            PreparedStatement ps = conexion.prepareStatement("call getPlatillo(?);");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            rs.next();
            platillo.setId(rs.getInt(1));
            platillo.setImagen(rs.getBinaryStream(2));
            platillo.setNombre(rs.getString(3));
            platillo.setDescripcion(rs.getString(4));
            platillo.setPrecio(rs.getDouble(5));
            platillo.setCategoria(rs.getString(6));
            platillo.setPuntuacionTotal(rs.getDouble(7));
            platillo.setNumeroPuntuaciones(rs.getInt(8));
            platillo.setStatus(rs.getInt(9));
            rs.close();
            ps.close();
            return platillo;
        } catch (Exception e) {
            e.printStackTrace();

            return platillo;
        }
    }

    public void updatePlatillo(Platillo platillo) {
        /*Modifica un objeto en la base de datos, 
         cada atributo se utiliza en la posición que le corresponde 
         de la instrucción SQL */
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "call updatePlatillo(?,?,?,?,?,?);");
            st.setInt(1, platillo.getId());
            st.setBlob(2, platillo.getImagen());
            st.setString(3, platillo.getNombre());
            st.setString(4, platillo.getDescripcion());
            st.setDouble(5, platillo.getPrecio());
            st.setString(6, platillo.getCategoria());
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public void updatePlatilloNoImage(Platillo platillo) {
        /*Modifica un objeto en la base de datos, 
         cada atributo se utiliza en la posición que le corresponde 
         de la instrucción SQL */
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
        /*Elimina un registro en la base de datos de acuerdo a su llave primaria */
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

    public int getPlatilloNextId() {
        /*Devuelve el siguiente número de ID a utilizar*/
        int nextId = 0;
        try {
            st = conexion.createStatement();
            rs = st.executeQuery("CALL getPlatilloNextId();");
            rs.next();
            nextId = rs.getInt(1);
            rs.close();
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return nextId;
    }

    public List<Platillo> getPlatillosPorNombre(String nombre) {
        /*Devuelve una lista con todos los usuarios 
         leidos de la base de datos*/

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
        /*Devuelve una lista con todos los usuarios 
         leidos de la base de datos*/

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

    public List<Object> getPlatillosPuntaje(int idPlatillo) {/*Arreglo, en posicion [0]=puntajeTotal, [1]=numPuntuaciones*/
        /*Devuelve una lista con todos los usuarios 
         leidos de la base de datos*/

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
        /*Modifica un objeto en la base de datos, 
         cada atributo se utiliza en la posición que le corresponde 
         de la instrucción SQL */
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

    public void listarImg(int id, HttpServletResponse response) {
        String sql = "call getPlatillo(" + id + ");";
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");
        try {
            outputStream = response.getOutputStream();
            PreparedStatement st = conexion.prepareStatement(sql);
            rs = st.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream(2);
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch (Exception e) {
        }
    }

}
