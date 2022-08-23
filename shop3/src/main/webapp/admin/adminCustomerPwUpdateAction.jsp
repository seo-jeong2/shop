<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="service.CustomerService"%>
<%@ page import = "repository.*"%>
<%@ page import = "vo.*"%>

<%
	if(session.getAttribute("customerId") != null){
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp?errorMsg=already");
		//다이렉트
		return;
	}
	
	System.out.println("비밀번호 초기화");
	CustomerService customerService = new CustomerService();
	Customer customer = new Customer();
	
	request.setCharacterEncoding("utf-8");
	String customerId = request.getParameter("customerId");
	System.out.println(customerId + " : 회원 아이디");
	//디버깅
	
	customerService.adminUpdateCustomerPw(customerId);
	
	
	response.sendRedirect(request.getContextPath()+"/admin/adminCustomerList.jsp");
	
	System.out.println("비밀번호 초기화 성공");
%> 