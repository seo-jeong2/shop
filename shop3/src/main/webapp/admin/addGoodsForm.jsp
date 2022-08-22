<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add goods form</title>
</head>
<body>
	<form action="<%=request.getContextPath()%>/admin/addGoodsAction.jsp" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>제품 이름</td>
				<td><input type="text" name="goodsName" id="goodsName"></td>
			</tr>
			<tr>
				<td>제품 가격</td>
				<td><input type="text" name="goodsPrice" id="goodsPrice"></td>
			</tr>
			<tr>
				<td>품절 여부</td>
				<td>
				<label>Y<input type="radio" name="soldOut" value="Y"></label>
				<label>N<input type="radio" name="soldOut" value="N"></label>
				<td>
			</tr>
			<tr>
				<td>이미지 파일</td>
				<td><input type="file" name="imgFile"></td>
			</tr>
		</table>
		<button type="submit" id="btn">제품 등록</button>
	</form>
</body>
</html>