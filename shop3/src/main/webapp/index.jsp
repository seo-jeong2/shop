<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "vo.*" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<!--Get your own code at fontawesome.com-->
<title>MY HEALTH</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
	

<!-- Css Styles -->
<link rel="stylesheet" href="./Resources/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="./Resources/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="./Resources/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="./Resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="./Resources/css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="./Resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="./Resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="./Resources/css/style.css" type="text/css">
</head>


<%
	if(session.getAttribute("user") == null) { 
		response.sendRedirect(request.getContextPath()+"/Resources/loginForm.jsp");
		System.out.println("로그인하세요");
		return;
	} 		
%>    

    	 
<body><!-- 고객, 관리자 구분 -->
	
	<%
	if(session.getAttribute("user").equals("Employee")) {

	%>
	
	
	<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>    
	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i><%=session.getAttribute("name")%> 님 반갑습니다.</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
							<div class="header__top__right__social">
								
							</div>
							<div class="header__top__right__language">
								<div>My menu</div>
								<span class="arrow_carrot-down"></span>
								<ul>
									<li><a href="./employeeList.jsp">계정관리</a></li>
									<li><a href="./adminCustomerList.jsp">회원관리</a></li>
									<li><a href="./adminGoodsList.jsp">상품관리</a></li>
									<li><a href="./adminOrderList.jsp">주문관리</a></li>
									<li><a href="./adminNoticeList.jsp">고객센터</a></li>
								</ul>
							</div>
							<div class="header__top__right__auth">
								<a href="./logout.jsp"><i class="fa fa-user"></i>Log Out</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="./index.jsp"><img src="./Resources/img/shopLogo.png"
							alt="MY HEALTH"></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="./index.jsp">HOME</a></li>
							<li><a href="./customergoodsList.jsp">SHOP</a></li>
							<li><a href="./customerOrderList.jsp">ORDERS</a></li>
							<li><a href="./adminNoticeList.jsp">CONTACT</a></li>
							<li><a href="./adminIndex.jsp">MY PAGE</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">

				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->

	

	<% 
	
	}
	
	%>
	
	
	<!-- 고객 -->
	
	<%
	if(session.getAttribute("user").equals("Customer")){
	
	%>
	
	<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>    
	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i><%=session.getAttribute("name")%> 님 반갑습니다.</li>
								
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
							<div class="header__top__right__social">
							</div>
							<div class="header__top__right__language">
								<div>My menu</div>
								<span class="arrow_carrot-down"></span>
								<ul>
									<li><a href="./customerIndex.jsp">계정관리</a></li>									
									<li><a href="./customerOrderList.jsp">주문관리</a></li>
									<li><a href="./adminNoticeList.jsp">고객센터</a></li>
								</ul>
							</div>
							<div class="header__top__right__auth">
								<a href="./logout.jsp"><i class="fa fa-user"></i>Log Out</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="./index.jsp"><img src="./Resources/img/shopLogo.png"
							alt="./index.jsp"></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li class="active"><a href="./index.jsp">HOME</a></li>
							<li><a href="./Resources/customerGoodsList.jsp">SHOP</a></li>
							<li><a href="./Resources/customerOrderList.jsp">ORDERS</a></li>
							<li><a href="./Resources/adminNoticeList.jsp">CONTACT</a></li>
							<li><a href="./Resources/customerIndex.jsp">MY PAGE</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3">
					<div class="header__cart">
						<ul>
							<li> CART <a href="/adminOrderList.jsp"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->


	

	<%
	}
	
	%>
	
			<!-- Hero Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>Categories</span>
						</div>
						<ul>
							<li><a href="#">보충제</a></li>
							<li><a href="#">식료품</a></li>
							<li><a href="#">목욕 & 개인관리</a></li>
							<li><a href="#">미용</a></li>
							<li><a href="#">반려동물</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					
					<div class="hero__item set-bg" data-setbg="img/hero/banner.png">
						<div class="hero__text">
							<span>Recommend </span>
							<h2>
								Best Seller <br />
							</h2>
							<p>지금바로 인기상품을 만나보세요!</p>
							<a href="./customerGoodsList.jsp" class="primary-btn">자세히 보기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->
	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container">
			<div class="row">
				<div class="categories__slider owl-carousel">
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="img/categories/maca.png">
							<h5>
								<a href="#">보충제</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="img/categories/candies.png">
							<h5>
								<a href="#">식료품</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="img/categories/oil.png">
							<h5>
								<a href="#">목욕 & 개인관리</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="img/categories/form.png">
							<h5>
								<a href="#">미용</a>
							</h5>
						</div>
					</div>
					<div class="col-lg-3">
						<div class="categories__item set-bg"
							data-setbg="img/categories/cat.png">
							<h5>
								<a href="#">반려동물</a>
							</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->

	
	
	
	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<h2>상품 미리보기</h2>
					</div>
					<div class="featured__controls">
						<ul>
							<li class="active" data-filter="*">전체</li>
							<li data-filter=".oranges">식료품</li>
							<li data-filter=".fresh-meat">목욕&개인관리</li>
							<li data-filter=".vegetables">미용</li>
							<li data-filter=".fastfood">반려동물</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row featured__filter">
				<div class="col-lg-3 col-md-4 col-sm-6 mix oranges oranges">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/featured/vitamin1.png">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat fresh-meat">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/featured/body1.png">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix vegetables vegetables">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/featured/beauty1.png">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fastfood fastfood">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/featured/pet1.png">
							<ul class="featured__item__pic__hover">
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#"></a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat fresh-meat">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/featured/body2.png">
							<ul class="featured__item__pic__hover">
								
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix oranges oranges">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/featured/vitamin2.png">
							<ul class="featured__item__pic__hover">
								
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix vegetables vegetables">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/featured/beauty2.png">
							<ul class="featured__item__pic__hover">
								
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6 mix fastfood fastfood ">
					<div class="featured__item">
						<div class="featured__item__pic set-bg"
							data-setbg="img/featured/pet2.png">
							<ul class="featured__item__pic__hover">
								
								<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
							</ul>
						</div>
						<div class="featured__item__text">
							<h6>
								<a href="#">Crab Pool Security</a>
							</h6>
							<h5>$30.00</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Featured Section End -->
	
	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="./index.jsp"><img src="img/shopLogo.png" alt=""></a>
						</div>
						<ul>
							<li>Address: digital-ro 64, GwangMyeong </li>
							<li>Phone: +82 10-7762-6722</li>
							<li>Email: chusj12@hanmail.net</li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
					<div class="footer__widget">
						<h6>Git-Hub</h6>
						<ul>
							<li><a href="https://github.com/seo-jeong2/shop">Choo Seo-jeong</a> @추서정</li>
							
						</ul>
						
					</div>
				</div>
				<div class="col-lg-4 col-md-12">
					<div class="footer__widget">
						<h6>Join Our Newsletter Now</h6>
						<p>Get E-mail updates about our latest shop and special
							offers.</p>
						<form action="#">
							<input type="text" placeholder="Enter your mail">
							<button type="submit" class="site-btn">Subscribe</button>
						</form>
						<div class="footer__widget__social">
							 <a href="#"><i class="fa fa-github"></i></a>
                            <a href="#"><i class='fas'>&#xf542;</i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | This template is made with <i
									class="fa fa-heart" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</p>
						</div>
						<div class="footer__copyright__payment">
							<img src="img/payment-item.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="./Resources/js/jquery-3.3.1.min.js"></script>
	<script src="./Resources/js/bootstrap.min.js"></script>
	<script src="./Resources/js/jquery.nice-select.min.js"></script>
	<script src="./Resources/js/jquery-ui.min.js"></script>
	<script src="./Resources/js/jquery.slicknav.js"></script>
	<script src="./Resources/js/mixitup.min.js"></script>
	<script src="./Resources/js/owl.carousel.min.js"></script>
	<script src="./Resources/js/main.js"></script>



</body>

</html>