<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
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
<h4>Login</h4>
<form name="form" action="login" method="post" onsubmit="return validate()">
    user name: <input type="text" name="username" width="25" /><br>
    password: <input  type="password" name="password" width="25"/> <br>
    <span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
            : request.getAttribute("errMessage")%></span>
    <input type="submit" value="Go">
</form>
<br>
<br>
<a href="signup.jsp">sign up</a>

<p style="color: crimson">${error}</p>

</body>
</html>