<%@page import="java.util.Map"%>
<%@page import="service.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="repository.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>


<%
	int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
	GoodsService goodsService = new GoodsService();
	Map<String,Object> map = goodsService.getGoodsAndImgOne(goodsNo);
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품 수정</h1>
	<form action="<%=request.getContextPath()%>/admin/updateGoodsAction.jsp?goodsNo=<%=map.get("goodsNo")%>"
				method="post" enctype="multipart/form-data">
		<table border="1">
		<thead>
			<tr>
				<td>번호</td>
				<td>이미지</td>
				<td>상품명</td>
				<td>가격</td>
				<td>품절여부</td>
				<td>이미지 파일</td>
			</tr>
		</thead>
		
		
		
		<tbody>
		<tr>		
				<td><%=map.get("goodsNo")%></td>
				<td><img src="<%=request.getContextPath()%>/upload/<%=map.get("imgFileName")%>" width="280px" height="200px"></td>
				<td><input type="text" name="goodsName" value="<%=map.get("goodsName")%>"></td>
				<td><input type="text" name="goodsPrice" value="<%=map.get("goodsPrice")%>"></td>
				
	
	<td>
				<select name="soldOut">
				
				 <%
				      if(map.get("soldOut").equals("N")) {
				   %>
				         <option value="Y">Y</option>
				         <option value="N" selected="selected">N</option>
				   <%
				      } else {
				   %>
				         <option value="Y" selected="selected">Y</option>
				         <option value="N">N</option>
				   <%
				      }
				   %>	

			</select>	
	
	</td>
				<td>
					<input type="hidden" name = "file" value="<%=map.get("imgOriginFileName")%>">
					<input type="hidden" name = "file" value="<%=map.get("imgContentType")%>">
					<input type="hidden" name = "file" value="<%=map.get("imgFileName")%>">
					<input type="file" name="file">
				</td>	
			
		
		</tr>
		</tbody>
		</table>
		<button type="submit">수정하기</button>
		<button type="reset">초기화</button>	
		
		</form>	
	<a href="<%=request.getContextPath()%>/admin/adminGoodsOne.jsp?goodsNo=<%=map.get("goodsNo")%>"><button>뒤로가기</button></a>
</body>
</html>