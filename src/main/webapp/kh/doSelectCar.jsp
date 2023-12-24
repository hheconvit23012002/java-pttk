<%@page import="model.Car"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String startDate = (String)request.getParameter("startDate");
	String endDate = (String)request.getParameter("endDate");
	ArrayList<Car> listCar = new ArrayList<>();
	if((ArrayList)session.getAttribute("listCar") != null){
		listCar = (ArrayList)session.getAttribute("listCar");
	}
	ArrayList<String> listDateRental = new ArrayList<>();
	if((ArrayList)session.getAttribute("dateRental") != null){
		listDateRental = (ArrayList)session.getAttribute("dateRental");
	}
	String carId = (String)request.getParameter("car");
	Car carRental = null;
	for(int i=0;i< listCar.size();i++){
		
		if(listCar.get(i).getId() == Integer.parseInt(carId)){
			
			carRental = listCar.get(i);
			break;
		}
	}
 	session.removeAttribute("listCar");
	if(startDate == "" || endDate == "" || carRental == null){
    	response.sendRedirect("searchCar.jsp?msg=validateOrNotCar");
	}else{
		String dateRental = startDate + "." + endDate;
		ArrayList<Car> listCarRental = (ArrayList)session.getAttribute(dateRental);
		if(listCarRental == null){
			listCarRental = new ArrayList<Car>();
			listDateRental.add(dateRental);
		}
		listCarRental.add(carRental);
		session.setAttribute(dateRental, listCarRental);
		session.setAttribute("dateRental", listDateRental);
		response.sendRedirect("searchCar.jsp");
	}
 
%>