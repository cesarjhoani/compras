/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Persistencia;

import Modelo.Producto;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cesar
 */
public class ProductoDao {

    static Conexion dao = new Conexion();
    static Connection con;
    static PreparedStatement ps;
    static ResultSet rs;

    public static List<Producto> listar() {
        List<Producto> lista = new ArrayList<>();
        try {

            con = dao.conectar();
            String sql = "SELECT * FROM producto;";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto producto = new Producto();
                producto.setIdProducto(rs.getInt("idProducto"));
                producto.setNombres(rs.getString("Nombres"));
                producto.setFoto(rs.getBinaryStream("Foto"));
                producto.setDescripcion(rs.getString("Descripcion"));
                producto.setPrecio(rs.getDouble("Precio"));
                producto.setStock(rs.getInt("Stock"));

                lista.add(producto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDao.class.getName()).log(Level.SEVERE, null, ex);
        }

        return lista;
    }

    public static Producto listarId(int id) { //obtenemos los atributos del producto segun id
        String sql = "SELECT * FROM producto WHERE idProducto=" + id;
        Producto producto = new Producto();
        try {
            con = dao.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()){
                producto.setIdProducto(rs.getInt(1));
                producto.setNombres(rs.getString(2));
                producto.setFoto(rs.getBinaryStream(3));
                producto.setDescripcion(rs.getString(4));
                producto.setPrecio(rs.getDouble(5));
                producto.setStock(rs.getInt(6));
                
            }

        } catch (Exception e) {
        }
        return producto;
    }

    public static void listarImg(int id, HttpServletResponse response) {
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        try {
            String sql = "SELECT * FROM producto WHERE idProducto=" + id;
            outputStream = response.getOutputStream();
            con = dao.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                inputStream = rs.getBinaryStream("Foto");

            }

            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductoDao.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(ProductoDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
