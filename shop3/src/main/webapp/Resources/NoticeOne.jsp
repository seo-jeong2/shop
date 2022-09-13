<%@page import="service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="repository.*"%>
<%@ page import="vo.*"%>


<%
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	
	NoticeService noticeService = new NoticeService();
	Notice notice = null;
	notice = noticeService.getNoticeOne(noticeNo);
	
%>

<%@ include file="header.jsp" %>

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
							<li><a href="${pageContext.request.contextPath}/Resources/faq.jsp">자주묻는질문</a></li>
						</ul>
					</div>
				</div>
    	<div class="col-9">
		<table class="table">
		<tr>
			<td>작성자</td>
			<td><%=notice.getNoticeId()%></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><%=notice.getNoticeTitle()%></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><%=notice.getNoticeContent()%></td>
		</tr>
		<tr>
			<td>날짜</td>
			<td><%=notice.getCreateDate()%></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="submit" class="site-btn float-right">수정</button><a href="/Resources/updateNoticeForm.jsp?noticeNo=<%=notice.getNoticeNo()%>"></a>
					<button type="submit" class="site-btn float-right">삭제</button><a href="/Resources/deleteNoticeForm.jsp?noticeNo=<%=notice.getNoticeNo()%>"></a>
			</td>
		</tr>
	</table>
	</div>
	</div>
	</div>
	</section>
	
<%@include file = "footer.jsp"%>