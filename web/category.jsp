<%-- 
    Document   : category
    Created on : Oct 31, 2020, 9:44:46 PM
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
	%>
	<div class="container">
		<nav>
		<ul class="mcd-menu">
			<%
				for (Category c : list) {
					
			%>
			<li><a href="index.jsp?ma_the_loai=<%=c.getMa_the_loai()%>"> <i class="fa fa-home"></i>
					<strong style="color:red"><%=c.getTen_the_loai()%></strong> <small><%=c.getMo_ta()%></small>
			</a></li>
			<%
				}
			%>
		</ul>
		</nav>
	</div>
</body>
</html>
