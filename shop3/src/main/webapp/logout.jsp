<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	session.invalidate();
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
	
	System.out.println("로그아웃 성공");

%>
