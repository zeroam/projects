<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<jsp:include page="./aside/aside_${gr}.jsp" />
<div id="board">
	<h3>글목록</h3>
	<!-- 리스트 -->
	<div class="list">
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
					<td><a href="/farmstory/view.do?seq=${vo.seq}&page=${page}"
						class="title">${vo.title}</a>&nbsp;[${vo.comment}]</td>
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
		<span> <c:if test="${groupStart > 1}">
				<a href="/farmstory/list.do?page=${groupStart-1}" class="prev">이전</a>
			</c:if> <a href="/farmstory/list.do?page=${prepage}"><</a> <c:forEach
				var="i" begin="${groupStart}" end="${groupEnd}">
				<a href="/farmstory/list.do?page=${i}"
					class="${i==page ? 'current':''} num">${i}</a>
			</c:forEach> <a href="/farmstory/list.do?page=${postpage}">></a> <c:if
				test="${groupEnd < total_page }">
				<a href="/farmstory/board/list.do?page=${groupEnd+1}" class="next">다음</a>
			</c:if>> 
	</nav>
	<a href="/farmstory/board/write.do?gr=${gr}&cate=${cate}"
		class="btnWrite">글쓰기</a>
</div>
<!-- 컨텐츠 내용 끝 -->
</article>
</section>
</section>
<%@ include file="../tail.jsp"%>