<%@page import="dao.DamagedDAO"%>
<%@page import="model.ContractDetail"%>
<%@page import="model.DamagedDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Damaged"%>
<%@page import="model.User"%>
<%@page import="model.Contract"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file = "../header.jsp" %>
<title>Error</title>
</head>
<%
	User u = (User)session.getAttribute("nhanvien");
     if(u==null){
         response.sendRedirect("../login.jsp?err=timeout");
     }
      Contract contract = (Contract)session.getAttribute("contractSelect");
      String carId = (String)request.getParameter("carId");
      ArrayList<DamagedDetail> listError = (ArrayList)session.getAttribute("listError");
      ContractDetail carSelect = (ContractDetail)session.getAttribute("carSelect");
      ArrayList<DamagedDetail> listDamaged = new ArrayList<>();
      if(contract != null && carSelect == null){
    	  ArrayList<ContractDetail> listCar = contract.getListCar();
          for(ContractDetail cd : listCar){
        	  if(cd.getId() == Integer.parseInt(carId)){
        		  carSelect = cd;
        		  break;
        	  }
          }
      }
      if(carSelect != null){
    	  session.setAttribute("carSelect", carSelect);
    	  if(carSelect.getDamaged() != null){
    		  listDamaged = carSelect.getDamaged();
    	  }
      }
      DamagedDAO dao = new DamagedDAO();
      ArrayList<Damaged> listDamagedDefault = dao.getDamageds(); 
      session.setAttribute("damagedDefault", listDamagedDefault);
%>
<body class="container">

    <h2 class="mt-4">Error List</h2>

    <table class="table mt-4" id="error-table">
        <thead>
            <tr>
                <th>STT</th>
                <th>Tên Lỗi</th>
                <th>Miêu Tả</th>
                <th>Tiền Đền Bù</th>
                <th>Số Lượng</th>
            </tr>
        </thead>
        <tbody>
        	<% if(listError != null){ %>
        	<% for(int i=0;i<listError.size();i++){ %>
        	<tr>
       			<td><%=(i+1) %></td>
        		<td><%=listError.get(i).getDamaged().getName() %></td>
        		<td><%=listError.get(i).getDes() %></td>
        		<td><%=listError.get(i).getDamaged().getCompensation() %></td>
        		<td><%=listError.get(i).getNumber() %></td>
        	</tr>
        	<%} %>
        	<% } %>
        </tbody>
    </table>
   		  <%
		  	if(request.getParameter("msg") != null){
		  		%><h1>Lỗi <%=request.getParameter("msg") %></h1><%
		  	}
		  %>

    <form class="mt-4" id="add-error-form" action="addError.jsp" method="POST">
        <div class="form-group">
            <label for="error-name">Tên Lỗi:</label>
            <select class="form-control" name="error-select" required>
          	<%
          		for(int i=0;i<listDamagedDefault.size();i++){
          	%>
           	<option value="<%=listDamagedDefault.get(i).getId()%>">
           		<%=listDamagedDefault.get(i).getName()%>
           	</option>
           	<%
           		}
           	%>
                </select>
        </div>

        <div class="form-group">
            <label for="error-description">Miêu Tả:</label>
            <textarea class="form-control" id="error-description" name="error" ></textarea>
        </div>

        <div class="form-group">
            <label for="quantity">Số Lượng:</label>
            <input type="number" class="form-control" id="quantity" name="quantity" required>
        </div>

        <button type="submit" class="btn btn-success" onclick="addError()">Thêm</button>
    </form>

    <h2 class="mt-4">Lỗi sẵn</h2>

    <table class="table mt-4" id="error-table">
        <thead>
            <tr>
                <th>STT</th>
                <th>Tên Lỗi</th>
                <th>Miêu Tả</th>
                <th>Số Lượng</th>
            </tr>
        </thead>
        <tbody>
       	<% if(listDamaged != null){ %>
        	<% for(int i=0;i<listDamaged.size();i++){ %>
        	<tr>
        	    <td><%=(i+1) %></td>
        		<td><%=listDamaged.get(i).getDamaged().getName() %></td>
        		<td><%=listDamaged.get(i).getDes() %></td>
        		<td><%=listDamaged.get(i).getNumber() %></td>
        	</tr>

        	<%} %>
       	<% } %>
        </tbody>
    </table>
  <div class="text-center">
    <a href="selectCar.jsp" type="button" class="btn btn-secondary mr-3">Quay Lại</a>
    <a href="returnCollateral.jsp" class="btn btn-success">Tiếp Tục</a>
  </div>

</body>
</html>