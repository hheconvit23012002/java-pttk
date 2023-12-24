<%@page import="model.Car"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="model.CollateralDetail"%>
<%@page import="model.Collateral"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file = "../header.jsp" %>
<title>Confirm</title>
</head>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat newFormat = new SimpleDateFormat("dd-MM-yyyy");
User u = (User)session.getAttribute("khachhang");
ArrayList<String> listDateRental = (ArrayList)session.getAttribute("dateRental");
if(u == null){
    response.sendRedirect("../login.jsp?err=timeout");
}
else if(listDateRental == null){
	listDateRental = new ArrayList<>();
	response.sendRedirect("searchCar.jsp?msg=notCarSelected");
}
ArrayList<CollateralDetail> collateralSelect = (ArrayList)session.getAttribute("collateralSelect");
if(collateralSelect == null){
	collateralSelect = new ArrayList<CollateralDetail>();
}
ArrayList<Collateral> listCollateral = (ArrayList)session.getAttribute("collateral"); 
%>
<body>

    <div class="container mt-5">
    
        <h2 class="text-center">Xác Nhận Thuê Xe</h2>

        <!-- Bảng Danh Sách Xe -->
        <table class="table mt-4">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Biển Số</th>
                    <th scope="col">Kiểu</th>
                    <th scope="col">Giá/NGày</th>
                    <th scope="col">Màu</th>
                    <th scope="col">Hãng Xe</th>
                    <th scope="col">Ngày thuê</th>
                </tr>
            </thead>
            <tbody>
                <!-- Dữ liệu danh sách xe sẽ được điền ở đây -->
                <%
                	if(listDateRental != null){
                	for(String dateRental : listDateRental){
                		ArrayList<Car> carSelect = (ArrayList)session.getAttribute(dateRental);
                		String[] se = dateRental.split("\\.");
                     	
                        Date sr = sdf.parse(se[0]);
                    	Date er = sdf.parse(se[1]);
                %>
                	<% for(int i=0;i<carSelect.size();i++){ %>
                		<tr>
                			<td><%=(i+1) %></td>
                			<td><%=carSelect.get(i).getLicenseOlate() %></td>
                			<td><%=carSelect.get(i).getType() %></td>
                			<td><%=carSelect.get(i).getPrice() %></td>
                			<td><%=carSelect.get(i).getColor() %></td>
                			<td><%=carSelect.get(i).getManufacturer() %></td>
                			<td><%="Từ " + newFormat.format(sr) + " Đến " + newFormat.format(er) %></td>
                		</tr>
                	<% } %>
                <% }
               	} %>
            </tbody>
        </table>
		  <%
		  	if(request.getParameter("msg") != null){
		  		%><h1>Lỗi <%=request.getParameter("msg") %></h1><%
		  	}
		  %>
        <form class="form-row" method="POST" action="doAddCollateral.jsp">
            <div class="form-group col-md-4">
                <label for="pawnedProperty">Tài Sản Cầm Cố:</label>
                <select class="form-control" name="coSelect" required>
                	<%
                		for(int i=0;i<listCollateral.size();i++){
                	%>
                	<option value="<%=listCollateral.get(i).getId()%>">
                		<%=listCollateral.get(i).getName()%>
                	</option>
                	<%
                		}
                	%>
                </select>
            </div>
            <div class="form-group col-md-4">
                <label for="quantity">Số Lượng:</label>
                <input type="number" class="form-control" id="quantity" name="number" required>
            </div>
            <div class="form-group col-md-4">
                <label for="quantity">Mô tả :</label>
                <input type="text" name="des" class="form-control" >
            </div>
            <div class="form-group col-md-4">
                <button type="submit" class="btn btn-success mt-4" id="addPropertyBtn">Thêm Tài Sản Cầm Cố</button>
            </div>

        </form>

        <!-- Bảng Danh Sách Tài Sản Cầm Cố -->
        <h4 class="mt-4">Danh Sách Tài Sản Cầm Cố</h4>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Tài Sản Cầm Cố</th>
                    <th scope="col">Số Lượng</th>
                    <th scope="col">Mô tả</th>
                </tr>
            </thead>
            <tbody id="pawnedPropertyList">
            <% if(collateralSelect != null){ %>
            	<% for(int i=0;i<collateralSelect.size();i++){ %>
            	<tr>
            		<td><%=(i+1) %></td>
            		<td><%=collateralSelect.get(i).getCollateral().getName() %></td>
            		<td><%=collateralSelect.get(i).getNumber() %></td>
            		<td><%=collateralSelect.get(i).getDes() %></td>
            	</tr>
            	<% } %>
           	<% } %>
            </tbody>
        </table>
        <form action="doConfirm.jsp" method="POST">
            <div class="text-center mt-4">
                <button type="button" class="btn btn-danger mr-3" id="cancelBtn">Hủy</button>
                <button type="submit" class="btn btn-primary" id="confirmBtn">Xác Nhận</button>
            </div>
        </form>



        <!-- Nút Xác Nhận và Hủy -->


    </div>

</body>
</html>