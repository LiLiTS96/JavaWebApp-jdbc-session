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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Hello!</title>
</head>
<body>

<%
    HttpSession sess = request.getSession(false);
    if(sess.getAttribute("user") == null) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
%>

<h1>Welcome to our website!</h1>
Logged in user: <b>${user}</b>
<br>
<br>
<a href="logout">Logout</a>


<table border="2">
    <tr>
        <td>ID</td>
        <td>NAME</td>
    </tr>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    String query="select * from reguser";
    Connection connection = DatabaseConnection.getConnection();
    Statement statement=connection.createStatement();
    ResultSet resultSet=statement.executeQuery(query);

    while(resultSet.next())
    {
%>
    <tr>
    <td><%=resultSet.getInt("id") %></td>
    <td><%=resultSet.getString("userName") %></td></tr>
        <%

}
%>
</table>
<%
        resultSet.close();
        statement.close();
        connection.close();
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>

</body>
</html>
