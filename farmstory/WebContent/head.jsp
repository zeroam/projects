<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>팜스토리</title>
    <link rel="stylesheet" href="/farmstory/css/style.css"/>
    <link rel="stylesheet" href="/farmstory/css/style2.css"/>
  </head>
  <body>
    <div id='wrapper'>
      <header>
        <a href="/farmstory" class='logo'><img src="/farmstory/img/logo.png" alt="로고"/></a>
        <c:if test="${login == true}">
			<p>
				${member.nick} 님 반갑습니다.
				<a href="/farmstory/member/logout.do">[로그아웃 |</a>
		        <a href="">고객센터]</a>
			</p>        
        </c:if>
        <c:if test="${login != true}">
	        <p>
	          <a href="/farmstory">HOME |</a>
	          <a href="/farmstory/member/login.do">로그인 |</a>
	          <a href="/farmstory/member/terms.do">회원가입 |</a>
	          <a href="">고객센터</a>
	        </p>
        </c:if>
        <img src="/farmstory/img/head_txt_img.png" alt="3만원 이상 구매시..."/>
        <ul class='gnb'>
          <li><a href="/farmstory/introduction/hello.do">팜스토리 소개</a></li>
          <li><a href="/farmstory/board/list.do?gr=market&cate=market">장보기</a></li>
          <li><a href="/farmstory/board/list.do?gr=story&cate=croptalk">농작물 이야기</a></li>
          <li><a href="/farmstory/board/list.do?gr=event&cate=event">이벤트</a></li>
          <li><a href="/farmstory/board/list.do?gr=community&cate=notice">커뮤니티</a></li>
        </ul>
      </header>