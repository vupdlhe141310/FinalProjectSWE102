<%-- 
    Document   : login
    Created on : Oct 31, 2020, 9:47:33 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/login.css" rel='stylesheet' type='text/css' />
        <title>Login</title>
    </head>
    <body>
        <%
            String err = "";
            if (request.getAttribute("err") != null) {
                err = (String) request.getAttribute("err");
            }
        %>
        <!--/start-login-one-->
        <div class="login-01">
            <div class="one-login  hvr-float-shadow">
                <div class="one-login-head">
                    <img src="images/top-lock.png" alt="" />
                    <h1>LOGIN</h1>

                    <span></span>
                </div>
                <form action="../../project/LoginServlet" method="post">
                    
                    <li style="color: red"><%=err%></li>

                    <li><input type="text" class="text" value="" name="username" placeholder="User name"><a href="#"  class=" icon user"></a></li>

                    <li><input type="password" value="" name="password" placeholder="Password"><a href="#"  class=" icon lock"></a></li>

                    <div class="submit">
                        <input type="submit" value="SIGN IN">
                    </div>
                    <div class="social-icons">
                        <p>Log in with:</p>
                        <ul class="soc_icons2">
                            <li class="pic"><a href="#"><i class="icon_4"></i></a></li>
                            <li class="pic"><a href="#"><i class="icon_5"></i></a></li>
                            <li class="pic"><a href="#"><i class="icon_6"></i></a></li>
                            <div class="clear"></div>
                        </ul>
                    </div>
                    <h5>
                        Don't have an account?<a href="register.jsp"> Sign-up </a>
                    </h5>
                </form>
            </div>
        </div>

    </body>
</html>
