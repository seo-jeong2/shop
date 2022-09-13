<%@page import="service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="repository.*"%>
<%@ page import="vo.*"%>

<%
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	
	NoticeService noticeService = new NoticeService();
	Notice notice = null;
	notice = noticeService.getNoticeOne(noticeNo);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>작성자</td>
			<td><%=notice.getNoticeId()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=notice.getNoticeTitle()%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=notice.getNoticeContent()%></td>
		</tr>
		<tr>
			<td>날짜</td>
			<td><%=notice.getCreateDate()%></td>
		</tr>
		<tr>
			<td colspan="2">
				<a href="./updateNoticeForm.jsp?noticeNo=<%=notice.getNoticeNo()%>">수정</a>
				<a href="./deleteNoticeForm.jsp?noticeNo=<%=notice.getNoticeNo()%>">삭제</a>
			</td>
		</tr>
	</table>
</body>
</html>