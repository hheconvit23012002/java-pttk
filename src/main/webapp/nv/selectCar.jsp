<%@page import="model.ContractDetail"%>
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
<title>Select Car</title>
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
      String contractId = (String)request.getParameter("contractId");
      Contract contractSelect = null;
      if(listContract != null){
          for(Contract contract : listContract){
        	  if(Integer.parseInt(contractId) == contract.getId()){
        		  contractSelect = contract;
        		  break;
        	  }
          }
      }
      if(contractSelect != null){
    	  session.setAttribute("contractSelect", contractSelect);
      }
%>
<body class="container">

    <h2 class="mt-4">Car List</h2>

    <table class="table mt-4" id="vehicle-table">
        <thead>
            <tr>
                <th>TT</th>
                <th>Hãng Xe</th>
                <th>Biển Số</th>
                <th>Loại</th>
                <th>Ngày Thuê</th>
                <th>Ngày Trả</th>
                <th>Giá</th>
                <th>Tình trạng</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <% if(contractSelect != null){ %>
        <% for(int i=0;i<contractSelect.getListCar().size() ; i++){ %>
        	<tr>
        		<td><%=(i+1) %></td>
        		<td><%=contractSelect.getListCar().get(i).getCar().getManufacturer() %></td>
        		<td><%=contractSelect.getListCar().get(i).getCar().getLicenseOlate() %></td>
        		<td><%=contractSelect.getListCar().get(i).getCar().getType() %></td>
        		<td><%=contractSelect.getListCar().get(i).getStartDate() %></td>
        		<td><%=contractSelect.getListCar().get(i).getEndDate() %></td>
        		<td><%=contractSelect.getListCar().get(i).getPrice() %></td>
        		<td><%=contractSelect.getListCar().get(i).getIsReturn() == 0 ? "chưa tra" : "da tra" %></td>
        		<td>
        		<% if(contractSelect.getListCar().get(i).getIsReturn() == 0) { %>
        			<a href="error.jsp?contractId=<%=contractId %>&carId=<%=contractSelect.getListCar().get(i).getId()%>">Chọn</a>
        		<% } %>
        		</td>
        	</tr>
        <%  } %>
        <% } %>
        </tbody>
    </table>
        <a href="staffHome.jsp" type="button" class="btn btn-secondary mr-3">Quay Lại</a>

</body>
</html>