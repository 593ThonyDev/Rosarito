package dao;

import database.Conexion;
import interfaces.crudOperacionTipo;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import modelo.*;
import modelo.OperacionTipo;

public class OperacionDao implements crudOperacionTipo {

    //Estancias necesarias para la logica
    Calculos cal = new Calculos();
    Conexion cn = new Conexion();
    CallableStatement cs;
    Connection con;
    ResultSet rs;

    //variables para los procedimientos almacenados
    String getAll = "CALL spLeerClienteProveedors()";
    String getById = "CALL spObtenerClienteProveedorPorID(?)";
    String add = "CALL spCrearClienteProveedor(?,?,?,?,?)";
    String update = "CALL spActualizarClienteProveedor(?,?,?,?,?,?)";
    String delete = "CALL spEliminarClienteProveedor(?)";

    @Override
    public List getAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public OperacionTipo getById(Integer id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String generarVenta(OperacionTipo ope, Detalle det) {
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall("call generarVenta(?,?,?,?,?,?,?,?)");

            cs.setInt(1, ope.getFkCliente());
            cs.setString(2, ope.getOpeCodigo());
            cs.setString(3, ope.getOpeFecha());
            cs.setDouble(4, new Calculos().calculoVenta(det.getDetCantidad(), new ProductoDao().getById(det.getFkProducto()).getProPrecio()));
            cs.setString(5, ope.getOpeTipo());
            cs.setInt(6, det.getFkOperacionTipo());
            cs.setInt(7, det.getFkProducto());
            cs.setString(8, det.getDetDescripcion());
            cs.setInt(9, det.getDetCantidad());
            cs.setDouble(10, new Calculos().calculoVenta(det.getDetCantidad(), new ProductoDao().getById(det.getFkProducto()).getProPrecio()));
            cs.setString(11, det.getDetJornada());
            if (det.getDetCantidad() < new ProductoDao().getById(det.getFkProducto()).getProStock()) {
                Producto pro = new ProductoDao().getById(det.getFkProducto());
                int stockNuevo = pro.getProStock() - det.getDetCantidad();
                pro.setProStock(stockNuevo);
                new ProductoDao().updateById(pro);
                cs.executeQuery();
            } else {
                return "cantidad no disponible";
            }
        } catch (SQLException ex) {
            System.out.println("Error al crear la venta: " + ex.getMessage());
            return "no creado";
        }
        return "creado";
    }

    @Override
    public String generarCompra(OperacionTipo ope, Detalle det) {
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall("call generarVenta(?,?,?,?,?,?,?,?)");

            cs.setInt(1, ope.getFkCliente());
            cs.setString(2, ope.getOpeCodigo());
            cs.setString(3, ope.getOpeFecha());
            cs.setDouble(4, new Calculos().calculoVenta(det.getDetCantidad(), new ProductoDao().getById(det.getFkProducto()).getProPrecio()));
            cs.setString(5, ope.getOpeTipo());
            cs.setInt(6, det.getFkOperacionTipo());
            cs.setInt(7, det.getFkProducto());
            cs.setString(8, det.getDetDescripcion());
            cs.setInt(9, det.getDetCantidad());
            cs.setDouble(10, new Calculos().calculoVenta(det.getDetCantidad(), new ProductoDao().getById(det.getFkProducto()).getProPrecio()));
            cs.setString(11, det.getDetJornada());
            if (det.getDetCantidad() < new ProductoDao().getById(det.getFkProducto()).getProStock()) {
                Producto pro = new ProductoDao().getById(det.getFkProducto());
                int stockNuevo = pro.getProStock() + det.getDetCantidad();
                pro.setProStock(stockNuevo);
                new ProductoDao().updateById(pro);
                cs.executeQuery();
            } else {
                return "cantidad no disponible";
            }
        } catch (SQLException ex) {
            System.out.println("Error al crear la venta: " + ex.getMessage());
            return "no creado";
        }
        return "creado";
    }

    public Integer getLastId() {
        int numero = 0;
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall("CALL obtenerUltimoID()");
            rs = cs.executeQuery();
            while (rs.next()) {
                numero = rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println("No hay id: " + ex.getMessage());
            return 0;
        }
        return numero;
    }

    @Override
    public String updateById(OperacionTipo ope) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public String deleteById(Integer idDetalle) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
