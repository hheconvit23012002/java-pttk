<%@page import="model.Contract"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ContractDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contractId = (String)request.getParameter("contract-id");
	String nameCustomer = (String)request.getParameter("customer-name");
	ContractDAO dao = new ContractDAO();
	ArrayList<Contract> listContract = dao.searchContract(contractId, nameCustomer);
	session.setAttribute("listContract", listContract);
	response.sendRedirect("searchContract.jsp");
%>