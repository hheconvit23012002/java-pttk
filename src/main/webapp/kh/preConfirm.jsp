<%@page import="model.Collateral"%>
<%@page import="dao.CollateralDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	if((ArrayList)session.getAttribute("collateral") == null){
		CollateralDAO dao = new CollateralDAO();
		ArrayList<Collateral> list = dao.getCollateral();
		session.setAttribute("collateral", list);
	}
	response.sendRedirect("confirm.jsp");
%>
