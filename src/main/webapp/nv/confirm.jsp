<%@page import="model.Contract"%>
<%@page import="model.ContractDetail"%>
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
User u = (User)session.getAttribute("nhanvien");
if(u==null){
    response.sendRedirect("../login.jsp?err=timeout");
}
Contract contract = (Contract)session.getAttribute("contractSelect");
ContractDetail carSelect = (ContractDetail)session.getAttribute("carSelect");
String sumRental = (String)session.getAttribute("sumRental");
String sumErrorMoney = (String)session.getAttribute("sumErrorMoney");
String sum = (String)session.getAttribute("sum");
%>
<body class="container mt-4">

    <h2 class="text-success">Thông tin Hợp đồng</h2>

    <div class="row">
        <div class="col-md-6">
            <table class="table">
                <tbody>
                    <tr>
                        <th scope="row">Mã Hợp Đồng</th>
                        <td><%=contract.getId() %></td>
                    </tr>
                    <tr>
                        <th scope="row">Tên Khách Hàng</th>
                        <td><%=contract.getUser().getUsername() %></td>
                    </tr>
                    <tr>
                        <th scope="row">Tiền Thuê Xe</th>
                        <td><%=sumRental %></td>
                    </tr>
                    <tr>
                        <th scope="row">Tiền Lỗi Hỏng</th>
                        <td><%=sumErrorMoney %></td>
                    </tr>
                    <tr>
                        <th scope="row">Tổng Tiền</th>
                        <td><%=sum %></td>
                    </tr>
                    <tr>
                        <th scope="row">Trạng Thái Tài Sản Cầm Cố</th>
                        <td><%=request.getParameter("type") %></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="col-md-6">
            <h2 class="text-success">Thông tin Xe Trả</h2>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Hãng Xe</th>
                        <th scope="col">Biển Số</th>
                        <th scope="col">Loại</th>
                        <th scope="col">Ngày Thuê</th>
                        <th scope="col">Ngày Trả</th>
                        <th scope="col">Giá</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%=carSelect.getCar().getManufacturer() %></td>
                        <td><%=carSelect.getCar().getLicenseOlate() %></td>
                        <td><%=carSelect.getCar().getType() %></td>
                        <td><%=carSelect.getStartDate() %></td>
                        <td><%=carSelect.getEndDate() %></td>
                        <td><%=carSelect.getPrice() %></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <a href="doConfirm.jsp" class="btn btn-success" >Xác Nhận</a>
    <a class="btn btn-danger" href="staffHome.jsp">Back</a>
</body>
</html>