<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="service.*"%>
<%@ page import="vo.*"%>
<%

//인코딩
request.setCharacterEncoding("utf-8");

//관리자로 로그인
if (session.getAttribute("user") == null ) {
	response.sendRedirect(request.getContextPath() + "/index.jsp");
	System.out.println("관리자로 로그인하세요");
	
	return;
}	

//페이징 1~10
int currentPage = 1;
if (request.getParameter("currentPage") != null) {
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
}

final int rowPerPage = 10;

GoodsService goodsService = new GoodsService();
List<Goods> list = new ArrayList<Goods>();
list = goodsService.getGoodsListByPage(rowPerPage, currentPage);

int lastPage = goodsService.getLastPage(rowPerPage);

//상품없을시 처음으로돌아가기
if(list == null) {
	response.sendRedirect(request.getContextPath() + "/index.jsp");
	return;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<div>
<!-- 메뉴 -->
	<ul>
		<li><a href = "<%=request.getContextPath()%>/employeeList.jsp">사원관리</a></li>
		<li><a href = "<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a></li>
		<li><a href = "<%=request.getContextPath()%>/admin/adminOrderList.jsp">주문관리</a></li>
		<li><a href = "<%=request.getContextPath()%>/admin/adminCustomerList.jsp">고객관리</a></li>
		<li><a href = "<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a></li>
	</ul>
	</div>

	<h1>상품 관리</h1>
	<a href="<%=request.getContextPath()%>/admin/addGoodsForm.jsp"><button>상품추가</button></a>
	
	<body>	
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>가격</th>
					<th>등록일</th>
					<th>수정일</th>
					<th>품절여부</th>
				</tr>
			</thead>
			<tbody>
			<%
				for(Goods g : list) {
			%>
					<tr>
						<td><%=g.getGoodsNo()%></td>
						<td><a href="<%=request.getContextPath()%>/admin/adminGoodsOne.jsp?goodsNo=<%=g.getGoodsNo() %>">
						<%=g.getGoodsName()%></a></td>
						<td><%=g.getGoodsPrice()%></td>
						<td><%=g.getCreateDate()%></td>
						<td><%=g.getUpdateDate()%></td>
						<td><%=g.getSoldOut()%></td>
					
					</tr>
			<%	
				}
			%>
			
		</tbody>
		</table>
		<div>
			<%
				if(currentPage > 1) {
			%>	
					<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-dark"><button>이전</button></a>
			<%
				}
				if(currentPage < lastPage) {
			%>	
					<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-dark"><button>다음</button></a>
			<%
				}
			%>
		</div>
		
		<a href="<%=request.getContextPath()%>/index.jsp"><button>처음으로</button></a>
	
</body>
</html>