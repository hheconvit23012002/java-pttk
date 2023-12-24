<%@page import="model.CollateralDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Collateral"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String coSelectString = (String)request.getParameter("coSelect");
	String number =  (String)request.getParameter("number");
	String des = (String)request.getParameter("des");
	if(des == null){
		des= "";
	}
	ArrayList<Collateral> listCollateral = (ArrayList)session.getAttribute("collateral");
	Collateral coSelect = null;
	ArrayList<CollateralDetail> collateralSelect = (ArrayList)session.getAttribute("collateralSelect");
	if(collateralSelect == null){
		collateralSelect = new ArrayList<CollateralDetail>();
	}
	
	for(Collateral co : listCollateral){
		if(co.getId() == Integer.parseInt(coSelectString)){
			coSelect = co;
			break;
		}
	}
	
	if(Integer.parseInt(number) <= 0 || coSelect == null){
		response.sendRedirect("confirm.jsp?msg=validate");
	}else{
		int isReturn = 0;
		CollateralDetail coDetail = new CollateralDetail(isReturn, des, Integer.parseInt(number), coSelect);
		collateralSelect.add(coDetail);
		session.setAttribute("collateralSelect", collateralSelect);
		response.sendRedirect("confirm.jsp");
	}
%>