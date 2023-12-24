<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file = "../header.jsp" %>
<title>Trang chủ nhân viên</title>
</head>
<body>
<%
	session.removeAttribute("listContract");
	session.removeAttribute("contractSelect");
	session.removeAttribute("carSelect");
	session.removeAttribute("listError");
	User u = (User)session.getAttribute("nhanvien");
     if(u==null){
         response.sendRedirect("../login.jsp?err=timeout");
     }else{
%>
<h2> Trang chủ nhân viên </h2>
<h3> Xin chào <%=u.getUsername() %></h3>
<%
	if(request.getParameter("success") != null){
		%><h1 style="color:green">Trả xe thành công</h1> <% 
	}else if(request.getParameter("err") != null){
		%><h1 style="color:red">Trả xe thất bại</h1> <%
	}
%>
<a class="btn btn-info" href="searchContract.jsp">
	Trả xe
</a>
<a href="../login.jsp" class="btn btn-danger">Logout</a>
</body>
<% } %>
</html>