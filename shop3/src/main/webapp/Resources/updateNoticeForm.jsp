<%@page import="service.NoticeService"%>
<%@page import="java.sql.Connection"%>
<%@page import="vo.*"%>
<%@page import="repository.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
		int No = Integer.parseInt(request.getParameter("noticeNo"));
		NoticeService noticeService = new NoticeService();
		
		Notice notice = null;
		notice = noticeService.getNoticeOne(No);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/Resources/updateNoticeAction.jsp?noticeNo=<%=notice.getNoticeNo()%>" method="post">
		<table class="table table-bordered">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="noticeId" value="<%=notice.getNoticeId()%>" readonly="readonly"></td>
			</tr>

			<tr>
				<td>제목</td>
				<td><input type="text" name="noticeTitle" value="<%=notice.getNoticeTitle()%>"></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="80" name="noticeContent"><%=notice.getNoticeContent()%></textarea> </td>
			</tr>
			

		</table>
		<button type="submit">수정</button>
		<button type="reset">초기화</button>

	</form>

</body>
</html>