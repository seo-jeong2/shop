<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="service.*"%>
<%@ page import="vo.*"%>
<%

if(session.getAttribute("user") == null) { 
	response.sendRedirect(request.getContextPath()+"/Resources/loginForm.jsp");
	System.out.println("로그인하세요");
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

if(list == null) {
	response.sendRedirect(request.getContextPath() + "/Resources/index.jsp");
	return;
}

%>

 <%@ include file = "header.jsp"%>
 
	 <section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>고객센터</span>
						</div>
						<!-- 공지사항 목록출력  -->	
						<ul >
                            <li><a href="${pageContext.request.contextPath}/Resources/adminNoticeList.jsp">공지사항</a></li>
							<li><a href="${pageContext.request.contextPath}/Resources/fag.jsp">자주묻는질문</a></li>
						</ul>
					</div>
				</div>
		<div class="col-9">
		<h3 class="bottom">공지사항</h3>
		<table class="table">
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
						<td><a href="<%=request.getContextPath()%>/Resources/NoticeOne.jsp?noticeNo=<%=n.getNoticeNo()%>">
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
		<form action ="${pageContext.request.contextPath}/Resources/addNoticeForm.jsp" method="post">
		<button type="submit" class="site-btn float-right" >등록</button>
		</form>
		</div>
		</div>
		</div>
		
		
		<div>
			<%
				if(currentPage > 1) {
			%>	
					<a href="<%=request.getContextPath()%>/Resources/admin/adminNoticeList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-dark"><button>이전</button></a>
			<%
				}
				if(currentPage < lastPage) {
			%>	
					<a href="<%=request.getContextPath()%>/Resources/admin/adminNoticeList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-dark"><button>다음</button></a>
			<%
				}
			%>
		</div>
		</section>
	
<%@ include file = "footer.jsp"%>
