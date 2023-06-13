package co.edu.sena.rocks.utiil;

import java.sql.Connection;
import java.sql.SQLException;

import java.sql.ResultSet;
import java.sql.Statement;

public class UseConnectionPool {
    public static Connection getConnection()
            throws SQLException {
        return DBConection.getConnection();
    }
    public static void main(String[] args)
            throws SQLException {
        try (Connection conn = getConnection();
             Statement stmt =
                     conn.createStatement();
             ResultSet rs =
                     stmt.executeQuery("SELECT * FROM ROCK_STAR.Productos")) {
            while (rs.next()) {

                System.out.print(rs.getString("id"));
                System.out.print(" | ");

                System.out.println(rs.getString("nombre"));
            }
        }
    }
} // UseConnectionPool
