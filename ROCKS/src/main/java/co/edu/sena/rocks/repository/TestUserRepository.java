package co.edu.sena.rocks.repository;

import co.edu.sena.rocks.bean.User;

import java.sql.SQLException;

public class TestUserRepository {

    public static void main(String[] args) throws SQLException {
        Repository<User> repository=new UserRepositoryImpl();

        System.out.println("=========== saveObj Insert ==========="); //insert
        User userInsert = new User();
        userInsert.setNombre("hola");
        userInsert.setDescripcion("jsjs");
        userInsert.setPrecio(102484);
        userInsert.setCantidad(5);
        repository.saveObj(userInsert);



    }
}
