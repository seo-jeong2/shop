<%@page import="service.NoticeService"%>
<%@page import="vo.*"%>
<%@page import="repository.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	int No = Integer.parseInt(request.getParameter("noticeNo"));
	String id = request.getParameter("noticeId");
	String title = request.getParameter("noticeTitle"); 
	String content = request.getParameter("noticeContent");
	
	
	NoticeService noticeservice = new NoticeService();
	Notice notice = new Notice();
	
	notice.setNoticeNo(No);
	notice.setNoticeTitle(title);
	notice.setNoticeContent(content);
	notice.setNoticeId(id);
	
	noticeservice.addNotice(notice);
	
	response.sendRedirect("./adminNoticeList.jsp");

%>
