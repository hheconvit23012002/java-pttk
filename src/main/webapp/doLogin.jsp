<%@page import="dao.UserDAO"%>
<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String username = (String)request.getParameter("username");
    String password = (String)request.getParameter("password");
    User u = new User();
    u.setUsername(username);
    u.setPassword(password);
 
    UserDAO dao = new UserDAO();
    boolean kq = dao.loginning(u);
     
    if(kq && (u.getRole().equalsIgnoreCase("khachhang"))){
        session.setAttribute("khachhang", u);
        response.sendRedirect("kh\\customerHome.jsp");
    }else if(kq &&(u.getRole().equalsIgnoreCase("nhanvien"))){
        session.setAttribute("nhanvien", u);
        response.sendRedirect("nv\\staffHome.jsp");
    }else{
        response.sendRedirect("login.jsp?err=fail");
    }
%>