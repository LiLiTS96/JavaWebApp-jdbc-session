package connection;

import java.sql.*;
import java.util.Properties;

public class DatabaseConnection {

    private static Connection connection = null;

    public static Connection getConnection() throws SQLException {

        String url = "jdbc:mysql://localhost/data_base_java";
        Properties properties = new Properties();
        properties.setProperty("user", "root");
        properties.setProperty("password", "");
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("NOO");
            e.printStackTrace();
        }
        connection = DriverManager.getConnection(url, properties);
        return connection;

    }
}
