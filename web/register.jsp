<%-- 
    Document   : register
    Created on : Oct 31, 2020, 9:52:47 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/login.css" rel='stylesheet' type='text/css' />
<title>Sign-up</title>
</head>
<body>
	<%
		String err = "";
		if (request.getAttribute("err") != null) {
			err = (String) request.getAttribute("err");
		}
	%>
	<!--/start-login-two-->
	<div class="login-02">
		<div class="two-login  hvr-float-shadow">
			<div class="two-login-head">
				<img src="images/top-note.png" alt="" />
				<h2>Sign-up</h2>
				<lable></lable>
			</div>
			<form action="RegisterServlet" method="post">
				<li style="color: red"><%=err%></li>
				
                                <li><input type="text" class="text" value="" name="username" placeholder="User name"><a href="#" class=" icon2 user2"></a></li>
					
				<li><input type="password" value="" name="password" placeholder="Password"><a href="#" class=" icon2 lock2"></a></li>
				
				<li><input type="date" value="" name="ngaysinh" placeholder="Date of birth"><a href="#" class=" icon2 lock2"></a></li>
				
				<li><input type="text" value="" list="exampleList" name="gioitinh" placeholder="Gender"> 
					<datalist id="exampleList">
					<option value="Male">
					<option value="Female">
					</datalist><a href="#" class=" icon2 lock2"></a></li>
				
				<li><input type="text" value="" name="email" placeholder="Email"><a href="#" class=" icon2 lock2"></a></li>
				
				<li><input type="text" value=""	name="sdt" placeholder="Phone number"><a href="#" class=" icon2 lock2"></a></li>
				
				<li><input type="text" value="" name="diachi" placeholder="Address"><a href="#" class=" icon2 lock2"></a></li>
					
				
				<div class="submit two">
					<input type="submit" value="Sign-up">
				</div>
				<h5>
					<a href="login.jsp">Login</a>
				</h5>
			</form>
		</div>
	</div>
</body>
</html>
