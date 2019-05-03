package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class GestorUsuarioBD {

    private Connection conexion;
    private ResultSet rs;
    private Statement st;

    public GestorUsuarioBD() {
        conexion = ConectaBD.obtenerConexion();
    }

    public List<Usuario> getUsuarios() {
        /*Devuelve una lista con todos los usuarios 
      leidos de la base de datos*/

        List<Usuario> usuarios = new ArrayList<>();

        try {
            st = conexion.createStatement();
            rs = st.executeQuery("SELECT * FROM usuarios");
            while (rs.next()) {
                Usuario user = new Usuario();
                user.setUserId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setLastname(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setUsername(rs.getString(5));
                user.setPassword(rs.getString(6));
                usuarios.add(user);

            }
            rs.close();
            st.close();
            return usuarios;
        } catch (Exception e) {
            e.printStackTrace();

            return null;
        }
    }

    public void addUsuario(Usuario user) {
        /*Almacena un objeto en la base de datos, 
        cada atributo se utiliza en la posición que le corresponde 
        de la instrucción SQL */
        
        try {
            PreparedStatement st = conexion.prepareStatement("INSERT INTO usuarios VALUES(null, ?, ?, ?, ?, ?, ?)");
            st.setString(1, user.getName());
            st.setString(2, user.getLastname());
            st.setString(3, user.getEmail());
            st.setString(4, user.getUsername());
            st.setString(5, user.getPassword());
            st.setString(6, user.getType());
            st.execute();
            st.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public Usuario getUsuario(int id) {
        /*Devuelve un objeto de tipo Usuario de acuerdo a su llave primaria */
        
        Usuario user = new Usuario();
        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuarios WHERE id=?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            rs.next();
            user.setUserId(rs.getInt(1));
            user.setName(rs.getString(2));
            user.setLastname(rs.getString(3));
            user.setEmail(rs.getString(4));
            user.setUsername(rs.getString(5));
            user.setPassword(rs.getString(6));

            rs.close();
            ps.close();
            return user;
        } catch (Exception e) {
            e.printStackTrace();

            return user;
        }
    }
    
    public Usuario getUserLogin(String username, String password) {
        /*Devuelve un objeto de tipo Usuario de acuerdo a su llave primaria */
        
        Usuario user = new Usuario();
        try {
            PreparedStatement ps = conexion.prepareStatement("SELECT * FROM usuarios WHERE usuario=? && contraseña =?");
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            rs.next();
            user.setUserId(rs.getInt(1));
            user.setName(rs.getString(2));
            user.setLastname(rs.getString(3));
            user.setEmail(rs.getString(4));
            user.setUsername(rs.getString(5));
            user.setPassword(rs.getString(6));
            user.setType(rs.getString(7));

            rs.close();
            ps.close();
            return user;
        } catch (Exception e) {
            e.printStackTrace();

            return user;
        }
    }

    public void updateUsuario(Usuario user) {
        /*Modifica un objeto en la base de datos, 
        cada atributo se utiliza en la posición que le corresponde 
        de la instrucción SQL */
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "UPDATE usuarios SET name=?, lastname=?, email=?, username=? password=? WHERE id = ?");
            st.setString(1, user.getName());
            st.setString(2, user.getLastname());
            st.setString(3, user.getEmail());
            st.setString(4, user.getUsername());
            st.setString(5, user.getPassword());
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public void DeleteUsuario(int id) {
         /*Elimina un registro en la base de datos de acuerdo a su llave primaria */
        try {
            PreparedStatement st = conexion.prepareStatement(
                    "DELETE FROM usuarios WHERE id = ?");
            st.setInt(1, id);
            st.execute();
            st.close();

        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

    public int getNextId() {
        /*Devuelve el siguiente número de ID a utilizar*/
        int nextId = 0;
        try {
            st = conexion.createStatement();
            rs = st.executeQuery("CALL getNextId;");
            rs.next();
            nextId = rs.getInt(1);
            rs.close();
            st.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return nextId;
    }
}
