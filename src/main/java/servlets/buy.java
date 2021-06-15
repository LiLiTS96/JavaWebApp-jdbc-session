package servlets;

import dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "buy", value = "/buy")
public class buy extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int userId = (int) session.getAttribute("id");
        int productId = Integer.parseInt(request.getParameter("id"));

        UserDAO orderDao = new UserDAO();
        String order = orderDao.addOrder(userId, productId);
        if(order.equals("SUCCESS"))
        {
            request.getRequestDispatcher("/hello.jsp").forward(request, response);
        }
        else
        {
            request.setAttribute("errMessage", order);
            request.getRequestDispatcher("/hello.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
