<%@page import="vo.Customer"%>
<%@page import="service.CustomerService"%>
<%@page import="service.EmployeeService"%>
<%@page import="vo.Employee"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Goods"%>
<%@page import="java.util.List"%>
<%@page import="service.GoodsService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 request.setCharacterEncoding("utf-8");

 //관리자로 로그인
 if(session.getAttribute("login"+session.getAttribute("user")) == null){
		response.sendRedirect(request.getContextPath()+"/Resources/loginForm.jsp");
		return;
	}	
	
 //페이징
	int currentPage = 1;
	if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	final int rowPerPage= 10;
	
	CustomerService customerService = new CustomerService();
	List<Customer> list = new ArrayList<Customer>();
	list = customerService.getCustomerList(rowPerPage, currentPage);
	
	int lastPage = customerService.getCustomerLastPage(rowPerPage);	

	
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 메뉴 -->
	
	<ul>
		<li><a href="<%=request.getContextPath()%>/employeeList.jsp">사원관리</a></li>
		<li><a href = "<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a></li>
		<li><a href = "<%=request.getContextPath()%>/admin/adminOrderList.jsp">주문관리</a></li>
		<li><a href = "<%=request.getContextPath()%>/admin/adminCustomerList.jsp">고객관리</a></li>
		<li><a href = "<%=request.getContextPath()%>/admin/adminNoticeList.jsp">공지관리</a></li>
	</ul>
	

	<h1>고객 관리</h1>
	
	<body>	
		<table border="1">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>수정일</th>
					<th>등록일</th>
					<th>활동여부</th>
					<th>회원삭제</th>
					<th>비밀번호초기화</th>
				</tr>
			</thead>
			<tbody>
			<%
				for(Customer c : list) {
			%>
					<tr>
						<td><%=c.getCustomerId()%></td>
						<td><%=c.getCustomerName()%></td>
						<td><%=c.getCustomerAddress()%></td>
						<td><%=c.getCustomerTelephone()%></td>
						<td><%=c.getUpdateDate()%></td>
						<td><%=c.getCreateDate()%></td>	
					<td>
			
							
							<form action="<%=request.getContextPath()%>/admin/updateCustomerActiveAction.jsp" method="post">
										<input type="hidden" name="customerId" value="<%=c.getCustomerId()%>">
										<select name="active">
											<%
												if(c.getActive().equals("N")) {
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
									<button type="submit" class="btn btn-dark">UPDATE</button>
								</form>
								</td>
								
						<td><a href="<%=request.getContextPath()%>/admin/adminDeleteCustomerAction.jsp?customerId=<%=c.getCustomerId()%>"><button>회원삭제</button></a></td>
						<td><a href="<%=request.getContextPath()%>/admin/adminCustomerPwUpdateAction.jsp?customerId=<%=c.getCustomerId()%>"><button>비밀번호초기화</button></a></td>
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
					<a href="<%=request.getContextPath()%>/admin/adminCustomerList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-dark"><button>이전</button></a>
			<%
			
				}
				if(currentPage < lastPage) {
			%>	
					<a href="<%=request.getContextPath()%>/admin/adminCustomerList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-dark"><button>다음</button></a>
			<%
				}
			%>
		</div>
		<a href="<%=request.getContextPath()%>/index.jsp"><button>처음으로</button></a>
	
</body>
</html>


	