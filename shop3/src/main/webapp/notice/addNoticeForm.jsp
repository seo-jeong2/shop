<%@ page import="repository.*"%>
<%@ page import="vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>공지 입력</h1>
		<form method="post" action="./addNoticeAction.jsp">
			<table class="table table-bordered">
				<tr>
					<td>작성자</td>
					<td><input type="text" name="noticeId"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="noticeTitle"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="5" cols="80" name="noticeContent"></textarea>
					</td>
				</tr>
			</table>
			<button type="submit">글입력</button>
			<button type="reset">초기화</button>
		</form>
	</div>
</body>
</html>