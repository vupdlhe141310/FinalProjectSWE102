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
            <div id="content">

                <div class="left-1">
                    <img
                        src="<%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getHinh_anh()%>"
                        width="200px" height="200px" />
                </div>
                <div class="left-2">
                    <table>
                        <tr class="row1">
                            <td class="col2" colspan="2"
                                style="padding: 10px; color: blue; font-size: 15px; text-transform: uppercase; text-align: center; font-weight: bold"><%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getTen_san_pham()%></td>
                        </tr>
                        <tr class="row2">
                            <td class="col1">Manufacturer:</td>
                            <td class="col2"><%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getHang_san_xuat()%></td>
                        </tr>

                        <tr class="row2">
                            <td class="col1">Price</td>
                            <td class="col2"><%=nf.format(productDAO.getProduct(Integer.parseInt(ma_san_pham)).getGia_ban())%>$</td>
                        </tr>

                        <tr class="row2">
                            <td class="col1">Description</td>
                            <td class="col2"><%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getThong_tin()%>$</td>
                        </tr>

                    </table>
                </div>
                <% if (username != null) {%>
                <div
                    style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 10px; padding: 10px; clear: both;">
                    <a
                        href="#"><img
                            src="images/giohang.png" /></a>
                    <form action="CartServlet" method="post">
                        <input type="number" min="1" value="1" name="soluong"/>
                        <input type="hidden" value="setCart" name="command"/>
                        <input type="hidden" value="<%=ma_san_pham%>" name="ma_san_pham"/>
                        <input type="submit" value="Add to Cart">
                    </form>
                    </br>
                    <form action="Reported.jsp?ma_san_pham=<%=ma_san_pham%>" method="post">
                        <input type='submit' value='Reported'>
                    </form>    
                     
                </div>
                <%} else { %>
                <div
                    style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 10px; padding: 10px; clear: both;">
                    <a href="login.jsp"><img src="images/giohang.png" /></a>
                </div>
                <%}%>


            </div>
            <div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
        </div>
    </body>
</html>
