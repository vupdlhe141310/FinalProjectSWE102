<%-- 
    Document   : Aloooooooo
    Created on : Mar 16, 2021, 10:03:35 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <c:forEach items="${listP}" var="o">
        <p>${o.ma_san_pham}</p>
        <p>${o.li_do}</p>
    </c:forEach>
    </body>
</html>
