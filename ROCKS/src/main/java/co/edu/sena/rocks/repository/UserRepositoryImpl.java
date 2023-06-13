package co.edu.sena.rocks.repository;

import co.edu.sena.rocks.bean.User;
import co.edu.sena.rocks.utiil.UseConnectionPool;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
//UserRepository_impl
public class UserRepositoryImpl implements Repository<User> {
    private String sql = null;

    @Override
    public List<User> listAllObj() throws SQLException {
        sql = "select id, nombre,descripcion,precio,cantidad,image " +
                "from Productos  order by nombre,precio ";
        List<User>users = new ArrayList<>();
        try (Connection conn = UseConnectionPool.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                User u = createObj(rs);
                users.add(u);
            } //while

        } //try
        return users;
    } //listAllObj

    @Override
    public User byIdOBj(Integer id) throws SQLException {
        sql = "select id, nombre,descripcion,precio,cantidad,image " + "from Productos where id= ?";
        User user = null;

        try (Connection conn = UseConnectionPool.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt( 1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    user = createObj(rs);
                }
            } //try
        } return user;
    } //byIdObj

    @Override
    public Integer saveObj(User user) throws SQLException {

        int rowsAffected = 0;

        if (user.getId() != null && user.getId() > 0) {
            sql = "update Productos set nombre=?,descripcion=?,precio=?,cantidad=?)" + "where id=?";
        } else {
            sql = "insert into Productos(nombre,descripcion,precio,cantidad)" + "values (upper(?),upper(?),upper(?),upper(?))";
        }
        try (Connection conn = UseConnectionPool.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, user.getNombre());
            ps.setString(2, user.getDescripcion());
            ps.setInt(3,user.getPrecio());
            ps.setInt(4,user.getCantidad());
            if (user.getId() != null && user.getId() > 0) {
                ps.setInt(5, user.getId());
            }
            rowsAffected = ps.executeUpdate();
        }
        return rowsAffected;
    }

    @Override
    public void deleteObj(Integer id) throws SQLException {
        sql="delete from Productos where id=?";
        try (Connection conn = UseConnectionPool.getConnection();
             PreparedStatement ps=conn.prepareStatement(sql)){
            ps.setInt(1,id);
            ps.executeUpdate();
        }
    }

    @Override
    public User createObj(ResultSet rs) throws SQLException {
        User user = new User();
        user.setId(rs.getInt("id"));
        user.setNombre(rs.getString("nombre"));
        user.setDescripcion(rs.getString("descripcion"));
        user.setPrecio(rs.getInt("precio"));
        user.setPrecio(rs.getInt("cantidad"));
        user.setImage(rs.getString("image"));
        return user;
    } //createObj
}

