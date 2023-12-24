<%@page import="model.Car"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file = "../header.jsp" %>
<title>SearchCar</title>
</head>
<body>
<%
	User u = (User)session.getAttribute("khachhang");
     if(u==null){
         response.sendRedirect("../login.jsp?err=timeout");
     }
     ArrayList<Car> listCar = new ArrayList<Car>();
     listCar = (ArrayList)session.getAttribute("listCar");
     if(listCar == null){
    	 listCar = new ArrayList<>();
     }
%>
<div class="container mt-5">
  <h2 class="text-center">Thuê Xe</h2>
  <%
  	if(request.getParameter("msg") != null){
  		%><h1>Lỗi <%=request.getParameter("msg") %></h1><%
  	}
  %>
  
  <!-- Form Thuê Xe -->
  <form action="doSearchCar.jsp">
    <div class="form-row">
      <div class="col-md-4">
        <label for="startDate">Ngày Bắt Đầu:</label>
        <input type="date" class="form-control" id="startDate" name="startDate" >
      </div>
      <div class="col-md-4">
        <label for="endDate">Ngày Kết Thúc:</label>
        <input type="date" class="form-control" id="endDate" name="endDate" required>
      </div>
      <div class="col-md-4">
        <label for="carType">Chọn Xe:</label>
        <select class="form-control" id="type" name="type" required>
          <option value="">Chọn loại xe</option>
          <option value="4 chỗ">4 chỗ</option>
          <option value="7 chỗ">7 chỗ</option>
        </select>
      </div>
    </div>

    <button type="submit" class="btn btn-primary mt-3">
      <i class="fas fa-search"></i> Tìm Kiếm
    </button>
  </form>

  <!-- Bảng Danh Sách Xe -->
  <table class="table mt-5">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Biển Số</th>
        <th scope="col">Kiểu</th>
        <th scope="col">Giá/NGày</th>
        <th scope="col">Màu</th>
        <th scope="col">Hãng Xe</th>
        <th scope="col">Chọn</th>
      </tr>
    </thead>
    <tbody>
    <%
    if(listCar != null){
    for(int i=0;i<listCar.size();i++){
    %>
    <tr>
    <td><%=(i+1) %></td>
    <td><%=listCar.get(i).getLicenseOlate() %></td>
    <td><%=listCar.get(i).getType() %></td>
    <td><%=listCar.get(i).getPrice() %></td>
    <td><%=listCar.get(i).getColor() %></td>
    <td><%=listCar.get(i).getManufacturer() %></td>
    <%
    	String urlSelectCar = "doSelectCar.jsp?startDate=" + request.getParameter("startDate")+"&endDate=" + request.getParameter("endDate")+"&car=" + listCar.get(i).getId();
    %>
    <td><a href="<%=urlSelectCar%>">Chọn</a></td>
    </tr>
    <% } %>
    <% } %>
    </tbody>
  </table>

  <!-- Nút Quay Lại và Tiếp Tục -->
  <div class="text-center">
    <a href="customerHome.jsp" type="button" class="btn btn-secondary mr-3">Quay Lại</a>
    <a href="preConfirm.jsp" class="btn btn-success">Tiếp Tục</a>
  </div>

</div>

</body>
</html>