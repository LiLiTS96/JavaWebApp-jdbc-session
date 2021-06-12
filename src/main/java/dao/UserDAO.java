package dao;

import beans.UserBean;
import connection.DatabaseConnection;
import java.sql.PreparedStatement;

import java.sql.*;

public class UserDAO {
    public static String autheticateUser(UserBean loginUserBean) throws SQLException {

        String userName = loginUserBean.getUser();
        String password = loginUserBean.getPassword();

        try{
            Connection con = DatabaseConnection.getConnection();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("select id, userName,userPassword, userRole from user");
            while(resultSet.next()){
                String userNameDB = resultSet.getString("userName");
                String passwordDB = resultSet.getString("userPassword");
                int roleDB = resultSet.getInt("userRole");
                if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB == 1){
                    return "Admin_Role";
                }else if(userName.equals(userNameDB) && password.equals(passwordDB) && roleDB == 2){
                    return  "User_Role";
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

        try
        {
            Connection con = DatabaseConnection.getConnection();
            String query = "insert into user(userName,userPassword) values (?,?)";
            PreparedStatement preparedStatement = con.prepareStatement(query);
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
