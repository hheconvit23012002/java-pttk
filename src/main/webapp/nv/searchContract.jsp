<%@page import="dao.ContractDAO"%>
<%@page import="model.Contract"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file = "../header.jsp" %>
<title>Search Contract</title>
</head>
<%
	User u = (User)session.getAttribute("nhanvien");
     if(u==null){
         response.sendRedirect("../login.jsp?err=timeout");
     }
      ArrayList<Contract> listContract = (ArrayList)session.getAttribute("listContract");
      if(listContract == null){
     	 listContract = new ArrayList<>();
      }
%>
<body>
<div class="container">
    <h2>Contract Search</h2>
      <%
	  	if(request.getParameter("msg") != null){
	  		%><h1>Lỗi <%=request.getParameter("msg") %></h1><%
	  	}
	  %>

    <form id="search-form" action="doSearchContract.jsp">
        <div class="form-group">
            <label for="contract-id">Contract ID:</label>
            <input type="text" class="form-control" id="contract-id" name="contract-id" placeholder="Enter contract ID">
        </div>

        <div class="form-group">
            <label for="customer-name">Customer Name:</label>
            <input type="text" class="form-control" id="customer-name" name="customer-name" placeholder="Enter customer name">
        </div>

        <button type="submit" class="btn btn-success">Search</button>
    </form>

    <table class="table" id="contract-table">
        <thead>
        <tr>
            <th>TT</th>
            <th>Mã Hợp Đồng</th>
            <th>Tên Khách Hàng</th>
            <th>Email</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <% if(listContract != null){ %>
        	<% for(int i=0;i<listContract.size();i++){ %>
        		<tr>
        			<td><%=(i+1) %></td>
        			<td><%=listContract.get(i).getId() %></td>
        			<td><%=listContract.get(i).getUser().getUsername() %></td>
        			<td><%=listContract.get(i).getUser().getEmail() %></td>
        			<td>
        				<a href="selectCar.jsp?contractId=<%=listContract.get(i).getId() %>">Chon</a>
        			</td>
        		</tr>
        	<% } %>
        <%} %> 
        </tbody>
    </table>
</div>
    <a href="staffHome.jsp" type="button" class="btn btn-secondary mr-3">Quay Lại</a>
</body>
</html>