<%-- 
    Document   : update_user
    Created on : Oct 31, 2020, 9:57:04 PM
    Author     : DELL
--%>

<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/login.css" rel='stylesheet' type='text/css' />
<title>Update Information</title>
</head>
<body>
	<%
		String err = "";
		if (request.getAttribute("err") != null) {
			err = (String) request.getAttribute("err");
		}
		String username= request.getParameter("username");
		UserDAO userDAO = new UserDAO();
		User u= userDAO.getUser(username);
	%>

	<!--/start-login-two-->
	<div class="login-02">
		<div class="two-login  hvr-float-shadow">
			<div class="two-login-head">
				<img src="images/top-note.png" alt="" />
				<h2>Update Information</h2>
				<lable></lable>
			</div>
			<form action="UpdateUser" method="post">
				<li style="color: red"><%=err%></li>
				User name
				<li><input type="text" class="text"
					value="<%=u.getUsername()%>" readonly name="username"><a
					href="#" class=" icon2 user2"></a></li>
                                Password
                                <li><input type="password" value="<%=u.getPassword()%>" 
					name="password"><a href="#" class=" icon2 lock2"></a></li>
				Date of birth
				<li><input type="date" value="<%=u.getNgaysinh()%>"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '<%=u.getNgaysinh() %>';}"
					name="ngaysinh"><a href="#" class=" icon2 lock2"></a></li>
				Gender
				<li><input type="text" value="<%=u.getGioitinh() %>"
					list="exampleList" onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '<%=u.getGioitinh() %>';}"
					name="gioitinh"> <datalist id="exampleList">
					<option value="Nam">
					<option value="Nữ">
					</datalist><a href="#" class=" icon2 lock2"></a></li>
				Email
				<li><input type="text" value="<%= u.getEmail() %>" onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '<%=u.getEmail() %>';}" name="email"><a
					href="#" class=" icon2 lock2"></a></li>
				Phone number
				<li><input type="text" value="<%=u.getSdt() %>"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '<%=u.getSdt() %>';}" name="sdt"><a
					href="#" class=" icon2 lock2"></a></li>
				Address
				<li><input type="text" value="<%=u.getDiachi() %>"
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = '<%=u.getDiachi() %>';}"
					name="diachi"><a href="#" class=" icon2 lock2"></a></li>

				
				<div class="submit two">
					<input type="submit" value="Done">
					<input type="hidden" value="<%=u.getUser_id()%>" name="id">
				</div>
				<h5>
					<a href="index.jsp">Back</a>
				</h5>
			</form>
		</div>
	</div>
</body>
</html>
