<%@page import="model.CollateralDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Contract"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file = "../header.jsp" %>
<title>Return Collateral</title>
</head>
<%
User u = (User)session.getAttribute("nhanvien");
if(u==null){
    response.sendRedirect("../login.jsp?err=timeout");
}
Contract contract = (Contract)session.getAttribute("contractSelect");
ArrayList<CollateralDetail> listCollateral = new ArrayList<>();
if(contract != null){
	listCollateral = contract.getListCollateral();
}
%>
<body>
<div class="container asset-container">
    <h2>Danh Sách Tài Sản Cầm Cố</h2>

    <table class="table">
        <thead>
            <tr>
                <th scope="col">TT</th>
                <th scope="col">Tên Tài Sản</th>
                <th scope="col">Số Lượng</th>
            </tr>
        </thead>
        <tbody>
        	<% if(listCollateral != null){ %>
        	<% for(int i =0;i< listCollateral.size();i++){ %>
        		<tr>
        			<td><%=(i+1) %></td>
        			<td><%=listCollateral.get(i).getCollateral().getName() %></td>
        			<td><%=listCollateral.get(i).getNumber() %></td>
        		</tr>
        	<% } %>
        	<% } %>
        </tbody>
    </table>

    <div class="asset-actions">
        <a href="error.jsp" type="button" class="btn btn-secondary mr-3">Quay Lại</a>
    	<a href="doConfirmReturn.jsp?type=1" class="btn btn-success">Trả</a>
    	<a href="doConfirmReturn.jsp?type=0" class="btn btn-warning">Chưa Trả</a>
    </div>
</div>
</body>
</html>