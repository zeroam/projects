<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>국토발전전시관</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
<link rel="stylesheet" href="/museum/css/style.css">
<link rel="stylesheet" href="/museum/css/sub_style.css">
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<script src="/museum/js/common.js"></script>
<script>
    $(function() {
      var cate_list = $("#lnb_cate > li")
      $("#lnb_cate > li > a").click(function(e) {
        $(this).parent().toggleClass('active');
        return true;
      });
      
      /* 오늘 날짜 구하기 */
      var t = new Date();
      var y = t.getFullYear();
      var m = t.getMonth();
      var d = t.getDate();
      var day = t.getDay();
      var day_t;
      switch(day) {
    	  case 0:
    		  day_t = "일"
    		  break;
    	  case 1:
    		  day_t = "월"
    		  break;
    	  case 2:
    		  day_t = "화"
    		  break;
    	  case 3:
    		  day_t = "수"
    		  break;
    	  case 4:
    		  day_t = "목"
    		  break;
    	  case 5:
    		  day_t = "금"
    		  break;
    	  case 6:
    		  day_t = "토"
    		  break;
    	  default:
    		  day_t = "";
      
      }
      
      $(".year").text(y);
      $(".month").text(m+1);
      $(".day").text(d);
      $(".day_t").text(day_t);
      
    });
    
    function goPage(content, cate, index = 0) {
    	var f = document.paging;
    	f.content.value = content;
    	f.cate.value = cate;
    	f.index.value = index;
    	f.action = "./content.do"
    	f.method = "get"
    	f.submit();
    };
  </script>
</head>
<!-- body -->
<body>
	<!-- 페이지 전송 폼 -->
	<form name="paging">
		<input type="hidden" name="content" /> <input type="hidden" name="index" /> <input type="hidden" name="cate" />
	</form>
	<!-- header -->
	<header>
		<!-- 대메뉴 -->
		<div id="gnbWrap">
			<div class="inside">
				<!-- 로고 -->
				<a href="/museum/index.jsp" class="logo" title="메인페이지로 이동"></a>
				<ul id="gnb">
					<li><a href="javascript:goPage('look', 'observation', 1);">관람</a></li>
					<li><a href="javascript:goPage('exhibition', 'seum', 1);">전시</a></li>
					<li><a href="javascript:goPage('education', 'application');">교육</a></li>
					<li><a href="javascript:goPage('research', 'donationinfo', 1);">연구</a></li>
					<li><a href="javascript:goPage('news', 'news');">소식</a></li>
					<li><a href="javascript:goPage('participation', 'question');">참여</a></li>
					<li><a href="javascript:goPage('introduce', 'purpose', 1);">전시관 소개</a></li>
				</ul>
				<div class="sub_inside on">
					<ol id="gnb_sub">
						<li>
							<ul>
								<li><a href="javascript:goPage('look', 'observation', 1);">이용안내</a></li>
								<li><a href="javascript:goPage('look', 'floors', 2);">시설안내</a></li>
								<li><a href="javascript:goPage('look', 'group', 3);">기타</a></li>
							</ul>
						</li>
						<li>
							<ul>
								<li><a href="javascript:goPage('exhibition', 'seum', 1);">상설전시</a></li>
								<li><a href="javascript:goPage('exhibition', 'plan');">기획전시</a></li>
								<li><a href="">사이버투어</a></li>
							</ul>
						</li>
						<li>
							<ul>
								<li><a href="javascript:goPage('education', 'application');">교육 신청</a></li>
								<li><a href="javascript:goPage('education', 'data');">교육 자료</a></li>
							</ul>
						</li>
						<li>
							<ul>
								<li><a href="javascript:goPage('research', 'donationinfo', 1);">자료 기증</a></li>
								<li><a href="javascript:goPage('research', 'collectionlist', 2);">자료실</a></li>
							</ul>
						</li>
						<li>
							<ul>
								<li><a href="javascript:goPage('news', 'news');">새 소식</a></li>
								<li><a href="javascript:goPage('news', 'event');">문화행사</a></li>
								<li><a href="javascript:goPage('news', 'plan');">연간일정</a></li>
							</ul>
						</li>
						<li>
							<ul>
								<li><a href="javascript:goPage('participation', 'question');">이용문의</a></li>
								<li><a href="javascript:goPage('participation', 'accept');">의견수렴</a></li>
								<li><a href="javascript:goPage('participation', 'volunteer');">자원봉사</a></li>
							</ul>
						</li>
						<li>
							<ul>
								<li><a href="javascript:goPage('introduce', 'purpose', 1);">기관 안내</a></li>
								<li><a href="javascript:goPage('introduce', 'direction');">찾아오시는길</a></li>
								<li><a href="javascript:goPage('introduce', 'tourspot');">주변정보</a></li>
							</ul>
						</li>
					</ol>
				</div>
			</div>
		</div>
	</header>