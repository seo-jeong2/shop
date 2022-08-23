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

NoticeService noticeService = new NoticeService();
List<Notice> list = new ArrayList<Notice>();

list = noticeService.getNoticeListByPage(rowPerPage, currentPage);

int lastPage = noticeService.getLastPage(rowPerPage);

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

	<h1>공지 관리</h1>
	<a href="<%=request.getContextPath()%>/notice/addNoticeForm.jsp"><button>공지입력</button></a>
	
	<body>	
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>수정일</th>
				</tr>
			</thead>
			<tbody>
			<%
				for(Notice n : list) {
			%>
					<tr>
						<td><%=n.getNoticeNo()%></td>
						<td><a href="<%=request.getContextPath()%>/notice/NoticeOne.jsp?noticeNo=<%=n.getNoticeNo()%>">
						<%=n.getNoticeTitle()%></a></td>
						<td><%=n.getNoticeId()%></td>
						<td><%=n.getCreateDate()%></td>
						<td><%=n.getUpdateDate()%></td>
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
					<a href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-dark"><button>이전</button></a>
			<%
				}
				if(currentPage < lastPage) {
			%>	
					<a href="<%=request.getContextPath()%>/admin/adminNoticeList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-dark"><button>다음</button></a>
			<%
				}
			%>
		</div>
		
		<a href="<%=request.getContextPath()%>/index.jsp"><button>처음으로</button></a>
	
</body>
</html>