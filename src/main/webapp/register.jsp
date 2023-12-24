<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
<%
 	if(request.getParameter("err") !=null && request.getParameter("err").equalsIgnoreCase("fail")){
        %> <h4 color="red">Lỗi !</h4><%
    }
%>
<h2> Đăng ký </h2>
<form name="dangnhap" action="doRegister.jsp" method="post">
    <table border="0">
        <tr>
            <td>Tên đăng nhập:</td>
            <td><input type="text" name="username" id="username" required /></td>
        </tr>
        <tr>
            <td>Mật khẩu:</td>
            <td><input type="password" name="password" id="password"
                required /></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="text" name="email" id="email"
                required /></td>
        </tr>
        <tr>
            <td>Ngày sinh:</td>
            <td><input type="date" name="birthdate" id="birthdate"
                required /></td>
        </tr>
        <tr>
            <td>Số điện thoại:</td>
            <td><input type="text" name="phoneNumber" id="phoneNumber"
                required /></td>
        </tr>
        <tr>
            <td>Địa chỉ:</td>
            <td><input type="text" name="address" id="address"
                required /></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="submit" value="Đăng ký" /></td>
            <td><a href="login.jsp">Đăng nhập</a></td>
        </tr>
    </table>
</form>
</body>
</html>