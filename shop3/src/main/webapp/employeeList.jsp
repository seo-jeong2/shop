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
 if (session.getAttribute("user") == null ) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
		System.out.println("관리자로 로그인하세요");
		return;
	}	
	
 //페이징
	int currentPage = 1;
	if (request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	final int rowPerPage= 10;
	
	EmployeeService employeeService = new EmployeeService();
	List<Employee> list = new ArrayList<Employee>();
	list = employeeService.getEmployeeList(rowPerPage, currentPage);
	
	int lastPage = employeeService.getEmployeeLastPage(rowPerPage);	

	
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
	

	<h1>사원 관리</h1>
	<a href="<%=request.getContextPath()%>/addEmployee.jsp">사원등록</a>
	
	<body>	
		<table border="1">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>수정일</th>
					<th>등록일</th>
					<th>활동여부</th>
				</tr>
			</thead>
			<tbody>
			<%
				for(Employee e : list) {
			%>
					<tr>
						<td><%=e.getEmployeeId()%></td>
						<td><%=e.getEmployeeName()%></td>
						<td><%=e.getUpdateDate()%></td>
						<td><%=e.getCreateDate()%></td>
						
						
					<td>
									<form action="<%=request.getContextPath()%>/admin/updateEmployeeActiveAction.jsp" method="post">
										<input type="hidden" name="employeeId" value="<%=e.getEmployeeId()%>">
										<select name="active">
											<%
												if(e.getActive().equals("N")) {
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
					<a href="<%=request.getContextPath()%>/employeeList.jsp?currentPage=<%=currentPage-1%>" class="btn btn-dark">이전</a>
			<%
			
				}
				if(currentPage < lastPage) {
			%>	
					<a href="<%=request.getContextPath()%>/employeeList.jsp?currentPage=<%=currentPage+1%>" class="btn btn-dark">다음</a>
			<%
				}
			%>
		</div>
		<a href="<%=request.getContextPath()%>/index.jsp">처음으로</a>
	
</body>
</html>


	