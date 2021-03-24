<%-- 
    Document   : product.jsp
    Created on : Oct 31, 2020, 9:48:23 PM
    Author     : DELL
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
        <link rel="stylesheet" href="css/product.css" />
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/menu.css" />
        <style>
            .pagination {
                display: inline-block;
            }
            .pagination a {
                color: black;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
            }
            .pagination a.active {
                background-color: #4CAF50;
                color: white;
            }
            .pagination a:hover:not(.active) {
                background-color: chocolate;
            }

        </style>
    </head>
    <body>
        <jsp:useBean id="a" class="dao.ProductDAO" scope="request"></jsp:useBean>
            <div id="main">
            <jsp:include page="menu.jsp"></jsp:include>

                <div id="content_center" >

                <%
                    NumberFormat nf = NumberFormat.getInstance();
                    nf.setMinimumFractionDigits(0);
                %>

                <div id="site-wrapper-p" style="float: left; margin-left: 120px">
                    <ul class="products homepage">

                        <%
                            ArrayList<Product> list = (ArrayList<Product>) request.getAttribute("listP");
                            for (Product p : list) {
                        %>

                        <li class="preorder"><span class="tagimg"></span> <a href="detail.jsp?ma_san_pham=<%=p.getMa_san_pham()%>"> 
                                <img src="<%=p.getHinh_anh()%>" width=" 250px" height="250px" />
                                <h3><%=p.getTen_san_pham()%></h3>
                                <h4>
                                    Price:
                                    <%=nf.format(p.getGia_ban())%>$
                                </h4> 

                                <p class="info">
                                    <span>Manufacturer:: <%=p.getHang_san_xuat()%></span> 
                                    <span>Price:<%=nf.format(p.getGia_ban())%>$</span> 
                                    <span>Information: <%=p.getThong_tin()%></span>
                                </p>
                            </a></li>

                        <%
                            }

                        %>
                    </ul>


                </div>


                <div id="footer">
                    <ul>

                        <c:forEach begin="1" end="${a.totalPage()}" var="i">
                            <li class="pagination"><a class="page-link" href="PagingServlet?index=${i}">${i}</a></li>
                            </c:forEach>


                    </ul>


                </div>


                </body>
                </html>
