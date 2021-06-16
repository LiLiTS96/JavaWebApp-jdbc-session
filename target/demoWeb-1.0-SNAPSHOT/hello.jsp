<%@ page import="connection.DatabaseConnection" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: shy_h
  Date: 04.06.2021
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <link href="resources/mystyle.css" rel="stylesheet" type="text/css">
    <title>Hello user!</title>
</head>
<body>

<%
    HttpSession sess = request.getSession(false);
    if(sess.getAttribute("RoleUser") == null) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>
<br>
<br>
<center><h1>Welcome to our website!</h1></center>
<p style="text-align:right; margin-right: 20%;">Logged in user: <b>${user}</b><br>
<a href="logout">Logout</a></p>
<br>
<br>
<br>
<br>
<center><table>
    <tr>
        <td>ID</td>
        <td>NAME</td>
        <td>PRICE</td>
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
</table></center>
<%
            resultSet.close();
            statement.close();
            connection.close();
            } catch (Exception e) {
            e.printStackTrace();
        }
    %>

<br><br><br><br>
<p style="margin-left: 20%"><b>Your orders</b></p>
<p style="margin-left: 20%"> <table>

    <tr>
        <td>NAME</td>
        <td>PRICE</td>
        <td>DATE</td>
    </tr>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String query = "SELECT product.name, product.price, orders.time FROM orders JOIN user on orders.user_id = user.id JOIN product on orders.product_id = product.id WHERE user.userName = '"+sess.getAttribute("user") +"' order by time desc ";
            Connection connection = DatabaseConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            DateFormat df = new SimpleDateFormat("dd-MM-yyyy 'at' HH:mm:ss");
            java.util.Date date = null;
            while (resultSet.next()) {
                Timestamp timestamp = resultSet.getTimestamp("time");
                if (timestamp != null)
                    date = new java.util.Date(timestamp.getTime());
    %>
    <tr>
        <td><%=resultSet.getString("name") %>
        </td>
        <td><%=resultSet.getString("price") %>
        </td>
        <td><%=df.format(date) %>
        </td>
    </tr>
    <%

        }
    %>
</table></p>
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