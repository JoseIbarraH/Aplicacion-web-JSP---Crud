/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package jose.modelo;

import java.sql.*; 
/**
 * @author jciba
 */
public class CRUDUsuario {
    
    private Usuario alquien;
    private ConexionBaseDatos baseDatos;
    
    public void agregarUsuario() throws Exception {
        if (alquien.getId() == null || alquien.getId().isEmpty()) {
            throw new Exception("El ID del usuario es necesario");
        }
        String sqlInsert = "INSERT INTO Usuarios "
                + "(id, password, nombre, apellido, email, tipo)"
                + "VALUES(?,?,?,?,?,?)";
        try {
            PreparedStatement sentenciaSQL = baseDatos.crearSentencia(sqlInsert);
            
            sentenciaSQL.setString(1, alquien.getId());
            sentenciaSQL.setString(2, alquien.getPassword());
            sentenciaSQL.setString(3, alquien.getNombre());
            sentenciaSQL.setString(4, alquien.getApellido());
            sentenciaSQL.setString(5, alquien.getEmail());
            sentenciaSQL.setString(6, alquien.getTipo());
            
            baseDatos.actualizar(sentenciaSQL);
        }catch (Exception error){
            throw new Exception("Error al Agregar el Usuario "+ alquien.getId()
            + "<br/>Explicacion: " + error.getMessage());
        } finally {
            baseDatos.desconectar();
        }
    }
    
    public void modificarUsuario() throws Exception {
        if (alquien.getId() == null || alquien.getId().isEmpty()) {
            throw new Exception("El ID del usuario es necesario");
        }
        String sqlUpdate = "UPDATE Usuarios "
                + "SET password=?, nombre=?, apellido=?, email=?, tipo=?)"
                + "WHERE id = ?";
        try {
            PreparedStatement sentenciaSQL = baseDatos.crearSentencia(sqlUpdate);
            
            sentenciaSQL.setString(1, alquien.getPassword());
            sentenciaSQL.setString(2, alquien.getNombre());
            sentenciaSQL.setString(3, alquien.getApellido());
            sentenciaSQL.setString(4, alquien.getEmail());
            sentenciaSQL.setString(5, alquien.getTipo());
            sentenciaSQL.setString(6, alquien.getId());
            
            baseDatos.actualizar(sentenciaSQL);
        }catch (Exception error){
            throw new Exception("Error al actualizar el Usuario " + alquien.getId()
            + "<br/>Explicacion: " + error.getMessage());
        } finally {
            baseDatos.desconectar();
        }
    }
    
    public void eliminarUsuario() throws Exception {
        if (alquien.getId() == null || alquien.getId().isEmpty()) {
            throw new Exception ("El id del usuario es necesario");
        }
        
        String sqlDelete = "DELETE FROM USUARIOS WHERE id = ?";
        
        try {
            
            PreparedStatement sentenciaSQL = baseDatos.crearSentencia(sqlDelete);
            
            sentenciaSQL.setString(1, alquien.getId());
                    
            baseDatos.actualizar(sentenciaSQL);
        }catch (Exception error) {
            throw new Exception("Error al eliminar el usuario " + alquien.getId()
            + "<br/>Explicacion: " + error.getMessage());
        }finally{
            baseDatos.desconectar();
        }
    }
    
    public static Usuario iniciarSesion(String id, String password) throws Exception {
        if (id == null || id.isEmpty() || password == null || password.isEmpty()) {
            throw new Exception("El id y el password del usuario son necesarios");
        }
        Usuario alguien; ConexionBaseDatos baseDatos = null;
        
        String sqlSelect = "SELECT * FROM Usuarios WHERE id = ? and password = ?";
        try {
            baseDatos = new ConexionBaseDatos();
            PreparedStatement sentenciaSQL = baseDatos.crearSentencia(sqlSelect);
            
            sentenciaSQL.setString(1, id); sentenciaSQL.setString(2, password);
            
            ResultSet resultado = baseDatos.consultar(sentenciaSQL);
            if (resultado.next() == true) {
                alguien = new Usuario();
                alguien.setId(resultado.getString("id"));
                alguien.setPassword(resultado.getString("password"));
                alguien.setNombre(resultado.getString("nombre"));
                alguien.setApellido(resultado.getString("apellido"));
                alguien.setEmail(resultado.getString("email"));
                alguien.setTipo(resultado.getString("tipo"));
                return alguien;
            }else{
                throw new Exception("Error al consultar el usuario " + id + "<br/>Explicacion: ");
            }
        }catch (Exception error){
            throw new Exception(error.getMessage() + "Error en el ID p el Password estan Errados");
        }finally{
            if (baseDatos != null) {
                baseDatos.desconectar();
            }
        }
    }
    
    public static Usuario consultarUsuario (String id) throws Exception {
        if (id == null || id.isEmpty()) {
            throw new Exception("El id del usuario es necesarios");
        }
        Usuario alguien; ConexionBaseDatos baseDatos = null;
        
        String sqlSelect = "SELECT * FROM Usuarios WHERE id = ?";
        try {
            
            baseDatos = new ConexionBaseDatos();
            PreparedStatement sentenciaSQL = baseDatos.crearSentencia(sqlSelect);
            
            sentenciaSQL.setString(1, id);
            
            ResultSet resultado = baseDatos.consultar(sentenciaSQL);
            if (resultado.next() == true) {
                alguien = new Usuario();
                alguien.setId(resultado.getString("id"));
                alguien.setPassword(resultado.getString("password"));
                alguien.setNombre(resultado.getString("nombre"));
                alguien.setApellido(resultado.getString("apellido"));
                alguien.setEmail(resultado.getString("email"));
                alguien.setTipo(resultado.getString("tipo"));
                return alguien;
            }else{
                throw new Exception("Error al consultar el usuario " + id + "<br/>Explicacion: ");
            }
        }catch(Exception error) {
            throw new Exception(error.getMessage() + "El usuario no existe en la bd");
        }finally{
            if (baseDatos != null) {
                baseDatos.desconectar();
            }
        }
    }
    
    public static Usuario[] listarTodosLosUsuarios() throws Exception {
        Usuario alguien; ConexionBaseDatos baseDatos = null;
        
        String sqlSelect = "SELECT * FROM Usuarios";
        try {
            baseDatos = new ConexionBaseDatos();
            PreparedStatement sentenciaSQL = baseDatos.crearSentencia(sqlSelect);
            
            ResultSet resultado = baseDatos.consultar(sentenciaSQL);
            resultado.last();
            Usuario[] listado = new Usuario[resultado.getRow()];
            resultado.beforeFirst();
            while (resultado.next() == true) {
                alguien = new Usuario();
                alguien.setId(resultado.getString("id"));
                alguien.setPassword(resultado.getString("password"));
                alguien.setNombre(resultado.getString("nombre"));
                alguien.setApellido(resultado.getString("apellido"));
                alguien.setEmail(resultado.getString("email"));
                alguien.setTipo(resultado.getString("tipo"));
                listado[resultado.getRow()] = alguien;
            }if (listado.length <= 0) {
                throw new Exception("Error al listar los usuarios " + "<br/>Explicacion: ");
            }
            return listado;
        }catch (Exception error) {
            throw new Exception(error.getMessage() + "La bd esta vacia");
        }finally{
            if (baseDatos != null) {
                baseDatos.desconectar();
            }
        }
    }

    public Usuario getAlquien() {
        return alquien;
    }

    public void setAlquien(Usuario alquien) {
        this.alquien = alquien;
    }

    public ConexionBaseDatos getBaseDatos() {
        return baseDatos;
    }

    public void setBaseDatos(ConexionBaseDatos baseDatos) {
        this.baseDatos = baseDatos;
    }
    
}
