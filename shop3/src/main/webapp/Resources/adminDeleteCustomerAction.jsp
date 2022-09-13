<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.Customer"%>
<%@ page import="service.CustomerService"%>
<%
	request.setCharacterEncoding("utf-8"); //인코딩
	String customerId = request.getParameter("customerId");
	
	System.out.println(customerId + " : 회원 아이디");
	
	Customer customer = new Customer();
	CustomerService customerService = new CustomerService();
	
	customer.setCustomerId(customerId);
	
	customerService.adminDeleteCustomer(customer);
	
	// System.out.println("로그인 성공");
	
	response.sendRedirect(request.getContextPath()+"/admin/adminCustomerList.jsp");
%> 