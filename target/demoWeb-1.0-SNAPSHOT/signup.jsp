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
    <link href="resources/mystyle.css" rel="stylesheet" type="text/css">
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
<p style="color: crimson">${error}</p>
<br><br><br><br><br><br>
<center><h1>SIGN UP</h1></center>
<center><form name="form1" action="signup" method="post" onsubmit="return validate()">
    <input type="text" name="username" width="30" placeholder="User Name"/><br>
    <input  type="password" name="password" width="30" placeholder="Password"/> <br>
    <input  type="password" name="conpassword" width="30" placeholder="Repeat password"/> <br>
    <span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
            : request.getAttribute("errMessage")%></span>
    <input type="submit" value="Register">
</form>
<h4>Already have an account? <a href="login.jsp">Login</a></h4>
</center>

</body>
</html>
