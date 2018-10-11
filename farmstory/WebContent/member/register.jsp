<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp" %>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="/farmstory/js/validation.js"></script>
<script src="/farmstory/js/check.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/farmstory/js/zipcode.js"></script>
<body>
	<div id="member">
		<section class="register">
			<form action="/farmstory/member/register.do" method="POST">
				<section>
					<table>
						<caption>사이트 이용정보 입력</caption>
						<tr>
							<td>아이디</td>
							<td><input type="text" name="id" placeholder="아이디를 입력"
								required
							/> <span class="resultId"></span></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pw1" placeholder="비밀번호를 입력"
								required
							/></td>
						</tr>
						<tr>
							<td>비밀번호확인</td>
							<td><input type="password" name="pw2" placeholder="비밀번호를 확인"
								required
							/> <span class="resultPw"></span></td>
						</tr>
					</table>
				</section>
				<section>
					<table>
						<caption>개인정보 입력</caption>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" placeholder="이름을 입력"
								required
							/></td>
						</tr>
						<tr>
							<td>별명</td>
							<td><span class="info">공백없이 한글, 영문, 숫자만 입력가능</span>
								<div>
									<input type="text" name="nick" placeholder="별명을 입력" required />
								</div> <span class="resultNick"></span></td>
						</tr>
						<tr>
							<td>EMAIL</td>
							<td><input type="email" name="email" placeholder="이메일을 입력"
								required
							/> <span class="resultEmail"></span></td>
						</tr>
						<tr>
							<td>휴대폰</td>
							<td><input type="text" name="hp" placeholder="-포함 13자리를 입력"
								maxlength="13" required
							/> <span class="resultHp"></span></td>
						</tr>
						<tr>
							<td>주소</td>
							<td>
								<div>
									<input type="text" name="zip" id="zip" placeholder="우편번호"
										readonly
									/>
									<button type="button" class="btnFind" onclick="zipcode()">주소검색</button>
								</div>
								<div>
									<input type="text" name="addr1" id="addr1" size="50"
										placeholder="주소를 검색하세요." readonly
									/>
								</div>
								<div>
									<input type="text" name="addr2" id="addr2" size="50"
										placeholder="상세주소를 입력하세요."
									/>
								</div>
							</td>
						</tr>
					</table>
				</section>
				<div>
					<a href="/farmstory" class="cancel">취소</a> <input
						type="submit" class="join" value="회원가입"
					/>
				</div>
			</form>
		</section>
	</div>
<%@ include file="../tail.jsp" %>