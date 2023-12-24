<%@page import="dao.ContractDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="model.Contract"%>
<%@page import="java.util.Date"%>
<%@page import="model.Car"%>
<%@page import="model.ContractDetail"%>
<%@page import="model.CollateralDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
User u = (User)session.getAttribute("khachhang");
if(u == null){
    response.sendRedirect("../login.jsp?err=timeout");
}else{
	ArrayList<CollateralDetail> collateralSelect = (ArrayList)session.getAttribute("collateralSelect");
	ArrayList<String> listDateRental = (ArrayList)session.getAttribute("dateRental");
	if(listDateRental == null || collateralSelect == null){
		response.sendRedirect("confirm.jsp?msg=NotCarSelectOrNotCollateral");
	}else{
		ArrayList<ContractDetail> listContractDetail = new ArrayList<>();
		for(String dateRental : listDateRental){
	      	String[] se = dateRental.split("\\.");
	     	
	        Date sr = sdf.parse(se[0]);
	    	Date er = sdf.parse(se[1]);
			ArrayList<Car> carSelect = (ArrayList)session.getAttribute(dateRental);
			session.removeAttribute(dateRental);
			for(Car car : carSelect){
				ContractDetail cd = new ContractDetail();
				cd.setCar(car);
				cd.setStartDate(new java.sql.Date(sr.getTime()));
				cd.setEndDate(new java.sql.Date(er.getTime()));
				cd.setPrice(car.getPrice());
				cd.setIsReturn(0);
				listContractDetail.add(cd);
			}
		}
		Contract c = new Contract();
		Calendar calendar = Calendar.getInstance();
        java.sql.Date sqlDateFromCalendar = new java.sql.Date(calendar.getTimeInMillis());
		c.setDay(sqlDateFromCalendar);
		c.setListCar(listContractDetail);
		c.setListCollateral(collateralSelect);
		c.setUser(u);
		
		ContractDAO dao = new ContractDAO();
		boolean kq = dao.createContract(c);
		session.removeAttribute("collateralSelect");
		session.removeAttribute("dateRental");
		if(kq){
			response.sendRedirect("customerHome.jsp?success=Success");
		}else{
			response.sendRedirect("customerHome.jsp?err=err");
		}
		
	}
}
%>
