<%@page import="kr.co.jboard1.dao.BoardDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.jboard1.vo.BoardVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.jboard1.vo.ConnectDataBase"%>
<%@page import="kr.co.jboard1.vo.MemberVO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파라미터 수신
	request.setCharacterEncoding("UTF-8");
	String pg = request.getParameter("pg");

	MemberVO user = (MemberVO) session.getAttribute("user");

	BoardDAO dao = BoardDAO.getInstance();
	//Start 값 계산, 현재 페이지
	int p = dao.getLimit(pg);
	//전체 글 갯수
	int total = dao.getTotalCount();
	//전체 페이지 계산
	int paging = dao.getPage();
	//글 목록
	List<BoardVO> list = dao.list(p);

	
	//이전 페이지
	int prePage = 1;
	if(p > 1) {
		prePage = p - 1;
	}
	//다음 페이지
	int nextPage = paging;
	if(p < paging) {
		nextPage = p + 1;
	}
	//글 번호
	int num = total - (p-1)*10;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>글목록</title>
<link rel="stylesheet" href="./css/style.css" />
</head>
<body>
	<div id="board">
		<h3>글목록</h3>
		<!-- 리스트 -->
		<div class="list">
			<p class="logout"><%=user.getNick()%>님! 반갑습니다. <a
					href="./proc/logout.jsp"
				>[로그아웃]</a>
			<p>
			<table>
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>글쓴이</td>
					<td>날짜</td>
					<td>조회</td>
				</tr>
				<%
					//5단계
					for (BoardVO vo : list) {
				%>
				<tr>
					<td><%= num-- %></td>
					<td><a href="view.jsp?seq=<%=vo.getSeq()%>"><%=vo.getTitle()%></a>&nbsp;[<%=vo.getComment()%>]</td>
					<td><%=vo.getUid()%></td>
					<td><%=vo.getRdate().substring(2, 10)%></td>
					<td><%=vo.getHit()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
		<!-- 페이징 -->
		<nav class="paging">
			<span> <a href="list.jsp?pg=<%= prePage %>" class="prev">이전</a> <%
 	for (int i = 1; i <= paging; i++) {
 %> <a href="list.jsp?pg=<%=i%>" class="num"><%=i%></a> <%
 	}
 %> <a href="list.jsp?pg=<%= nextPage %>" class="next">다음</a>
			</span>
		</nav>
		<a href="./write.jsp?uid=<%=user.getUid()%>" class="btnWrite">글쓰기</a>
	</div>
</body>
</html>










