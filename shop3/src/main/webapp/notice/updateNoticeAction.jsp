<%@page import="service.NoticeService"%>
<%@page import="java.sql.Connection"%>
<%@page import="vo.*"%>
<%@page import="repository.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	int No = Integer.parseInt(request.getParameter("noticeNo"));
	String title = request.getParameter("noticeTitle"); 
	String Id= request.getParameter("noticeId");
	String content = request.getParameter("noticeContent");
	
	NoticeService noticeService = new NoticeService();
	Notice notice = new Notice();
	
	 notice.setNoticeNo(No);
	 notice.setNoticeTitle(title);
	 notice.setNoticeId(Id);
	 notice.setNoticeContent(content);
	 
	 noticeService.updateNotice(notice);
	
	
	
	response.sendRedirect("./NoticeOne.jsp?noticeNo="+No);

%>
