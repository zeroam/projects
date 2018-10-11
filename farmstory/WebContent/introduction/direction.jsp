<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../head.jsp"%>
<section id="sub">
	<div>
		<img src="../img/sub_page_img_tit1.png" alt="Introduction">
	</div>
	<section class="introduction">
		<aside>
			<img src="../img/sub_aside_tit1.png" alt="팜스토리소개">
			<ul>
				<li><a href="./hello.do">인사말</a></li>
				<li class='on'><a href="./direction.do">찾아오시는길</a></li>
			</ul>
		</aside>
		<article>
			<nav>
				<img src="../img/sub_page1_tit_direction.png" alt="인사말">
				<p>
					Home > 팜스토리소개 > <span>찾아오시는길</span>
				</p>
			</nav>
			<!-- 컨텐츠 내용 시작 -->
			<!-- * Daum 지도 - 지도퍼가기 -->
			<!-- 1. 지도 노드 -->
			<div id="daumRoughmapContainer1538620416447"
				class="root_daum_roughmap root_daum_roughmap_landing"></div>

			<!--
          2. 설치 스크립트
          * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
       		 -->
			<script charset="UTF-8" class="daum_roughmap_loader_script"
				src="http://dmaps.daum.net/map_js_init/roughmapLoader.js"></script>

			<!-- 3. 실행 스크립트 -->
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1538620416447",
					"key" : "q9qa",
					"mapWidth" : "760",
					"mapHeight" : "400"
				}).render();
			</script>
			<!-- 컨텐츠 내용 끝 -->
		</article>
	</section>
</section>
<%@ include file="../tail.jsp"%>
