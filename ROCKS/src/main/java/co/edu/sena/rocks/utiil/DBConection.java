package co.edu.sena.rocks.utiil;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class DBConection {

        private static final String URL= "jdbc:mysql://localhost:3306/ROCK_STAR?serverTimezone=America/Bogota";

        private static final String USER= "root";
        private static final String PASS= "";
        private static BasicDataSource pool;

        public static BasicDataSource getInstance() throws SQLException {
            if (pool == null){
                pool= new BasicDataSource();
                pool.setUrl(URL);
                pool.setUsername(USER);
                pool.setPassword(PASS);

                pool.setInitialSize(3);
                pool.setMinIdle(3);
                pool.setMaxIdle(8);
                pool.setMaxTotal(8);
            }
            return pool;
        }
        public static Connection getConnection() throws SQLException{
            return getInstance().getConnection();
        }


}
