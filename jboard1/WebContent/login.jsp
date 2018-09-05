<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String reg = request.getParameter("reg");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<link rel="stylesheet" href="./css/style.css" />
		<script>
			var reg = "<%= reg %>";
			if(reg == "success") {
				alert("회원가입이 완료되었습니다.")
			} else if(reg == "fail") {
				alert("일치하는 회원이 없습니다.\n다시 확인 바랍니다.")
			}
		</script>
	</head>
	<body>
		<div id="member">
			<section class="login">		
				<form action="./proc/login.jsp" method="post">
					<table>
						<tr>
							<td><img src="./img/login_ico_id.png" alt="아이디" /></td>
							<td><input type="text" name="id" required placeholder="아이디 입력" autocomplete="off" /></td>
						</tr>
						<tr>
							<td><img src="./img/login_ico_pw.png" alt="비밀번호" /></td>
							<td><input type="password" name="pw" required placeholder="비밀번호 입력" /></td>
						</tr>
					</table>
					<input type="submit" class="./proc/login.jsp" value="로그인"/>
				</form>			
				
				<div class="info">
					<h3>회원로그인 안내</h3>
					<p>아직 회원이 아니시면 회원으로 가입하세요.</p>
					<div><a href="./terms.jsp">회원가입</a></div>
				</div>			
			</section>
		</div>
	</body>
</html>