<%@page import="repository.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="service.*" %>
<%
	
	String active = request.getParameter("active");
	String customerId = request.getParameter("customerId");
	
	System.out.println(active);
	System.out.println(customerId);
	
	
	Customer customer = new Customer();
	CustomerService customerService = new CustomerService();
	
	customer.setActive(active);
	customer.setCustomerId(customerId);
	
	boolean result = customerService.modifyCustomerActive(customer);
	
	if(result) {
		response.sendRedirect(request.getContextPath() + "/admin/adminCustomerList.jsp");
		System.out.println("active 변경 성공");
	} else {
		response.sendRedirect(request.getContextPath() + "/admin/adminCustomerList.jsp");
		System.out.println("active 변경 실패");
	}
%>