<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link href="resources/mystyle.css" rel="stylesheet" type="text/css">
    <title>Login</title>
    <script>
        function validate()
        {
            var username = document.form.username.value;
            var password = document.form.password.value;

            if (username==null || username=="")
            {
                alert("Username cannot be blank");
                return false;
            }
            else if(password==null || password=="")
            {
                alert("Password cannot be blank");
                return false;
            }
        }
    </script>
</head>
<body>
<%--
<jsp:useBean id="beanUser" class="beans.UserBean" />
<jsp:setProperty name="beanUser" property="user" value="admin" />
<jsp:setProperty name="beanUser" property="password" value="123" />
<jsp:setProperty name="beanUser" property="id" value="1" />
--%>
<p style="color: crimson">${error}</p>
<br><br><br><br><br><br>
<center><h1>LOGIN</h1></center>
<center><form name="form" action="login" method="post" onsubmit="return validate()">
    <input type="text" name="username" width="30" placeholder="User Name"/><br>
    <input  type="password" name="password" width="30" placeholder="Password"/> <br>
    <span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
            : request.getAttribute("errMessage")%></span>
    <input type="submit" value="LogIn">
</form>
<h4>Don't have an account? <a href="signup.jsp">Sign up</a></h4>
</center>


</body>
</html>