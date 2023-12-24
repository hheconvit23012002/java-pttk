<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file = "../header.jsp" %>
<title>Trang chủ khach hàng</title>
</head>
<%
	User u = (User)session.getAttribute("khachhang");
     if(u == null){
         response.sendRedirect("../login.jsp?err=timeout");
     }else{
%>
<body>

<h2> Trang chủ khách hàng </h2>
<h3> Xin chào <%=u.getUsername() %></h3>
<%
	if(request.getParameter("success") != null){
		%><h1 style="color:green">Thuê xe thành công</h1> <% 
	}else if(request.getParameter("err") != null){
		%><h1 style="color:red">Thuê xe thất bại</h1> <%
	}
%>
<a class="btn btn-info" href="./searchCar.jsp">
	Thuê xe
</a>
<a href="../login.jsp" class="btn btn-danger">Logout</a>
</body>
<% } %>
</html>