<%@page import="java.net.URLEncoder"%>
<%@page import="model.Car"%>
<%@page import="dao.CarDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String startDateString = (String)request.getParameter("startDate");
String endDateString = (String)request.getParameter("endDate");
String type = (String)request.getParameter("type");
ArrayList<String> listDateRental = (ArrayList)session.getAttribute("dateRental");
if(listDateRental == null){
	listDateRental = new ArrayList<>();
}

if (startDateString == "" || endDateString == "" || sdf.parse(startDateString).after(sdf.parse(endDateString))) {
	session.removeAttribute("listCar");
	response.sendRedirect("searchCar.jsp?msg=validate");
}else{
	Date startDate = sdf.parse(startDateString);
    Date endDate = sdf.parse(endDateString);
    CarDAO dao = new CarDAO();
    ArrayList<Car> listCar = dao.searchCar(new java.sql.Date(startDate.getTime()), new java.sql.Date(endDate.getTime()), type);
    
    for(int i=0;i<listDateRental.size();i++){
      	String[] se = listDateRental.get(i).split("\\.");
     	
        Date sr = sdf.parse(se[0]);
    	Date er = sdf.parse(se[1]);
    	if(startDate.after(er) || sr.after(endDate)){
    		continue;
    	}else{
    		ArrayList<Car> listCarRental = (ArrayList)session.getAttribute(listDateRental.get(i));

     		for(int j=0;j<listCar.size();j++){
    			Car carCheck = listCar.get(j);
    			if(listCarRental.contains(carCheck)){
    				listCar.remove(j);
    				j--;
    			}
    		} 
     	}  
    }
    session.setAttribute("listCar", listCar);
    response.sendRedirect("searchCar.jsp?startDate="+request.getParameter("startDate")+"&endDate="+request.getParameter("endDate"));   
}
%>
