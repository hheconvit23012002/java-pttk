<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="dao.UserDAO"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String username = (String)request.getParameter("username");
    String password = (String)request.getParameter("password");
    String email = (String)request.getParameter("email");
    String birthdateString = (String)request.getParameter("birthdate");
    String phoneNumber = (String)request.getParameter("phoneNumber");
    String address = (String)request.getParameter("address");
    String role = "khachhang";
    java.util.Date date = sdf.parse(birthdateString);
    java.sql.Date birthdate = new java.sql.Date(date.getTime());  
    User u = new User(username, password,email,birthdate, phoneNumber, address,role);
 
    UserDAO dao = new UserDAO();
    boolean kq = dao.register(u);
     
    if(kq){
        response.sendRedirect("login.jsp?msg=success");
    }else{
        response.sendRedirect("register.jsp?err=fail");
    } 
%>