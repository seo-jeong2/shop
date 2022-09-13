<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
	if (session.getAttribute("login"+session.getAttribute("user")) == null) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
	
	String id = request.getParameter("customerId");
	System.out.println(id + " <-- id");
	
	CartService cartService = new CartService();
	
	List<Map<String, Object>> list = cartService.getCartListOne(id);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div>
			<h5><a href="<%=request.getContextPath()%>/index.jsp">첫화면으로</a></h5>
		</div>
		<div>
			<h1><%=session.getAttribute("id")%>님의 장바구니</h1>
		</div>
		<div>
			<table border = "1">
				<thead>
					<tr>
						<th>상품번호</th>
						<th>상품명</th>
						<th>상품별 개수</th>
						<th>상품 개수</th>
						<th>총 가격</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(Map<String, Object> m : list){
					%>
						<tr>
							<td><%=m.get("goodsNo")%></td>
							<td><%=m.get("goodsName")%></td>
							<td><%=m.get("goodsPrice")%></td>
							<td><%=m.get("cartTotalnum")%></td>
							<td><%=m.get("cartTotalprice")%></td>
						</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</body>
</html>