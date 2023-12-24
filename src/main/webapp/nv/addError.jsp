<%@page import="model.Damaged"%>
<%@page import="model.DamagedDetail"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String error = (String)request.getParameter("error-select");
	String number =  (String)request.getParameter("quantity");
	String des = (String)request.getParameter("des");
	if(des == null){
		des= "";
	}
	ArrayList<Damaged> damagedDefault = (ArrayList)session.getAttribute("damagedDefault");
	Damaged ddSelect = null;
	ArrayList<DamagedDetail> listError = (ArrayList)session.getAttribute("listError");
	if(listError == null){
		listError = new ArrayList<DamagedDetail>();
	}
	
	for(Damaged dd : damagedDefault){
		if(dd.getId() == Integer.parseInt(error)){
			ddSelect = dd;
			break;
		}
	}
	
	if(Integer.parseInt(number) <= 0 || ddSelect == null){
		response.sendRedirect("error.jsp?msg=validate");
	}else{
		int isReturn = 0;
		DamagedDetail ddDetail = new DamagedDetail();
		ddDetail.setDamaged(ddSelect);
		ddDetail.setDes(des);
		ddDetail.setNumber(Integer.parseInt(number));
		listError.add(ddDetail);
		session.setAttribute("listError", listError);
		response.sendRedirect("error.jsp");
	}
%>