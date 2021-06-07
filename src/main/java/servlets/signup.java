package servlets;

import beans.UserBean;
import dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "signup", value = "/signup")
public class signup extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        UserBean registerBean = new UserBean();
        registerBean.setUser(userName);
        registerBean.setPassword(password);

        UserDAO registerDao = new UserDAO();
        String userRegistered = registerDao.registerUser(registerBean);
        if(userRegistered.equals("SUCCESS"))
        {
            request.getRequestDispatcher("/success.jsp").forward(request, response);
        }
        else
        {
            request.setAttribute("errMessage", userRegistered);
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
        }
    }
}
