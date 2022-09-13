<%@page import="vo.*"%>
<%@page import="service.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="service.*"%>
<%@ page import="java.util.*"%>

<%
request.setCharacterEncoding("utf-8");


if (session.getAttribute("user") == null) {
	response.sendRedirect(request.getContextPath() + "/Resources/loginForm.jsp");
	System.out.println("고객으로 로그인하세요");
	return;
}



//페이징
int num =0;
int currentPage = 1;
if (request.getParameter("currentPage") != null) {
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
}


int rowPerPage = 10;
if (request.getParameter("rowPerPage") != null) {
	currentPage = Integer.parseInt(request.getParameter("rowPerPage"));
}

GoodsService goodsService = new GoodsService();


%>


<!-- View 태그 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품 목록</h1>
	<div>
		<a href=""> 인기순 </a> <a href=""> 판매량순 </a> <a href=""> 낮은가격순 </a> <a
			href=""> 높은가격순 </a> <a href=""> 최신순 </a>
	</div>

	<table border="1">
		<thead>
			<tr>
				<th>사진</th>
				<th>상품명</th>
				<th>가격</th>
				<th>등록일</th>
				<th>품절여부</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<%
				List<Map<String, Object>> list = goodsService.getCustomerGoodsListByPage(rowPerPage, currentPage, num);
				
				
				for (Map<String,Object> g : list) {
				
				%>
			
			<tr>
				<td><a href="<%=request.getContextPath()%>/Resources/customerGoodsOne.jsp?goodsNo=<%=g.get("goodsNo")%>">
				<img src="<%=request.getContextPath()%>/upload/<%=g.get("fileName")%>" width="300" height="200"></a></td>
				<td><%=g.get("goodsName")%></td>
				<td><%=g.get("goodsPrice")%></td>
				<td><%=g.get("CreateDate")%></td>
				<td><%=g.get("SoldOut")%></td>

				<%
				}
				%>

			</tr>
		</tbody>
	</table>

	<%
	if (currentPage > 1) {
	%>
	<a
		href="<%=request.getContextPath()%>/customerGoodsList.jsp?currentPage=<%=currentPage - 1%>"
		class="btn btn-dark"><button>이전</button></a>
	<%
	}
	if (currentPage < rowPerPage) {
	%>
	<a
		href="<%=request.getContextPath()%>/customerGoodsList.jsp?currentPage=<%=currentPage + 1%>"
		class="btn btn-dark"><button>다음</button></a>
	<%
	}
	%>

	<a href="<%=request.getContextPath()%>/index.jsp"><button>처음으로</button></a>


</body>
</html>