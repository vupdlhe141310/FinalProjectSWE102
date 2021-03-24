<%-- 
    Document   : index.jsp
    Created on : Oct 31, 2020, 8:43:44 PM
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
        <title>TechMarK</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="css/menu.css" />
        <link rel="stylesheet" href="css/product.css" />
    </head>
    <body>

        <div id="main">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="content">
                    <div id="left"><jsp:include page="category.jsp"></jsp:include></div>
                    <div id="right">
                    <%
                        ProductDAO productDAO = new ProductDAO();

                        ArrayList<Product> list = productDAO.getList();
                        String ma_the_loai = null;
                        if (request.getParameter("ma_the_loai") != null) {
                            ma_the_loai = request.getParameter("ma_the_loai");
                        }
                        NumberFormat nf = NumberFormat.getInstance();
                        nf.setMinimumFractionDigits(0);
                    %>
                    <div id="site-wrapper" style="float: left">
                        <ul class="products homepage">
                            <%
                                if (ma_the_loai != null) {
                                    for (Product p : productDAO.getListByCategory(Integer.parseInt(ma_the_loai))) {
                            %>

                            <li class="preorder"><span class="tagimg "> </span> <a
                                    href="detail.jsp?ma_san_pham=<%=p.getMa_san_pham()%>">  
                                    <img src="<%=p.getHinh_anh()%>" width=" 250px" height="250px" />
                                    <h3><%=p.getTen_san_pham()%></h3>
                                    <h4>
                                        Price:
                                        <%=nf.format(p.getGia_ban())%>$
                                    </h4> 
                                    <p class="info">
                                        <span>Manufacturer: <%=p.getHang_san_xuat()%>
                                        </span> <span>Price: <%=nf.format(p.getGia_ban())%>$
                                        </span> <span>Information: <%=p.getThong_tin()%></span>>
                                    </p>
                                </a></li>

                            <%
                                }
                            } else {
                                for (Product p : productDAO.getList()) {
                            %>

                            <li class="preorder"><span class="tagimg "></span> <a
                                    href="detail.jsp?ma_san_pham=<%=p.getMa_san_pham()%>">  
                                    <img src="<%=p.getHinh_anh()%>" width=" 250px" height="250px" />
                                    <h3><%=p.getTen_san_pham()%></h3>
                                    <h4>
                                        Price:
                                        <%=nf.format(p.getGia_ban())%>$

                                    </h4> 

                                    <p class="info">
                                        <span>Manufacturer: <%=p.getHang_san_xuat()%></span> 
                                        <span>Price:<%=nf.format(p.getGia_ban())%>$</span> 
                                        <span>Information: <%=p.getThong_tin()%></span>
                                    </p>
                                </a></li>
                                <%
                                        }
                                    }
                                %>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>
        </div>

    </body>
</html>
