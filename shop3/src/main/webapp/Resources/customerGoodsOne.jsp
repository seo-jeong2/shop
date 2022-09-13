<%@page import="java.util.Map"%>
<%@page import="service.GoodsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

int goodsNo = Integer.parseInt(request.getParameter("goodsNo"));
System.out.println("고객상품상세보기 goodsNo: " + goodsNo);

GoodsService goodsService = new GoodsService();// 생성

Map<String, Object> map = goodsService.getGoodsAndImgOne(goodsNo);

System.out.println("고객 상품상세보기 : " + map.toString());


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="padding: 50px 100px 50px;">
		<div>
			<a href="<%=request.getContextPath()%>/Resources/customerGoodsList.jsp">뒤로가기</a>
		</div>
		<table border="1">
			<tr>
				<td>상품이미지</td>
				<td><img
					src="<%=request.getContextPath()%>/upload/<%=map.get("fileName")%>"></td>
			</tr>
			<tr>
				<td>번호</td>
				<td><%=map.get("goodsNo")%></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><%=map.get("goodsName")%></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><%=map.get("goodsPrice")%></td>
			</tr>
			<tr>
				<td>마지막수정날짜</td>
				<td><%=map.get("updateDate")%></td>
			</tr>
			<tr>
				<td>작성날짜</td>
				<td><%=map.get("createDate")%></td>
			</tr>
			<tr>
				<td>품절여부</td>
				<td><%=map.get("soldOut")%></td>
			</tr>
			<tr>
				<td>장바구니담기</td>
				<td><form action="<%=request.getContextPath()%>/Resources/addCartAction.jsp" method="post">
      	 		<input type="hidden" name="goodsNo" value="<%=map.get("goodsNo")%>">
      	 		<input type="hidden" name="goodsPrice" value="<%=map.get("goodsPrice")%>">

      	 		<select name="cartCount">
	      	 	<%
	      	 		for(int i=1; i<=10; i++){
	      	 	%>
	      	 		<option><%=i%></option>
	      	 	<%
	      	 		}
	      	 	%>
      	 	</select>개
      	 	
      	 	<button type="submit">장바구니 추가</button>
      	 	</form>
      	 </td>
      	 
      	 </tr>
      <tr>
      	 <td>주문하기</td>
      	 <td>
      	 	<select name="orderCount" id="orderCount">
      	 		<option>1</option>
      	 		<option>2</option>
      	 		<option>3</option>
	      	 	<%
	      	 		for(int i=1; i<=10; i++){
	      	 	%>
	      	 		<option value=i><%=i%></option>
	      	 	<%
	      	 		}
      	 		%>
      	 	</select>개
      	 	<a href="./customerOrdersForm.jsp?goodsNo=<%=map.get("goodsNo")%>">개별 주문</a>
      	 </td>
      </tr>
   </table>
   
   
   
 </div>
</body>
</html>