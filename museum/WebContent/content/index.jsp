<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<!-- main -->
<main> <!-- section -->
<section id="sec-pic">
	<div id="div-pic">
		<div class="img_text0">
			<div></div>
		</div>
		<div class="quick_link">
			<div class="quick_link_wrap">
				<a href="#">
					<div>
						<img src="./img/quick0_on.png" alt="">
						<p>위치/교통편</p>
					</div>
				</a> <a href="#">
					<div>
						<img src="./img/quick1_on.png" alt="">
						<p>층별안내</p>
					</div>
				</a> <a href="#">
					<div>
						<img src="./img/quick2_on.png" alt="">
						<p>편의시설</p>
					</div>
				</a> <a href="#">
					<div>
						<img src="./img/quick3_on.png" alt="">
						<p>단체관람</p>
					</div>
				</a> <a href="#">
					<div>
						<img src="./img/quick4_on.png" alt="">
						<p>장애인관람</p>
					</div>
				</a> <a href="#" class="question">
					<div>
						<img src="./img/quick5_on.png" alt="">
						<p>문의하기</p>
					</div>
				</a>
			</div>
		</div>
		<div class="plan">
			<div class="plan_wrap">
				<button id=btnOpenLayer>
					<p><span class="month">월</span>.<span class="day">일</span></p>
					<p>전시관일정</p>
				</button>
				<div class="plan_layer on">
					<ul>
						<li><span class="year">년</span>.<span class="month">월</span>.<span class="day">일</span></li>
						<li>오늘의 일정</li>
						<li>...</li>
					</ul>
					<div class="more_box">
						<a href="#">더보기 +</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- section -->
<section id="sec-info">
	<div class="inside">
		<div class="inside-grid">
			<!--그리드 영역(폰트 0)-->
			<div class="multi-col">
				<div class="index_titl0">사이버전시</div>
				<div class="col_pic">
					<a href="#"> <img src="./img/img6.png" alt="">
					</a>
				</div>
			</div>
			<div class="multi-col">
				<div>
					<div class="index_titl0">운영시간</div>
					<div class="col_pic time_wrap">
						<div class="time_top">
							<div></div>
							<div>
								<p><span class="month">월</span>.<span class="day">일</span>(<span class="day_t">요일</span>)</p>
								<p>
									<span>오전</span> 09:30-<span>오후</span> 05:30
								</p>
							</div>
						</div>
						<div class="time_body">
							<div>
								<p>화~일요일</p>
								<p>휴관일</p>
							</div>
							<div>
								<p>오전 9:30 - 오후 5:30</p>
								<p>매주 월요일 정기 휴관,</p>
								<p>1월 1일, 설날.추석 연휴</p>
								<p>전시관장이 정하는 휴관일</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="multi-col">
				<div>
					<div class="index_titl0">교육프로그램</div>
					<div class="col_pic program"></div>
				</div>
			</div>
			<div class="multi-col">
				<div>
					<div class="index_titl0">홍보영상</div>
					<div class="col_pic">
						<a href="#"> <img src="./img/img7.png" alt="">
						</a>
					</div>
				</div>
			</div>
			<div class="multi-col">
				<div>
					<div class="index_titl0">문화행사</div>
					<div class="col_pic">
						<a href="#">
							<div class="back_img"></div>
							<div class="back_text">문화행사 관련 글입니다. 길이는 늘어나면 히든처리 됩니다.</div>
						</a>
					</div>
				</div>
			</div>
			<div class="multi-col">
				<div>
					<div class="index_titl0">전시관소식</div>
					<div class="col_pic info">
						<ul>
							<li><a href="#">[교육안내]<국토발전문화대학> 교육생 모집중
									관심있으신분은 연락주세요</a><span>2018.10.12</span></li>
							<li><a href="#">[교육안내]<국토발전문화대학> 교육생 모집중
									관심있으신분은 연락주세요</a><span>2018.10.12</span></li>
							<li><a href="#">[교육안내]<국토발전문화대학> 교육생 모집중
									관심있으신분은 연락주세요</a><span>2018.10.12</span></li>
							<li><a href="#">[교육안내]<국토발전문화대학> 교육생 모집중
									관심있으신분은 연락주세요</a><span>2018.10.12</span></li>
							<li><a href="#">[교육안내]<국토발전문화대학> 교육생 모집중
									관심있으신분은 연락주세요</a><span>2018.10.12</span></li>
							<li><a href="#">[교육안내]<국토발전문화대학> 교육생 모집중
									관심있으신분은 연락주세요</a><span>2018.10.12</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
</main>
<%@ include file="./tail.jsp"%>