<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="connection.DatabaseConnection" %><%--
  Created by IntelliJ IDEA.
  User: shy_h
  Date: 12.06.2021
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <link href="resources/mystyle.css" rel="stylesheet" type="text/css">
    <title>Admin Page</title>
</head>

<%
    HttpSession sess = request.getSession(false);
    if(sess.getAttribute("RoleAdmin") == null) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>
<body>
<br>
<br>
<center><h1>Admin's Home</h1></center>
<p style="text-align:right; margin-right: 20%;">Welcome: <b>${user}</b><br>
<a href="logout">Logout</a></p>
<br>
<br>
<br>
<br>
<p style="margin-left: 20%"><b>Users from DB:</b></p>
<p style="margin-left: 20%"><table>
    <tr>
        <td>ID</td>
        <td>NAME</td>
    </tr>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String query = "select * from user where userRole = 2";
            Connection connection = DatabaseConnection.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
    %>
    <tr>
        <td><%=resultSet.getInt("id") %>
        </td>
        <td><%=resultSet.getString("userName") %>
        </td>
        <td><a href=delete?id=<%=resultSet.getInt("id") %>>Delete</a></td>
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
