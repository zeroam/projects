<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<ul id="lnb_ul">
	<li class="${content == 'look' ? 'active': ''}"><a href="./look.do?index=1&cate=observation"><span>관람</span></a>
		<ul id="lnb_cate">
			<li class="${index == 1 ? 'active': ''}"><a>이용 안내</a>
				<ul>
					<li class="${cate == 'observation' ? 'active' : ''}"><a href="./look.do?index=1&cate=observation">관람시간 및 요금</a></li>
					<li class="${cate == 'parking' ? 'active' : ''}"><a href="./look.do?index=1&cate=parking">주차 안내</a></li>
				</ul></li>
			<li class="${index == 2 ? 'active': ''}"><a>시설 안내</a>
				<ul>
					<li class="${cate == 'floors' ? 'active' : ''}"><a href="./look.do?index=2&cate=floors">층별 안내</a></li>
					<li class="${cate == 'comfort' ? 'active' : ''}"><a href="./look.do?index=2&cate=comfort">편의시설</a></li>
					<li class="${cate == 'rental' ? 'active' : ''}"><a href="./look.do?index=2&cate=rental">대관 안내</a></li>
				</ul></li>
			<li class="${index == 3 ? 'active': ''}"><a>기타</a>
				<ul>
					<li class="${cate == 'group' ? 'active' : ''}"><a href="./look.do?index=3&cate=group">단체 관람</a></li>
					<li class="${cate == 'handicap' ? 'active' : ''}"><a href="./look.do?index=3&cate=handicap">장애인 관람</a></li>
				</ul></li>
		</ul></li>
	<li class="${content == 'exhibition' ? 'active': ''}"><a href="./exhibition.do?index=1&cate=seum"> <span>전시</span>
	</a>
		<ul id="lnb_cate">
			<li class="${index == 1 ? 'active': ''}"><a>상설전시</a>
				<ul>
					<li class="${cate == 'seum' ? 'active' : ''}"><a href="./exhibition.do?index=1&cate=seum">국토세움실</a></li>
					<li class="${cate == 'nuri' ? 'active' : ''}"><a href="./exhibition.do?index=1&cate=nuri">국토누리실</a></li>
					<li class="${cate == 'mirae' ? 'active' : ''}"><a href="./exhibition.do?index=1&cate=mirae">미래국토실</a></li>
					<li class="${cate == 'together' ? 'active' : ''}"><a href="./exhibition.do?index=1&cate=together">국토동행실</a></li>
				</ul></li>
			<li class="${cate == 'plan' ? 'active' : ''}"><a href="./exhibition.do?cate=plan">기획전시</a></li>
			<li><a href="">사이버투어</a></li>
		</ul></li>
	<li class="${content == 'education' ? 'active': ''}"><a href="./education.do?cate=application"> <span>교육</span>
	</a>
		<ul id="lnb_cate">
			<li class="${cate == 'application' ? 'active' : ''}"><a href="./education.do?cate=application">교육 신청</a></li>
			<li class="${cate == 'data' ? 'active' : ''}"><a href="./education.do?cate=data">교육 자료</a></li>
		</ul></li>
	<li class="${content == 'research' ? 'active': ''}"><a href="./research.do?index=1&cate=donationinfo"> <span>연구</span>
	</a>
		<ul id="lnb_cate">
			<li class="${index == 1 ? 'active': ''}"><a>자료기증</a>
				<ul>
					<li class="${cate == 'donationinfo' ? 'active' : ''}"><a href="./research.do?index=1&cate=donationinfo">기증 안내</a></li>
					<li class="${cate == 'donationlist' ? 'active' : ''}"><a href="./research.do?index=1&cate=donationlist">기증 내역</a></li>
				</ul></li>
			<li class="${index == 2 ? 'active': ''}"><a>자료실</a>
				<ul>
					<li class="${cate == 'collectionlist' ? 'active' : ''}"><a href="./research.do?index=2&cate=collectionlist">소장 자료 검색</a></li>
					<li class="${cate == 'academic' ? 'active' : ''}"><a href="./research.do?index=2&cate=academic">학술연구</a></li>
					<li class="${cate == 'publication' ? 'active' : ''}"><a href="./research.do?index=2&cate=publication">간행물</a></li>
				</ul></li>
		</ul></li>
	<li class="${content == 'news' ? 'active': ''}"><a href="./news.do?cate=news"> <span>소식</span>
	</a>
		<ul id="lnb_cate">
			<li class="${cate == 'news' ? 'active' : ''}"><a href="./news.do?cate=news">새 소식</a></li>
			<li class="${cate == 'event' ? 'active' : ''}"><a href="./news.do?cate=event">문화행사</a></li>
			<li class="${cate == 'plan' ? 'active' : ''}"><a href="./news.do?cate=plan">연간일정</a></li>
		</ul></li>
	<li class="${content == 'participation' ? 'active': ''}"><a href="./participation.do?cate=question"> <span>참여</span>
	</a>
		<ul id="lnb_cate">
			<li class="${cate == 'question' ? 'active' : ''}"><a href="./participation.do?cate=question">이용문의</a></li>
			<li class="${cate == 'accept' ? 'active' : ''}"><a href="./participation.do?cate=accept">의견수렴</a></li>
			<li class="${cate == 'volunteer' ? 'active' : ''}"><a href="./participation.do?cate=volunteer">자원봉사</a></li>
		</ul></li>
	<li class="${content == 'introduce' ? 'active': ''}"><a href="./introduce.do?index=1&cate=purpose"> <span>전시관 소개</span>
	</a>
		<ul id="lnb_cate">
			<li class="${index == 1 ? 'active': ''}"><a>기관 안내</a>
				<ul>
					<li class="${cate == 'purpose' ? 'active' : ''}"><a href="./introduce.do?index=1&cate=purpose">전시 목적</a></li>
					<li class="${cate == 'greeting' ? 'active' : ''}"><a href="./introduce.do?index=1&cate=greeting">인사말</a></li>
					<li class="${cate == 'history' ? 'active' : ''}"><a href="./introduce.do?index=1&cate=history">연혁</a></li>
					<li class="${cate == 'organization' ? 'active' : ''}"><a href="./introduce.do?index=1&cate=organization">조직 및 업무</a></li>
				</ul></li>
			<li class="${cate == 'direction' ? 'active' : ''}"><a href="./introduce.do?cate=direction">찾아오시는 길</a></li>
			<li class="${cate == 'tourspot' ? 'active' : ''}"><a href="./introduce.do?cate=tourspot">주변 정보</a></li>
		</ul></li>
</ul>