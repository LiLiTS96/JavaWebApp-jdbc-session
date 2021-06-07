<%--
  Created by IntelliJ IDEA.
  User: shy_h
  Date: 04.06.2021
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sing up</title>
    <script>
        function validate()
        {
            var username = document.form1.username.value;
            var password = document.form1.password.value;
            var conpassword= document.form1.conpassword.value;

            if (username==null || username=="")
            {
                alert("Username can't be blank");
                return false;
            }
            else if(password.length<4)
            {
                alert("Password must be at least 4 characters long.");
                return false;
            }
            else if (password!=conpassword)
            {
                alert("Confirm Password should match with the Password");
                return false;
            }
        }
    </script>
</head>
<body>
<h4>Sign up</h4>
<form name="form1" action="signup" method="post" onsubmit="return validate()">
    user name: <input type="text" name="username" width="25" /><br>
    password: <input  type="password" name="password" width="25"/> <br>
    confirm password: <input  type="password" name="conpassword" width="25"/> <br>
    <span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
            : request.getAttribute("errMessage")%></span>
    <input type="submit" value="Register">
</form>
<br>
<a href="login.jsp">login</a>

<p style="color: crimson">${error}</p>
</body>
</html>
