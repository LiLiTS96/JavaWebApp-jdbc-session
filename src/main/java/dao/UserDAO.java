package dao;

import beans.UserBean;
import connection.DatabaseConnection;

import java.sql.*;

public class UserDAO {
    public static String autheticateUser(UserBean loginUserBean) throws SQLException {

        String userName = loginUserBean.getUser();
        String password = loginUserBean.getPassword();

        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;

        //int useridDB = 0;
        String userNameDB = "";
        String passwordDB = "";

        try{
            con = DatabaseConnection.getConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select id, userName,userPassword from user");
            while(resultSet.next()){
                //useridDB = resultSet.getInt("id");
                userNameDB = resultSet.getString("userName");
                passwordDB = resultSet.getString("userPassword");
                if(userName.equals(userNameDB) && password.equals(passwordDB)){
                    return "SUCCESS";
                }
            }
        }catch(SQLException e)
        {
            e.printStackTrace();
        }
        return "Invalid user credentials";
    }
    public String registerUser(UserBean registerBean)
    {

        String userName = registerBean.getUser();
        String password = registerBean.getPassword();

        Connection con = null;
        PreparedStatement preparedStatement = null;
        try
        {
            con = DatabaseConnection.getConnection();
            String query = "insert into user(userName,userPassword) values (?,?)";
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);

            int i= preparedStatement.executeUpdate();

            if (i!=0)
                return "SUCCESS";
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return "Oops.. Something went wrong there..!";
    }

}
