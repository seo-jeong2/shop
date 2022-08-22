<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "model.*" %>
<%
	int imgNo = Integer.parseInt(request.getParameter("imgNo"));
	Img img = new ImgDao().selectImgOne(imgNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>이미지파일수정</h3>
	<form action="<%=request.getContextPath()%>/updateImgAction.jsp"
				method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>번호</td>
				<td><input type="text" name="imgNo" value="<%=img.getImgNo()%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>이미지 제목</td>
				<td><input type="text" name="imgTitle" value="<%=img.getImgTitle()%>"></td>
			</tr>
			<tr>
				<td>이미지 파일</td>
				<td>
					<input type="hidden" name = "extype" value="<%=img.getImgType()%>">
					<input type="hidden" name = "exoname" value="<%=img.getImgOriginName()%>">
					<input type="hidden" name = "exname" value="<%=img.getImgName()%>">
					<input type="file" name="imgFile">
				</td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="imgPw"></td>
			</tr>
		</table>
		<button type="submit">이미지파일 업로드</button>
		<button type="reset">초기화</button>	
	</form>
	<hr>
	<a href="./imgList.jsp"><button>사진 목록</button></a>
</body>
</html>