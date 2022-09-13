<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<style>
.login-container {
	margin-top: 5%;
	margin-bottom: 5%;
}

.login-logo {
	position: relative;
	margin-left: -41.5%;
}

.login-logo img {
	position: absolute;
	width: 20%;
	margin-top: 19%;
	background: #282726;
	border-radius: 4.5rem;
	padding: 5%;
}

.login-form-1 {
	padding: 9%;
	background: #8bc34ad4;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.login-form-1 h3 {
	text-align: center;
	margin-bottom: 12%;
	color: #fff;
}

.login-form-2 {
	padding: 9%;
	background: #9e9e9e;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.login-form-2 h3 {
	text-align: center;
	margin-bottom: 12%;
	color: #fff;
}

.btnSubmit {
	font-weight: 600;
	width: 50%;
	color: #282726;
	background-color: #fff;
	border: none;
	border-radius: 1.5rem;
	padding: 2%;
	margin: auto;
}

.btnSignup {
	color: #fff;
	font-weight: 600;
	text-decoration: none;
}

.btnSignup:hover {
	text-decoration: none;
	color: #fff;
}

.img {
	margin-top: 20px;
	text-align: center;
}
</style>

<meta charset="UTF-8">
<title>Login</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--  https://developers.google.com/speed/libraries#jquery  -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


</head>
<body>
	<div class="img">
		<a href="<%=request.getContextPath()%>/Resources/mainPage.jsp"><img
			src="<%=request.getContextPath()%>/Resources/img/shopLogo.png" alt="mainPage"></a>
	</div>

	<div class="container login-container">
		<div class="row">
			<div class="col-md-6 login-form-1">
				<form id="customerForm"
					action="<%=request.getContextPath()%>/Resources/customerloginAction.jsp"
					method="post">
					<h3>고객 로그인</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디"
							id="customerId" name="customerId" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							id="customerPass" name="customerPass" />
					</div>
					<div class="form-group">
						<input type="submit" class="btnSubmit" id="customerBtn"
							value="Login" />
					</div>
					<div class="form-group">
						<a href="/Resources/addCustomer.jsp" class="btnSignup">Sign Up</a>
					</div>
				</form>
			</div>



			<div class="col-md-6 login-form-2">
				<form id="employeeForm"
					action="<%=request.getContextPath()%>/Resources/employeeloginAction.jsp"
					method="post">
					<h3>관리자 로그인</h3>
					<div class="form-group">
						<input type="text" class="form-control" id="employeeId"
							name="employeeId" placeholder="아이디" value="" />
					</div>
					<div class="form-group">
						<input type="password" class="form-control" id="employeePass"
							name="employeePass" placeholder="비밀번호" value="" />
					</div>
					<div class="form-group">
						<input type="submit" class="btnSubmit" id="employeeBtn"
							value="Login" />
					</div>
					<div class="form-group">
						<a href="/Resources/addEmployee.jsp" class="btnSignup">Sign Up</a>

					</div>
				</form>
			</div>
		</div>
	</div>



</body>

<script>
	$('#customerBtn').click(function() {
		if ($('#customerId').val() == '') {
			window.alert('고객 아이디를 입력하세요');
		} else if ($('#customerPass').val() == '') {
			window.alert('고객 비밀번호를 입력하세요');
		} else {
			customerForm.submit();
		}
	});

	$('#employeeBtn').click(function() {
		if ($('#employeeId').val() == '') {
			window.alert('관리자 아이디를 입력하세요');
		} else if ($('#employeePass').val() == '') {
			window.alert('관리자 비밀번호를 입력하세요');
		} else {
			employeeForm.submit();
		}
	});
</script>

</html>