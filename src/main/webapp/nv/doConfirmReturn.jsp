<%@page import="model.CollateralDetail"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="model.Contract"%>
<%@page import="model.ContractDetail"%>
<%@page import="model.DamagedDetail"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<DamagedDetail> listError = (ArrayList)session.getAttribute("listError");
ContractDetail carSelect = (ContractDetail)session.getAttribute("carSelect");
Contract contract = (Contract)session.getAttribute("contractSelect");
String typeReturn = (String)request.getParameter("type");
LocalDate st = carSelect.getStartDate().toLocalDate();
LocalDate ed = carSelect.getEndDate().toLocalDate();
long daysBetween = ChronoUnit.DAYS.between(st, ed);
long sumRental = carSelect.getPrice()*daysBetween;
long sumErrorMoney = 0;
for(DamagedDetail dd : listError){
	sumErrorMoney += dd.getNumber()*dd.getDamaged().getCompensation();
}
long sum = sumErrorMoney + sumRental;
carSelect.setIsReturn(1);
for(ContractDetail cd : contract.getListCar()){
	if(cd.getId() == carSelect.getId()){
		carSelect.setIsReturn(1);
		ArrayList<DamagedDetail> tmp = carSelect.getDamaged();
		tmp.addAll(listError);
		carSelect.setDamaged(tmp);
		break;
	}
}
String nameType = "Chua tra";
if(typeReturn == "1"){
	nameType = "Tra";
	for(CollateralDetail co : contract.getListCollateral()){
		co.setIsReturn(1);
	}
}
session.setAttribute("contractSelect", contract);
session.setAttribute("sumRental", String.valueOf(sumRental));
session.setAttribute("sumErrorMoney", String.valueOf(sumErrorMoney));
session.setAttribute("sum", String.valueOf(sum));
response.sendRedirect("confirm.jsp?type="+nameType);

%>