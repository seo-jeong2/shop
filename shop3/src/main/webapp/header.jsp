<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="#"><img src="img/shopLogo.png" alt="./index.jsp"></a>
		</div>
		<div class="humberger__menu__cart">
			<ul>

				<li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
			</ul>

		</div>
		<div class="humberger__menu__widget">
			<div class="header__top__right__language">
				<div>My menu</div>
				<span class="arrow_carrot-down"></span>
				<ul>
					<li><a href="#">계정관리</a></li>
					<li><a href="#">회원관리</a></li>
					<li><a href="#">상품관리</a></li>
					<li><a href="#">주문관리</a></li>
					<li><a href="#">고객센터</a></li>
				</ul>
			</div>

			<div class="header__top__right__auth">
				<a href="#"><i class="fa fa-user"></i> Login</a>
			</div>
		</div>
		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li class="active"><a href="./index.jsp">HOME</a></li>
				<li><a href="./customergoodsList.jsp">SHOP</a></li>
				<li><a href="./customerOrderList.jsp">ORDERS</a></li>
				<li><a href="./adminNoticeList.jsp">CONTACT</a></li>
				<li><a href="./adminIndex.jsp">MY PAGE</a></li>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
		<div class="header__top__right__social">
			<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
				class="fa fa-twitter"></i></a>
		</div>
		<div class="humberger__menu__contact">
			<ul>
				<li><i class="fa fa-envelope"></i>chusj12@hanmail.net</li>
				<li>Shopping for Nutrients</li>
			</ul>
		</div>
	</div>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="header__top__left">
							<ul>
								<li><i class="fa fa-envelope"></i>chusj12@hanmail.net</li>
								<li>Shopping for Nutrients</li>
							</ul>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
							<div class="header__top__right__social">
								<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a>
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
								<a href="./loginForm.jsp"><i class="fa fa-user"></i>Login</a>
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
						<a href="./index.jsp"><img src="img/shopLogo.png"
							alt="./index.jsp"></a>
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