package dao;

import database.Conexion;
import interfaces.*;
import modelo.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClienteDao implements crudCliente {

    //Estancias necesarias para la logica
    ClienteProveedor ClienteProveedor = new ClienteProveedor();
    Conexion cn = new Conexion();
    CallableStatement cs;
    Connection con;
    ResultSet rs;

    //variables para los procedimientos almacenados
    String getAll = "CALL SeleccionarClientesProveedores()";
    String getById = "CALL SeleccionarClienteProveedorPorID(?)";
    String add = "CALL InsertarClienteProveedor(?,?,?,?,?)";
    String update = "CALL ActualizarClienteProveedor(?,?,?,?,?,?)";
    String delete = "CALL EliminarClienteProveedorPorID(?)";

    @Override
    public List getAll() {
        ArrayList<ClienteProveedor> lista = new ArrayList<>();
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(getAll);
            rs = cs.executeQuery();
            while (rs.next()) {
                ClienteProveedor cli = new ClienteProveedor();
                cli.setIdClienteProveedor(rs.getInt(1));
                cli.setCliProNombre(rs.getString(2));
                cli.setCliProApellido(rs.getString(3));
                cli.setCliProCedula(rs.getString(4));
                cli.setCliProEmail(rs.getString(5));
                cli.setCliProTelefono(rs.getString(6));
                lista.add(cli);
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar: " + ex.getMessage());
        }
        return lista;
    }

    @Override
    public ClienteProveedor getById(Integer id) {
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(getById);
            cs.setInt(1, id);
            rs = cs.executeQuery();
            while (rs.next()) {
                ClienteProveedor.setIdClienteProveedor(rs.getInt(1));
                ClienteProveedor.setCliProNombre(rs.getString(2));
                ClienteProveedor.setCliProApellido(rs.getString(3));
                ClienteProveedor.setCliProCedula(rs.getString(4));
                ClienteProveedor.setCliProEmail(rs.getString(5));
                ClienteProveedor.setCliProTelefono(rs.getString(6));
            }
        } catch (SQLException ex) {
            System.out.println("Error al listar: " + ex.getMessage());
        }
        return ClienteProveedor;
    }

    @Override
    public String add(ClienteProveedor cli) {
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(add);
            cs.setString(1, cli.getCliProNombre());
            cs.setString(2, cli.getCliProApellido());
            cs.setString(3, cli.getCliProCedula());
            cs.setString(4, cli.getCliProEmail());
            cs.setString(5, cli.getCliProTelefono());
            cs.execute();
        } catch (SQLException ex) {
            System.out.println("Error al crear: " + ex.getMessage());
            return "no creado";
        }
        return "creado";
    }

    @Override
    public String updateById(ClienteProveedor cli) {
        try {
            con = (Connection) cn.getConexion();
            cs = con.prepareCall(update);
            cs.setInt(1, cli.getIdClienteProveedor());
            cs.setString(2, cli.getCliProNombre());
            cs.setString(3, cli.getCliProApellido());
            cs.setString(4, cli.getCliProCedula());
            cs.setString(5, cli.getCliProEmail());
            cs.setString(6, cli.getCliProTelefono());
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
