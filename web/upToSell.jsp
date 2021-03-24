<%-- 
    Document   : detail
    Created on : Oct 31, 2020, 9:45:54 PM
    Author     : DELL
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product detail</title>
        <link rel="stylesheet" href="css/detail.css" />
        <link rel="stylesheet" href="css/menu.css" />
        <style type="text/css">
            #main {
                width: 1060px;
                padding: 0;
                margin-left: auto;
                margin-right: auto;
            }

            #head {
                height: 200px;
                background-color: #F5F5F5;
                border: 1px solid #CDCDCD;
                margin-bottom: 5px;
                margin-top: 5px;
            }

            #head-link {
                height: 50px;
                line-height: 30px;
                border: 1px solid #CDCDCD;
                background-color: #F5F5F5;
                margin-bottom: 5px;
                clear: both;
            }

            #content {
                width: 1060px;
                min-height: 430px;
                border: 1px solid #CDCDCD;
                float: left;
                margin-bottom: 5px;
                clear: both;
            }

            #footer {
                height: 50px;
                clear: both;
                border: 1px solid #CDCDCD;
                background-color: #F8F8FF;
                margin-bottom: 5px;
            }
        </style>
    </head>
    <body>

        <%

            String ma_san_pham = "";
            if (request.getParameter("ma_san_pham") != null) {
                ma_san_pham = request.getParameter("ma_san_pham");
            }

            ProductDAO productDAO = new ProductDAO();
            NumberFormat nf = NumberFormat.getInstance();
            nf.setMinimumFractionDigits(0);
        %>
        <div id="main">
            <jsp:include page="menu.jsp"></jsp:include>
            <%
                String username = null;
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("username")) {
                            username = cookie.getValue();
                        }
                    }
                }
            %>
            <div id="content"  style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 10px; padding: 10px; clear: both;">
                <form action="upToSeller" method="post"> 
                    <h2 style="color:red ;text-align: center" > Why you want to be a seller ?</h2>
                    <input type="text" name="reason" style="text-align: center">
                    <h2 style="color:red ;text-align: center"> What type of product you going to sell ?</h2>
                    <input type="text" name="type" style="text-align: center"></br>
                    </br><input type="submit" value="Send request to Admin">
                </form>
            </div>
            <div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
        </div>
    </body>
</html>
