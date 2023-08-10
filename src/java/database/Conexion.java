package database;

import java.sql.*;

public class Conexion {

    public static Connection getConexion() {
        Connection cn = null;
        String DATA_BASE = "rosarito";  // Nombre de la base de datos
        String USER = "root";         // Nombre de usuario de la base de datos
        String HOST = "localhost";    // Dirección del servidor de la base de datos
        String PASSWORD = "";         // Contraseña de la base de datos
        String PORT = ":3306/";       // Puerto de la base de datos (MySQL por defecto)
        String URL = "jdbc:mysql://" + HOST + PORT + DATA_BASE + "?serverTimezone=UTC"; // URL de conexión

        try {
            // Cargar el driver de MySQL (esto varía según la versión y el driver)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establecer la conexión a la base de datos
            cn = DriverManager.getConnection(URL, USER, PASSWORD);
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("ERROR DE CONEXION: " + e.getMessage());
        }
        return cn;  // Devolver la conexión establecida
    }
}
