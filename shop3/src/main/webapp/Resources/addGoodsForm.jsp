<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="header.jsp"%>



	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>상품관리</span>
						</div>
						<!-- 상품관리 목록출력  -->	
						<ul >
                            <li><a href="<%=request.getContextPath()%>/Resources/admin/adminGoodsList.jsp">상품목록</a></li>
							<li><a href="<%=request.getContextPath()%>/Resources/admin/addGoodsForm.jsp">상품등록</a></li>
						</ul>
					</div>
				</div>
					<div class="col-9">
						<h3 class="bottom">상품 등록</h3>
						<form
							action="<%=request.getContextPath()%>/Resources/admin/addGoodsAction.jsp"
							method="post" enctype="multipart/form-data">
							<table class="table">
								<tr>
									<td>상품 이름</td>
									<td><input class="form-control" type="text" name="goodsName" id="goodsName"></td>
								</tr>
								<tr>
									<td>상품 가격</td>
									<td><input class="form-control" type="text" name="goodsPrice" id="goodsPrice"></td>
								</tr>
								<tr>
									<td>이미지 파일</td>
									<td><input class="form-control" type="file"name="imgFile"></td>
								</tr>
							</table>
							<button type="submit" class="site-btn float-right" >등록</button>
						<button type="reset"  class="site-btn float-right" >초기화</button>
						</form>
					</div>
				</div>
			</div>
			</section>
			<%@ include file="footer.jsp"%>