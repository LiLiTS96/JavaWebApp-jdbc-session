package servlets;

import connection.DatabaseConnection;
import dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "delete", value = "/delete")
public class delete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response){

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DatabaseConnection.getConnection();
            Statement st = conn.createStatement();
            Statement st1 = conn.createStatement();

            st1.executeUpdate("DELETE FROM orders WHERE user_id=" + id);
            st.executeUpdate("DELETE FROM user WHERE id=" + id);

            response.sendRedirect("admin.jsp");

            conn.close();
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
}
