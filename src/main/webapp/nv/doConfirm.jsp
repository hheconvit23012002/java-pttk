<%@page import="dao.BillDAO"%>
<%@page import="model.Bill"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Contract"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Contract contract = (Contract)session.getAttribute("contractSelect");
String sum = (String)session.getAttribute("sumRental");
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Calendar calendar = Calendar.getInstance();
java.sql.Date sqlDateFromCalendar = new java.sql.Date(calendar.getTimeInMillis());
Bill bill = new Bill();
bill.setContract(contract);
bill.setDay(sqlDateFromCalendar);
bill.setSum(Long.parseLong(sum));
BillDAO dao = new BillDAO();
boolean kq= dao.addBill(bill);
if(kq){
	response.sendRedirect("staffHome.jsp?success=ThanhCong");
}else{
	response.sendRedirect("staffHome.jsp?eror=eror");
}
%>