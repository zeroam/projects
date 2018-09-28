<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>var login = Boolean("${login}");</script>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>글목록</title> 
		<link rel="stylesheet" href="/jboard2/css/style.css" />
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="/jboard2/js/listLoginCheck.js"></script>
	</head>
	<body>
		<div id="board">
			<h3>글목록</h3>
			<!-- 리스트 -->
			<div class="list">
				<p class="logout">${ sessionScope.member.nick }님! 반갑습니다. <a href="/jboard2/member/logout.do">[로그아웃]</a><p>
				<table>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>글쓴이</td>
						<td>날짜</td>
						<td>조회</td>
					</tr>
					<c:forEach var="vo" items="${ list }">
						<tr>
							<td>${startNum}</td>
							<!-- vo객체의 seq와 현재 페이지를 기반으로 데이터 요청 -->
							<td><a href="/jboard2/view.do?seq=${vo.seq}&page=${page}" class="title">${vo.title}</a>&nbsp;[${vo.comment}]</td>
							<td>${vo.nick}</td>
							<td>${vo.rdate.substring(2,10)}</td>
							<td>${vo.hit}</td>
						</tr>
						<c:set var="startNum" value="${startNum-1}" />
					</c:forEach>
				</table>
			</div>
			<!-- 페이징 -->
			<nav class="paging">
				<span> 
				<c:if test="${groupStart > 1}">
					<a href="/jboard2/list.do?page=${groupStart-1}" class="prev">이전</a>
				</c:if>
				<a href="/jboard2/list.do?page=${prepage}"><</a>
				<c:forEach var="i" begin="${groupStart}" end="${groupEnd}">
					<a href="/jboard2/list.do?page=${i}" class="${i==page ? 'current':''} num">${i}</a>
				</c:forEach>
				<a href="/jboard2/list.do?page=${postpage}">></a>
				<c:if test="${groupEnd < total_page }">
					<a href="/jboard2/list.do?page=${groupEnd+1}" class="next">다음</a>
				</c:if>
				
				</span>
			</nav>
			<a href="/jboard2/write.do" class="btnWrite">글쓰기</a>
		</div>
	</body>
</html>