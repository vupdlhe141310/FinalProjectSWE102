<%-- 
    Document   : search_menu
    Created on : Oct 31, 2020, 9:54:17 PM
    Author     : DELL
--%>

<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu dọc</title>
<link rel="stylesheet" href="css/category.css" />
</head>
<body>
	<%
		CategoryDAO categoryDAO = new CategoryDAO();
		ArrayList<Category> list = categoryDAO.getList();
		
		String err="";
	%>
	<div class="container">
		<nav>
		<ul class="mcd-menu">
		<li>
		<form accept-charset="utf-8" method="post" action="SearchServlet" name="SearchServlet">
                        <p>
                        <label for="tensp">Product name</label>
                        <br>
                        <input accept-charset="utf-8" type="text"  name="ten_san_pham" style="width:97%">
                        </p>
                        <p>
                        <label for="theloai">Type of Product</label>
                        <br>
                        <select accept-charset="utf-8" name="ten_the_loai" style="width:100%">
                        	<option value="" selected="selected">--Select Type--</option>
                        	<%
				for (Category c : list) {
					
			%>
                        	<option accept-charset="utf-8"  value="<%=c.getTen_the_loai() %>"><%=c.getTen_the_loai() %></option>
                        	<% } %>
                        </select>
                        </p>
                        <input type="submit" value="Search" name="timKiem">
                	</form>
                	</li>
                	<li style="color: red"><%=err%></li>
                	</ul>
		</nav>
	</div>
</body>
</html>
