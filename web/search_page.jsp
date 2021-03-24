<%-- 
    Document   : search_page
    Created on : Oct 31, 2020, 9:55:51 PM
    Author     : DELL
--%>

<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/menu.css" />
        <link rel="stylesheet" href="css/product.css" />
    </head>
    <body>

        <div id="main">
            <jsp:include page="menu.jsp"></jsp:include>
            <div id="content">
                <div id="left"><jsp:include page="search_menu.jsp"></jsp:include></div>
                    <div id="right">
                    <%
                        ProductDAO productDAO = new ProductDAO();
                        ArrayList<Product> list = productDAO.getList();

                        String ten_san_pham = "";
                        String ten_the_loai = "";
                        if (request.getParameter("ten_the_loai") != null && request.getParameter("ten_san_pham") != null) {
                            ten_the_loai = request.getParameter("ten_the_loai");
                            ten_san_pham = request.getParameter("ten_san_pham");
                        }
                        NumberFormat nf = NumberFormat.getInstance();
                        nf.setMinimumFractionDigits(0);

                        String err = "";
                        if (request.getAttribute("err") != null) {
                                        err = (String) request.getAttribute("err");%>
                    <h3><%=err%></h3>
                    <% } %>

                    <% if (productDAO.searchList(ten_san_pham, ten_the_loai).size() == 0 && err == "") { %>
                    <h3>No matching products found</h3>
                    <% } %>
                    <div id="site-wrapper" style="float: left">
                        <ul class="products homepage">

                            <%
                                if (ten_the_loai != null || ten_san_pham != null) {
                                    for (Product p : productDAO.searchList(ten_san_pham, ten_the_loai)) {
                            %>

                            <li class="preorder"><span class="tagimg "> </span> <a
                                    href="detail.jsp?ma_san_pham=<%=p.getMa_san_pham()%>"> <img src="<%=p.getHinh_anh()%>" width=" 250px" height="250px" />
                                    <h3><%=p.getTen_san_pham()%></h3>
                                    <h4>
                                        Price:<%=nf.format(p.getGia_ban())%>$
                                    </h4> 

                                    <p class="info">
                                        <span>Manufacturer: <%=p.getHang_san_xuat()%>
                                        </span> <span>Price: <%=nf.format(p.getGia_ban())%>$
                                        </span> <span>Information: <%=p.getThong_tin()%>
                                    </p>
                                </a></li>

                            <%
                                                    }
                                                } else { %>
                            <h3> Enter information of product </h3>
                            <% }
                            %>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
        </div>

    </body>
</html>
