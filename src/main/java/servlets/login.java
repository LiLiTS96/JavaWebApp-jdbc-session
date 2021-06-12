package servlets;

import beans.UserBean;
import dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "login", value = "/login")
public class login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //PrintWriter out = response.getWriter();

        String user = request.getParameter("username");
        String passwd = request.getParameter("password");

        UserBean loginUserBean = new UserBean();

        loginUserBean.setUser(user);
        loginUserBean.setPassword(passwd);

        UserDAO userDAO = new UserDAO();

        try {
            String userValidate = UserDAO.autheticateUser(loginUserBean);

            if(userValidate.equals("Admin_Role"))
            {
                HttpSession session = request.getSession();
                session.setAttribute("RoleAdmin", user);
                session.setAttribute("user", user);
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            }else if(userValidate.equals("User_Role"))
            {
                HttpSession session = request.getSession();
                session.setAttribute("RoleUser", user);
                session.setAttribute("user", user);
                request.getRequestDispatcher("hello.jsp").forward(request, response);
            }
            else
            {
                request.setAttribute("errMessage", userValidate);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
