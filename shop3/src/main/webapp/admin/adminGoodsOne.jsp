<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "vo.*" %>    
<%@ page import = "service.*" %>
<%@ page import = "repository.*" %>
    
<%
	int goodsNo = Integer.parseInt(request.getParameter("goodsNo")); 
	GoodsService goodsService = new GoodsService();
	Map<String, Object> map = goodsService.getGoodsAndImgOne(goodsNo);
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1> 상품 상세보기 </h1>
<table border="1">
	<thead>
	<tr> 
		<th>번호</th>
		<th>이미지</th>
		<th>이름</th>
		<th>가격</th>
		<th>등록일</th>
		<th>수정일</th>
		<th>품절여부</th>
		<th>상품수정</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td><%=map.get("goodsNo")%></td>
		<td><img src="<%=request.getContextPath()%>/upload/<%=map.get("imgFileName")%>" width="280px" height="200px">
		<td><%=map.get("goodsName")%></td>
		<td><%=map.get("goodsPrice")%></td>
		<td><%=map.get("imgCreateDate")%></td>
		<td><%=map.get("goodsUpdateDate")%></td>
		<td><%=map.get("soldOut")%></td>
		<td><a href="<%=request.getContextPath()%>/admin/updateGoodsForm.jsp?goodsNo=<%=map.get("goodsNo")%>"><button>수정</button></a></td>
	</tr>
	</tbody>	
</table>
	<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp"><button>뒤로가기</button></a>

	
</body>
</html>