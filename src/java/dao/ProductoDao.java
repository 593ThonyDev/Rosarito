package dao;

import database.Conexion;
import interfaces.crudProducto;
import modelo.*;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDao implements crudProducto {

    //Estancias necesarias para la logica
    Producto Producto = new Producto();
    Conexion cn = new Conexion();
    CallableStatement cs;
    Connection con;
    ResultSet rs;

    //variables para los procedimientos almacenados
    String getAll = "CALL SeleccionarProductos()";
    String getById = "CALL SeleccionarProductoPorID(?)";
    String add = "CALL InsertarProducto(?,?,?,?)";
    String update = "CALL ActualizarProducto(?,?,?,?,?)";
    String delete = "CALL EliminarProductoPorID(?)";

    @Override
    public List getAll() {
        ArrayList<Producto> lista = new ArrayList<>();
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(getAll);
            rs = cs.executeQuery();
            while (rs.next()) {
                Producto pro = new Producto();
                pro.setIdProducto(rs.getInt(1));
                pro.setProNombre(rs.getString(2));
                pro.setProCodigo(rs.getString(3));
                pro.setProStock(rs.getInt(4));
                pro.setProPrecio(rs.getDouble(5));
                lista.add(pro);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar: " + ex.getMessage());
        }
        return lista;
    }

    @Override
    public Producto getById(Integer id) {
        ArrayList<Producto> lista = new ArrayList<>();
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(getById);
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                Producto.setIdProducto(rs.getInt(1));
                Producto.setProNombre(rs.getString(2));
                Producto.setProCodigo(rs.getString(3));
                Producto.setProStock(rs.getInt(4));
                Producto.setProPrecio(rs.getDouble(5));
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar: " + ex.getMessage());
        }
        return Producto;
    }

    @Override
    public String add(Producto pro) {
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(add);
            cs.setString(1, pro.getProNombre());
            cs.setString(2, pro.getProCodigo());
            cs.setInt(3, pro.getProStock());
            cs.setDouble(4, pro.getProPrecio());
            cs.execute();
        } catch (SQLException ex) {
            System.out.println("Error al crear: " + ex.getMessage());
            return "no creado";
        }
        return "creado";
    }

    @Override
    public String updateById(Producto pro) {
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(update);
            cs.setInt(1, pro.getIdProducto());
            cs.setString(2, pro.getProNombre());
            cs.setString(3, pro.getProCodigo());
            cs.setInt(4, pro.getProStock());
            cs.setDouble(5, pro.getProPrecio());
            cs.execute();
        } catch (SQLException ex) {
            System.out.println("Error al actualizar: " + ex.getMessage());
            return "no actualizado";
        }
        return "actualizado";
    }

    @Override
    public String deleteById(Integer id) {
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(delete);
            cs.setInt(1, id);
            cs.execute();
        } catch (SQLException ex) {
            System.out.println("Error al eliminar: " + ex.getMessage());
            return "no eliminado";
        }
        return "eliminado";
    }

}
