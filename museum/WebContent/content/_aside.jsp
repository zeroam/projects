<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<ul id="lnb_ul">
	<li class="${content == 'look' ? 'active': ''}"><a href="javascript:goPage('look', 'observation', 1);"><span>관람</span></a>
		<ul id="lnb_cate">
			<li class="${index == 1 ? 'active': ''}"><a>이용 안내</a>
				<ul>
					<li class="${cate == 'observation' ? 'active' : ''}"><a href="javascript:goPage('look', 'observation', 1);">관람시간 및 요금</a></li>
					<li class="${cate == 'parking' ? 'active' : ''}"><a href="javascript:goPage('look', 'parking', 1);">주차 안내</a></li>
				</ul></li>
			<li class="${index == 2 ? 'active': ''}"><a>시설 안내</a>
				<ul>
					<li class="${cate == 'floors' ? 'active' : ''}"><a href="javascript:goPage('look', 'floors', 2);">층별 안내</a></li>
					<li class="${cate == 'comfort' ? 'active' : ''}"><a href="javascript:goPage('look', 'comfort', 2);">편의시설</a></li>
					<li class="${cate == 'rental' ? 'active' : ''}"><a href="javascript:goPage('look', 'rental', 2);">대관 안내</a></li>
				</ul></li>
			<li class="${index == 3 ? 'active': ''}"><a>기타</a>
				<ul>
					<li class="${cate == 'group' ? 'active' : ''}"><a href="javascript:goPage('look', 'group', 3);">단체 관람</a></li>
					<li class="${cate == 'handicap' ? 'active' : ''}"><a href="javascript:goPage('look', 'handicap', 3);">장애인 관람</a></li>
				</ul></li>
		</ul></li>
	<li class="${content == 'exhibition' ? 'active': ''}"><a href="javascript:goPage('exhibition', 'seum', 1);"> <span>전시</span>
	</a>
		<ul id="lnb_cate">
			<li class="${index == 1 ? 'active': ''}"><a>상설전시</a>
				<ul>
					<li class="${cate == 'seum' ? 'active' : ''}"><a href="javascript:goPage('exhibition', 'seum', 1);">국토세움실</a></li>
					<li class="${cate == 'nuri' ? 'active' : ''}"><a href="javascript:goPage('exhibition', 'nuri', 1);">국토누리실</a></li>
					<li class="${cate == 'mirae' ? 'active' : ''}"><a href="javascript:goPage('exhibition', 'mirae', 1);">미래국토실</a></li>
					<li class="${cate == 'together' ? 'active' : ''}"><a href="javascript:goPage('exhibition', 'together', 1);">국토동행실</a></li>
				</ul></li>
			<li class="${cate == 'plan' ? 'active' : ''}"><a href="javascript:goPage('exhibition', 'plan');">기획전시</a></li>
			<li><a href="">사이버투어</a></li>
		</ul></li>
	<li class="${content == 'education' ? 'active': ''}"><a href="javascript:goPage('education', 'application');"> <span>교육</span>
	</a>
		<ul id="lnb_cate">
			<li class="${cate == 'application' ? 'active' : ''}"><a href="javascript:goPage('education', 'application');">교육 신청</a></li>
			<li class="${cate == 'data' ? 'active' : ''}"><a href="javascript:goPage('education', 'data');">교육 자료</a></li>
		</ul></li>
	<li class="${content == 'research' ? 'active': ''}"><a href="javascript:goPage('research', 'donationinfo', 1);"> <span>연구</span>
	</a>
		<ul id="lnb_cate">
			<li class="${index == 1 ? 'active': ''}"><a>자료기증</a>
				<ul>
					<li class="${cate == 'donationinfo' ? 'active' : ''}"><a href="javascript:goPage('research', 'donationinfo', 1);">기증 안내</a></li>
					<li class="${cate == 'donationlist' ? 'active' : ''}"><a href="javascript:goPage('research', 'donationlist', 1);">기증 내역</a></li>
				</ul></li>
			<li class="${index == 2 ? 'active': ''}"><a>자료실</a>
				<ul>
					<li class="${cate == 'collectionlist' ? 'active' : ''}"><a href="javascript:goPage('research', 'collectionlist', 2);">소장 자료 검색</a></li>
					<li class="${cate == 'academic' ? 'active' : ''}"><a href="javascript:goPage('research', 'academic', 2);">학술연구</a></li>
					<li class="${cate == 'publication' ? 'active' : ''}"><a href="javascript:goPage('research', 'publication', 2);">간행물</a></li>
				</ul></li>
		</ul></li>
	<li class="${content == 'news' ? 'active': ''}"><a href="javascript:goPage('news', 'news');"> <span>소식</span>
	</a>
		<ul id="lnb_cate">
			<li class="${cate == 'news' ? 'active' : ''}"><a href="javascript:goPage('news', 'news');">새 소식</a></li>
			<li class="${cate == 'event' ? 'active' : ''}"><a href="javascript:goPage('news', 'event');">문화행사</a></li>
			<li class="${cate == 'plan' ? 'active' : ''}"><a href="javascript:goPage('news', 'plan');">연간일정</a></li>
		</ul></li>
	<li class="${content == 'participation' ? 'active': ''}"><a href="javascript:goPage('participation', 'question');"> <span>참여</span>
	</a>
		<ul id="lnb_cate">
			<li class="${cate == 'question' ? 'active' : ''}"><a href="javascript:goPage('participation', 'question');">이용문의</a></li>
			<li class="${cate == 'accept' ? 'active' : ''}"><a href="javascript:goPage('participation', 'accept');">의견수렴</a></li>
			<li class="${cate == 'volunteer' ? 'active' : ''}"><a href="javascript:goPage('participation', 'volunteer');">자원봉사</a></li>
		</ul></li>
	<li class="${content == 'introduce' ? 'active': ''}"><a href="javascript:goPage('introduce', 'purpose', 1);"> <span>전시관 소개</span>
	</a>
		<ul id="lnb_cate">
			<li class="${index == 1 ? 'active': ''}"><a>기관 안내</a>
				<ul>
					<li class="${cate == 'purpose' ? 'active' : ''}"><a href="javascript:goPage('introduce', 'purpose', 1);">전시 목적</a></li>
					<li class="${cate == 'greeting' ? 'active' : ''}"><a href="javascript:goPage('introduce', 'greeting', 1);">인사말</a></li>
					<li class="${cate == 'history' ? 'active' : ''}"><a href="javascript:goPage('introduce', 'history', 1);">연혁</a></li>
					<li class="${cate == 'organization' ? 'active' : ''}"><a href="javascript:goPage('introduce', 'organization', 1);">조직 및 업무</a></li>
				</ul></li>
			<li class="${cate == 'direction' ? 'active' : ''}"><a href="javascript:goPage('introduce', 'direction');">찾아오시는 길</a></li>
			<li class="${cate == 'tourspot' ? 'active' : ''}"><a href="javascript:goPage('introduce', 'tourspot');">주변 정보</a></li>
		</ul></li>
</ul>