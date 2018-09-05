<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.jboard1.ConnectDataBase"%>
<%@page import="kr.co.jboard1.Member"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Member user = (Member)session.getAttribute("user");

	String HOST = "jdbc:mysql://192.168.0.178:3306/jcw";
	String USER = "jcw";
	String PASS = "1234";
	
	ConnectDataBase conn = new ConnectDataBase(HOST, USER, PASS);
	ResultSet rs = conn.executeQuery("SELECT * FROM JB_BOARD ORDER BY seq DESC;");
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
				<p class="logout"><%= user.getNick() %>님! 반갑습니다. <a href="./proc/logout.jsp">[로그아웃]</a><p>
				<table>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>글쓴이</td>
						<td>날짜</td>
						<td>조회</td>
					</tr>
				<% 
					while(rs.next()) {
				%>
					<tr>
						<td><%= rs.getString("seq") %></td>
						<td><a href="view.jsp?seq=<%= rs.getString("seq") %>"><%= rs.getString("title") %></a>&nbsp;[<%= rs.getString("comment") %>]</td>
						<td><%= rs.getString("uid") %></td>
						<td><%= rs.getString("rdate").substring(2, 10) %></td>
						<td><%= rs.getString("hit") %></td>
					</tr>
				<%
					}
				%>
				</table>
			</div>
			<!-- 페이징 -->
			<nav class="paging">
				<span> 
				<a href="#" class="prev">이전</a>
				<a href="#" class="num">1</a>
				<a href="#" class="next">다음</a>
				</span>
			</nav>
			<a href="./write.jsp?uid=<%= user.getUid() %>" class="btnWrite">글쓰기</a>
		</div>
	</body>
</html>










