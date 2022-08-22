<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "service.*" %>
<%@ page import = "repository.*" %>

<%
	int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
	GoodsImg img = new GoodsImgDao().selectImgOne(goodsNo);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>상품 이미지 수정</h3>
	<form action="<%=request.getContextPath()%>/admin/updateGoodsImgAction.jsp"
				method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>이미지 제목</td>
				<td><input type="text" name="goodsName" value="<%=img.getGoodsName()%>"></td>
			</tr>
			<tr>
				<td>이미지 파일</td>
				<td>
					<input type="hidden" name = "contentType" value="<%=img.getContentType()%>">
					<input type="hidden" name = "originFileName" value="<%=img.getOriginFileName()%>">
					<input type="hidden" name = "fileName" value="<%=img.getFileName()%>">
					<input type="file" name="fileName">
				</td>
			</tr>
		</table>
		<button type="submit">이미지파일 업로드</button>
		<button type="reset">초기화</button>	
	</form>
	<hr>
	<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp"><button>뒤로가기</button></a>
	
</body>
</html>