<%-- 
    Document   : cart
    Created on : Oct 31, 2020, 9:43:01 PM
    Author     : DELL
--%>

<%@page import="model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link rel="stylesheet" href="css/cart.css" />
        <link rel="stylesheet" href="css/menu.css" />
        <link rel="stylesheet" href="css/main.css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" />
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
        <div id="main">
            <jsp:include page="menu.jsp"></jsp:include>


                <div class="shopping-cart">

                    <div class="column-labels">
                        <label class="product-image">Image</label> <label
                            class="product-details">Product</label> <label
                            class="product-price">Price</label> <label
                            class="product-quantity">Quantity</label><label
                            class="product-line-price">Total</label>
                    </div>
                    <%
                        ProductDAO productDAO = new ProductDAO();

                        NumberFormat nf = NumberFormat.getInstance();
                        nf.setMinimumIntegerDigits(0);
                        double total = 0;
                        ArrayList<Cart> cart = null;
                        if (session.getAttribute("cart") != null) {
                            cart = (ArrayList<Cart>) session.getAttribute("cart");
                        }
                    %>
                    <%
                        if (cart != null) {
                            for (Cart c : cart) {
                                total = total + (c.getQuantity() * productDAO.getProduct(c.getP().getMa_san_pham()).getGia_ban());
                    %>
                    <div class="product">
                        <div class="product-image">
                            <img
                                src="<%=productDAO.getProduct(c.getP().getMa_san_pham()).getHinh_anh()%>">
                        </div>
                        <div class="product-details">
                            <div class="product-title">
                                <%=productDAO.getProduct(c.getP().getMa_san_pham()).getTen_san_pham()%>
                            </div>
                            <p class="product-description"></p>
                        </div>
                        <div class="product-price"><%=nf.format(productDAO.getProduct(c.getP().getMa_san_pham()).getGia_ban())%>$

                        </div>
                        <div class="product-quantity cart_quantity_button">
                            <a class="cart_quantity_up" href="CartServlet?command=deleteCart&ma_san_pham=<%=c.getP().getMa_san_pham()%>"> - </a>
                            <input class="cart_quantity_input" type="number" value="<%=c.getQuantity()%>" disabled="disabled"/>
                            <a class="cart_quantity_up" href="CartServlet?command=addCart&ma_san_pham=<%=c.getP().getMa_san_pham()%>"> + </a>
                        </div>
                            <div class="product-line-price" style="text-align: right"><%=nf.format(productDAO.getProduct(
                                                c.getP().getMa_san_pham()).getGia_ban() * c.getQuantity())%>$


                            <a href="CartServlet?command=removeCart&ma_san_pham=<%=c.getP().getMa_san_pham()%>"><img style="margin-left: 10px" src="images/delete.png"></a>
                        </div>

                    </div>
                    <%
                            }
                        }
                    %>
                    <div class="totals">
                        <div class="totals-item">
                            <label>Total Bill</label>
                            <div class="totals-value" id="cart-subtotal"><%=nf.format(total)%>$

                            </div>
                        </div>
                    </div>
                    <%if (cart.size() > 0) { %>

                    <a class="checkout"  style="text-decoration: none;">Pay</a>
                    <%} else { %>

                    <a class="checkout" href="PagingServlet" style="text-decoration: none;">Pay</a>
                    <%}%>
                </div>

            </div>
            <!--<div id="footer"><jsp:include page="footer.jsp"></jsp:include></div>-->
        </div>
    </body>
</html>
