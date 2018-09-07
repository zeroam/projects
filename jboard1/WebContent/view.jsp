<%@page import="kr.co.jboard1.vo.BoardVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.jboard1.vo.ConnectDataBase"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");

	String seq = request.getParameter("seq");
	
	ConnectDataBase conn = new ConnectDataBase();
	BoardVO vo = null;
	ResultSet rs = conn.executeQuery("SELECT * FROM JB_BOARD WHERE seq='"+seq+"';");
	if(rs.next()) {
		vo = BoardVO.initBoard(rs);
	}
	if(rs!=null) rs.close();
	if(conn!=null) conn.close();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>글보기</title> 
		<link rel="stylesheet" href="./css/style.css" />
	</head>
	<body>
		<div id="board">
			<h3>글보기</h3>
			<div class="view">
				<form action="#" method="post">
					<table>
						<tr>
							<td>제목</td>
							<td><input type="text" name="subject" value="<%= vo.getTitle() %>" readonly />
							</td>
						</tr>
						<!-- 
						<tr>
							<td>첨부파일</td>
							<td>
								<a href="#">테스트.hwp</a>
								<span>3회 다운로드</span>
							</td>
						</tr>
						 -->						
						<tr>
							<td>내용</td>
							<td>
								<textarea name="content" rows="20" readonly><%= vo.getContent() %></textarea>
							</td>
						</tr>
					</table>
					<div class="btns">
						<a href="./proc/delete.jsp?seq=<%= seq %>" class="cancel del">삭제</a>
						<a href="#" class="cancel mod">수정</a>
						<a href="./list.jsp" class="cancel">목록</a>
					</div>
				</form>
			</div><!-- view 끝 -->
			
			<!-- 댓글리스트 -->
			<section class="comments">
				<h3>댓글목록</h3>
				
				<div class="comment">
					<span>
						<span>홍길동</span>
						<span>18-03-01</span>
					</span>
					<textarea>테스트 댓글입니다.</textarea>
					<div>
						<a href="#" class="del">삭제</a>
						<a href="#" class="mod">수정</a>
					</div>
				</div>
			
				<p class="empty">
					등록된 댓글이 없습니다.
				</p>
				
			</section>
			
			<!-- 댓글쓰기 -->
			<section class="comment_write">
				<h3>댓글쓰기</h3>
				<div>
					<form action="#" method="post">
						<textarea name="comment" rows="5"></textarea>
						<div class="btns">
							<a href="#" class="cancel">취소</a>
							<input type="submit" class="submit" value="작성완료" />
						</div>
					</form>
				</div>
			</section>
		</div><!-- board 끝 -->
	</body>

</html>










