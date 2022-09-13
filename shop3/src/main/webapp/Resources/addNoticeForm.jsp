<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file ="header.jsp"%>

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
					<h3 class="bottom">공지사항 입력</h3>
					<form action="${pageContext.request.contextPath}/Resources/addNoticeAction.jsp" method="post" >
					 	<table class="table">
					 		<tr>
					 		<th>작성자</th>
							<td><input class="form-control" type="text" name="noticeId"></td>
					 		</tr>
					 		<tr>
					 			<th>제목</th>
					 			<td><input class="form-control" type="text" name="noticeTitle"></td>
					 		</tr>
					 		<tr>
					 			<th>내용</th>
					 			<td><input class="form-control" type="text" name="noticeContent"></td>
					 		</tr>
					 	</table>
					 	</form>
					 	<form action ="${pageContext.request.contextPath}/Resources/addNoticeAction.jsp" method="post">
						<button type="submit" class="site-btn float-right">등록</button>
						</form>
					 	<button type="reset"  class="site-btn float-right" >초기화</button>
					
				</div>
			</div>
		</div>
	</section>


<%@include file="footer.jsp"%>