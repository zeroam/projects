<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>My Crawler Blog</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-item.css" rel="stylesheet">
<link href="css/grayscale.min.css" rel="stylesheet">
<link rel="stylesheet" href="./css/github-markdown.css">
<style>
html {
	overflow-y: scroll;
}

.col-lg-3 li a {
	border: none;
	color: gray;
}

.col-lg-3 li a:hover {
	color: black;
}

.col-lg-3 ul {
	list-style: none;
	padding: 0;
	display: none;
}

.col-lg-3 ul>li {
	text-align: right;
}

body > div > div > div.col-lg-3 {
	padding-bottom: 15px;
}

body>div>div>div.col-lg-9 {
	padding-top: 30px;
	padding-bottom: 30px;
	min-height: 800px;
}


</style>
<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<script>
	$(function() {

		var menu = $('div.col-lg-3 > div > a.list-group-item');

		menu.click(function(e) {
			e.preventDefault();

			var ul = $(this).next();
			var status = ul.is(':visible');

			if (status) {
				ul.slideUp(400);
				$(this).removeClass('active');
			} else {
				ul.slideDown(400);
				$(this).addClass('active');
			}
		});
	});
</script>
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="index.do">Mainpage</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="/webpage/blog.do">Home <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="https://github.com/zeroam/studynote/wiki" target="_blank">Github Page</a></li>					
				</ul>
			</div>
		</div>
	</nav>

	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<!-- 쿼리문이 들어갈 영역 : 카테고리 -->
			<div class="col-lg-3">
				<h1 class="my-4">Category</h1>
				<div class="list-group">
					<c:forEach var="map" items="${list}">

						<a href="./blog.do?cate=${map.key}" class="list-group-item">${map.key}</a>
						<ul>
							<c:forEach var="vo" items="${map.value}">
								<li><a href="./blog.do?cate=${vo.cate}&title=${vo.title}"
									class="list-group-item">${vo.title}</a></li>
							</c:forEach>
						</ul>
					</c:forEach>
				</div>
			</div>
			<!-- /.col-lg-3 -->
			<!-- 쿼리문이 들어갈 영역 : 컨텐츠 -->
			<div class="col-lg-9">
				<c:if test="${content.cont == null }">
					<h1>
						<strong>Home</strong>
					</h1>
					<hr />
					<br />
					<p>반갑습니다. 저의 크롤러 블로그 페이지에 오신 것을 환영합니다.</p>
					<p>리눅스의 crontab 기능을 활용하여 10분마다 파이썬 코드를 실행해 데이터 베이스를 업데이트 합니다.</p>
					<p>블로그의 글들은 데이터 베이스에 있는 컨텐츠를 불러와 읽고 있습니다.</p>
					<br/><br/>
					<a href="https://github.com/zeroam/studynote/blob/master/content/Home.md" target="_blank">코드 보기</a><br/><br/>
					<a href="https://github.com/zeroam/projects/tree/master/webpage" target="_blank">전체 소스 코드 보기</a>
				</c:if>
				<c:if test="${content.cont != null }">
					<h2>
						<strong>${content.title}</strong>
					</h2>
					<hr />
					<br />
					${content.cont}
				</c:if>
			</div>
			<!-- /.col-lg-9 -->

		</div>

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2017</p>
		</div>
		<!-- /.container -->
	</footer>

</body>

</html>
