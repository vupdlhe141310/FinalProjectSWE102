<%-- 
    Document   : Reported
    Created on : Mar 14, 2021, 1:50:24 AM
    Author     : ADMIN
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reported</title>
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
            <div id="head">
                <img src="images/banner.png" width="100%" height="100%" />
            </div>
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

                if (username != null) {
            %>
            <div id="head-link">
                <div id='menungang'>
                    <ul>
                        <li class='last'><a href="index.jsp"><span>Home Page</span></a></li>
                        <li class='last'><a href="PagingServlet"><span>Product</span></a></li>
                        <li class='last'><a href="cart.jsp"><span>Cart</span></a></li>
                        <li class='last'><a href="search_page.jsp"><span>Search</span></a></li>
                        <li class='last' style="float: right;"><a href="LogoutServlet"><span>Logout</span></a></li>
                        <li class='last' style="float: right;"><a href="update_user.jsp?username=<%=username%>"><span><%=username%></span></a></li>

                    </ul>
                </div>
            </div>
            <%
            } else {
            %>
            <div id="head-link">
                <div id='menungang'>
                    <ul>
                        <li class='last'><a href="index.jsp"><span>Home Page</span></a></li>
                        <li class='last'><a href="PagingServlet"><span>Product</span></a></li>
                        <li class='last'><a href="search_page.jsp"><span>Search</span></a></li>
                        <li class='last' style="float: right;"><a href="register.jsp"><span>Sign-in</span></a></li>
                        <li class='last' style="float: right;"><a href="login.jsp"><span>Login</span></a></li>
                    </ul>
                </div>
            </div>
            <%
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

                        

                    </table>
                </div>
                <% if (username != null) {%>
                <div
                    style="margin-left: auto; margin-right: auto; text-align: center; margin-top: 10px; padding: 10px; clear: both;">
                   
                        </br>
                        <form action="ReportedProServlet?ma_san_pham=<%=ma_san_pham%>" method="post">
                            <h3 style="color:red ">Why you report this product ?</h3></br>
                            <input type='text' name='ReportContent'>
                            <input type='submit' value='Report to Admin'>
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
