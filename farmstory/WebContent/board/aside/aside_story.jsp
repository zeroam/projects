<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section id="sub">
	<div>
		<img src="../img/sub_page_img_tit3.png" alt="CROP TALK">
	</div>
	<section class="croptalk">
		<aside>
			<img src="../img/sub_aside_tit3.png" alt="농작물이야기">
			<ul>
				<li class="${cate == 'croptalk' ? 'on':'' }"><a href="/farmstory/board/list.do?gr=story&cate=croptalk">농작물이야기</a></li>
				<li class="${cate == 'grow' ? 'on':'' }"><a href="/farmstory/board/list.do?gr=story&cate=grow">텃밭가꾸기</a></li>
				<li class="${cate == 'school' ? 'on':'' }"><a href="/farmstory/board/list.do?gr=story&cate=school">귀농학교</a></li>
			</ul>
		</aside>
		<article>
			<nav>
				<img src="../img/sub_page3_tit_${cate}.png" alt="농작물이야기">
				<p>
					Home > 농작물이야기 >
					<c:if test="${cate=='croptalk'}"><span>농작물이야기</span></c:if>
					<c:if test="${cate=='grow'}"><span>텃밭가꾸기</span></c:if>
					<c:if test="${cate=='school'}"><span>귀농학교</span></c:if>
				</p>
			</nav>
			<div></div>
			<!-- 컨텐츠 내용 시작 -->