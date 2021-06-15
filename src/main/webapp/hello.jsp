<%@ page import="connection.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: shy_h
  Date: 04.06.2021
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Hello user!</title>
</head>
<body>

<%
    HttpSession sess = request.getSession(false);
    if(sess.getAttribute("RoleUser") == null) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>

<h1>Welcome to our website!</h1>
Logged in user: <b>${user}</b>
<br>
<br>
<a href="logout">Logout</a>


<table>
    <tr>
        <td>ID</td>
        <td>NAME</td>
        <td>PRICE</td>
        <td></td>
    </tr>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String query = "select * from product";
        Connection connection = DatabaseConnection.getConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);

        while (resultSet.next()) {
%>
    <tr>
        <td><%=resultSet.getInt("id") %>
        </td>
        <td><%=resultSet.getString("name") %>
        </td>
        <td><%=resultSet.getString("price") %>
        </td>
        <td><a href=buy?id=<%=resultSet.getInt("id") %>>Buy now</a></td>
    </tr>
    <%
        }
        %>
</table>
<%
            resultSet.close();
            statement.close();
            connection.close();
            } catch (Exception e) {
            e.printStackTrace();
        }
    %>

<br><br><br><br>
Your orders
<table>

    <tr>
        <td>NAME</td>
        <td>PRICE</td>
        <td>DATE</td>
    </tr>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String query = "SELECT product.name, product.price, orders.time FROM orders JOIN user on orders.user_id = user.id JOIN product on orders.product_id = product.id WHERE user.userName = '"+sess.getAttribute("user") +"'";
            Connection connection = DatabaseConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
    %>
    <tr>
        <td><%=resultSet.getString("name") %>
        </td>
        <td><%=resultSet.getString("price") %>
        </td>
        <td><%=resultSet.getString("time") %>
        </td>
    </tr>
    <%

        }
    %>
</table>
<%
        resultSet.close();
        statement.close();
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</body>
</html>