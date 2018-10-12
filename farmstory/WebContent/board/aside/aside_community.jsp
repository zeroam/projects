<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<section id="sub">
	<div>
		<img src="../img/sub_page_img_tit5.png" alt="Community">
	</div>
	<section class="community">
		<aside>
			<img src="../img/sub_aside_tit5.png" alt="커뮤니티">
			<ul>
				<li class="${cate == 'notice' ? 'on':'' }"><a href="/farmstory/board/list.do?gr=community&cate=notice">공지사항</a></li>
				<li class="${cate == 'menu' ? 'on':'' }"><a href="/farmstory/board/list.do?gr=community&cate=menu">오늘의식단</a></li>
				<li class="${cate == 'chef' ? 'on':'' }"><a href="/farmstory/board/list.do?gr=community&cate=chef">나도요리사</a></li>
				<li class="${cate == 'qna' ? 'on':'' }"><a href="/farmstory/board/list.do?gr=community&cate=qna">1:1고객문의</a></li>
				<li class="${cate == 'faq' ? 'on':'' }"><a href="/farmstory/board/list.do?gr=community&cate=faq">자주묻는질문</a></li>
			</ul>
		</aside>
		<article>
			<nav>
				<img src="../img/sub_page5_tit_chef.png" alt="나도요리사">
				<p>
					Home > 커뮤니티 > <span>나도요리사</span>
				</p>
			</nav>
			<div></div>
			<!-- 컨텐츠 내용 시작 -->