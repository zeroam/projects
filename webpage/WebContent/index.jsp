<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SandBox</title>


<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/grayscale.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/loginstyle.css">
<style>
/* 헤더 영역 css */
#page-top>header {
	overflow: hidden;
	padding: 0px;
	height: 100vh;
}

#page-top>header>video {
	width: 100%;
	position: absolute;
	min-width: 1650px;
}

#page-top>header>div>div {
	z-index: 100;
}

#page-top > header > div > div > h2:nth-child(2) {
	margin-bottom: 1em!important;
}
#page-top > header > div > div > h2:nth-child(3) {
	margin-bottom: 0.5em!important;
	font-size: 1.5em;
}
/* 로그인 폼 css */
#login>div {
	margin-top: -150px;
	background: none;
	min-height: 450px;
	box-shadow: none;
}

#login>div>div {
	background: none;
}
/* prjects a태그 */
#projects a {
	display: block;
	width: 100%;
	height: 100%;
	font-size: 0;
}
/* 경고창 */
.alert {
	position: fixed;
	z-index: 110;
	width: 100%;
	top: 64px;
	text-align: -webkit-center;
}

.alert-error {
	background: lightcoral;
}

#page-top > .alert.on {
	display: block;
}

#page-top > .alert.off {
	display: none;
}

</style>

<!-- custom script -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/check.js"></script>
<script>

	$(function(){
		
		var close = $('#page-top > .alert > a');
		close.click(function(){
			
			$(this).parent().removeClass('on').addClass('off');
			
			return false;
			
		});
		
		var status = "${status}";
		if(status == "success") {
			$('#page-top > .alert-success > span').text('로그인 성공');
			$('#page-top > .alert-success').removeClass('off').addClass('on');
		}
		
		var regis = "${regis}";
		if(regis == "success") {
			$('#page-top > .alert-success > span').text('회원가입 성공');
			$('#page-top > .alert-success').removeClass('off').addClass('on');
		}
		
		printClock();
		
	});
	
	function printClock() {
		var clock = document.getElementById("clock");
		var date = new Date();
		var hours = addZeros(date.getHours(), 2);
		var minutes = addZeros(date.getMinutes(), 2);
		var seconds = addZeros(date.getSeconds(), 2);
		
		clock.innerHTML = hours+":"+minutes+":"+seconds;
		setTimeout("printClock();", 1000)
	}
	
	function addZeros(num, digit) {
		var zero = "";
		num = num.toString();
		if(num.length < digit) {
			zero += "0";
		}
		return zero + num;
	}

</script>


</head>

<body id="page-top">
	<!-- 경고창 -->
	<!-- 에러 -->
	<div class="alert alert-error off">
		<a class="close" data-dismiss="alert"> × </a> 
		<span>메세지 내용</span>
	</div>
	
	<!-- 성공 -->
	<div class="alert alert-success off">
		<a class="close" data-dismiss="alert"> × </a> 
		<span>메세지 내용</span>
	</div>
	<!-- 정보 -->
	<div class="alert alert-info off">
		<a class="close" data-dismiss="alert"> × </a> 
		<span>메세지 내용</span>
	</div>
 	
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">Mainpage</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<c:if test="${login != true}">
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="#login">Login</a></li>
					</c:if>
					<c:if test="${login == true}">
						<li class="nav-item"><a class="nav-link js-scroll-trigger"
							href="./member/logout.do">Logout</a></li>
					</c:if>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#projects">Projects</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#signup">Contact</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="blog.do">Blog</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Header -->
	<header class="masthead">
		<video class="bgvid" autoplay="autoplay" muted="muted" preload="auto"
			loop="">
			<source src="img\leif_eliasson--glaciartopp.webm" type="video/webm">
		</video>
		<c:if test="${login != true}">
			<div class="container d-flex h-100 align-items-center">
				<div class="mx-auto text-center">
					<h1 class="mx-auto my-0 text-uppercase">Welcome!</h1>
					<h2 class="text-white-50 mx-auto mt-2 mb-5">
						Welcome to my sand-box page<br /> Please enjoy my stuff<br /> |
						id : test | password : 1234 |
					</h2>
					<h2 class="text-white-50 mx-auto mt-2 mb-5" id='clock'>
						Clock
					</h2>
					<a href="#login" class="btn btn-primary js-scroll-trigger">Login</a>
				</div>
			</div>
		</c:if>
		<c:if test="${login == true}">
			<div class="container d-flex h-100 align-items-center">
				<div class="mx-auto text-center">
					<h1 class="mx-auto my-0 text-uppercase">Hi,${member.user}</h1>
					<h2 class="text-white-50 mx-auto mt-2 mb-5">How about looking
						around my projects?</h2>
					<a href="#projects" class="btn btn-primary js-scroll-trigger">Projects</a>
				</div>
			</div>
		</c:if>
	</header>

	<c:if test="${login != true}">
		<!-- Login Section -->
		<section id="login" class="about-section text-center">
			<div class="login-wrap">
				<div class="login-html">
					<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label
						for="tab-1" class="tab">Sign In</label> <input id="tab-2"
						type="radio" name="tab" class="sign-up"><label for="tab-2"
						class="tab">Sign Up</label>
					<div class="login-form">
						<div class="sign-in-htm">
							<form>
								<div class="group">
									<label for="user" class="label">Username</label> <input
										id="sgi-user" name="sgi-user" type="text" class="input">
								</div>
								<div class="group">
									<label for="pass" class="label">Password</label> <input
										id="sgi-pass" name="sgi-pass" type="password" class="input"
										data-type="password">
								</div>
								<div class="group">
									<input id="check" type="checkbox" class="check" checked>
									<label for="check"><span class="icon"></span> Keep me
										Signed in</label>
								</div>
								<div class="group">
									<input type="submit" class="button" value="Sign In">
								</div>
								<div class="hr"></div>
								<div class="foot-lnk">
									<a href="#forgot">Forgot Password?</a>
								</div>
							</form>
						</div>
						<div class="sign-up-htm">
							<form action="./member/register.do" method="post">
								<div class="group">
									<label for="user" class="label">Username</label> <input
										id="user" name="user" type="text" class="input"> <span
										class="resultId"></span>
								</div>
								<div class="group">
									<label for="pass" class="label">Password</label> <input
										id="sgu-pass1" name="pass" type="password" class="input"
										data-type="password">
								</div>
								<div class="group">
									<label for="pass" class="label">Repeat Password</label> <input
										id="sgu-pass2" name="pass1" type="password" class="input"
										data-type="password">
								</div>
								<div class="group">
									<label for="pass" class="label">Email Address</label> <input
										id="email" name="email" type="text" class="input"> <span
										class="resultEmail"></span>
								</div>
								<div class="group">
									<input type="submit" class="button" value="Sign Up">
								</div>
								<div class="hr"></div>
								<div class="foot-lnk">
									<label for="tab-1"><a href="">Already Member?</a></label>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<img src="img/ipad.png" class="img-fluid" alt="">
		</section>
	</c:if>
	<!-- Projects Section -->
	<section id="projects" class="projects-section bg-light">
		<div class="container">
			<!-- 			Featured Project Row
			<div class="row align-items-center no-gutters mb-4 mb-lg-5">
				<div class="col-xl-8 col-lg-7">
					<img class="img-fluid mb-3 mb-lg-0" src="img/bg-masthead.jpg"
						alt="">
				</div>
				<div class="col-xl-4 col-lg-5">
					<div class="featured-text text-center text-lg-left">
						<h4>Shoreline</h4>
						<p class="text-black-50 mb-0">Grayscale is open source and MIT
							licensed. This means you can use it for any project - even
							commercial projects! Download it, customize it, and publish your
							website!</p>
					</div>
				</div>
			</div>

			Project One Row
			<div class="row justify-content-center no-gutters mb-5 mb-lg-0">
				<div class="col-lg-6">
					<img class="img-fluid" src="img/demo-image-01.jpg" alt="">
				</div>
				<div class="col-lg-6">
					<div class="bg-black text-center h-100 project">
						<div class="d-flex h-100">
							<div class="project-text w-100 my-auto text-center text-lg-left">
								<h4 class="text-white">Misty</h4>
								<p class="mb-0 text-white-50">An example of where you can
									put an image of a project, or anything else, along with a
									description.</p>
								<hr class="d-none d-lg-block mb-0 ml-0">
							</div>
						</div>
					</div>
				</div>
			</div>

			Project Two Row
			<div class="row justify-content-center no-gutters">
				<div class="col-lg-6">
					<img class="img-fluid" src="img/demo-image-02.jpg" alt="">
				</div>
				<div class="col-lg-6 order-lg-first">
					<div class="bg-black text-center h-100 project">
						<div class="d-flex h-100">
							<div class="project-text w-100 my-auto text-center text-lg-right">
								<h4 class="text-white">Mountains</h4>
								<p class="mb-0 text-white-50">Another example of a project
									with its respective description. These sections work well
									responsively as well, try this theme on a small screen!</p>
								<hr class="d-none d-lg-block mb-0 mr-0">
							</div>
						</div>
					</div>
				</div>
			</div> -->
			<!-- jboard2 project -->
			<div class="row justify-content-center no-gutters mb-5 mb-lg-0">
				<div class="col-lg-6">
					<a href="/jboard2/index.do" target="_blank"> <img
						class="img-fluid" src="img/jboard2.png" alt="">
					</a>
				</div>
				<div class="col-lg-6">
					<div class="bg-black text-center h-100 project">
						<div class="d-flex h-100">
							<div class="project-text w-100 my-auto text-center text-lg-left">
								<h4 class="text-white">게시판</h4>
								<p class="mb-0 text-white-50">게시판 구현</p>
								<hr class="d-none d-lg-block mb-0 ml-0">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- farmstory project -->
			<div class="row justify-content-center no-gutters">
				<div class="col-lg-6">
					<a href="/farmstory/index.do" target="_blank"> <img
						class="img-fluid" src="img/farmstory.png" alt="">
					</a>
				</div>
				<div class="col-lg-6 order-lg-first">
					<div class="bg-black text-center h-100 project">
						<div class="d-flex h-100">
							<div class="project-text w-100 my-auto text-center text-lg-right">
								<h4 class="text-white">Farmstory</h4>
								<p class="mb-0 text-white-50">Another example of a project
									with its respective description. These sections work well
									responsively as well, try this theme on a small screen!</p>
								<hr class="d-none d-lg-block mb-0 mr-0">
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</section>
	<!-- Signup Section -->
	<section id="signup" class="signup-section">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-lg-8 mx-auto text-center">

					<i class="far fa-paper-plane fa-2x mb-2 text-white"></i>
					<h2 class="text-white mb-5">Subscribe to receive updates!</h2>

					<form class="form-inline d-flex">
						<input type="email"
							class="form-control flex-fill mr-0 mr-sm-2 mb-3 mb-sm-0"
							id="inputEmail" placeholder="Enter email address...">
						<button type="submit" class="btn btn-primary mx-auto">Subscribe</button>
					</form>

				</div>
			</div>
		</div>
	</section>
	<!-- Contact Section -->
	<section class="contact-section bg-black">
		<div class="container">

			<div class="row">

				<div class="col-md-4 mb-3 mb-md-0">
					<div class="card py-4 h-100">
						<div class="card-body text-center">
							<i class="fas fa-map-marked-alt text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Address</h4>
							<hr class="my-4">
							<div class="small text-black-50">4923 Market Street,
								Orlando FL</div>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-3 mb-md-0">
					<div class="card py-4 h-100">
						<div class="card-body text-center">
							<i class="fas fa-envelope text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Email</h4>
							<hr class="my-4">
							<div class="small text-black-50">
								<a href="#">hello@yourdomain.com</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4 mb-3 mb-md-0">
					<div class="card py-4 h-100">
						<div class="card-body text-center">
							<i class="fas fa-mobile-alt text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Phone</h4>
							<hr class="my-4">
							<div class="small text-black-50">+1 (555) 902-8832</div>
						</div>
					</div>
				</div>
			</div>

			<div class="social d-flex justify-content-center">
				<a href="#" class="mx-2"> <i class="fab fa-twitter"></i>
				</a> <a href="#" class="mx-2"> <i class="fab fa-facebook-f"></i>
				</a> <a href="#" class="mx-2"> <i class="fab fa-github"></i>
				</a>
			</div>

		</div>
	</section>
	<!-- Footer -->
	<footer class="bg-black small text-center text-white-50">
		<div class="container">Copyright &copy; Your Website 2018</div>
	</footer>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for this template -->
	<script src="js/grayscale.min.js"></script>
	<script>
		
	</script>
</body>

</html>
