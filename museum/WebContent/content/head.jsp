<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>국토발전전시관</title>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
  <link rel="stylesheet" href="/museum/css/style.css">
  <link rel="stylesheet" href="/museum/css/sub_style.css">
  <script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
  <script src="/museum/js/common.js"></script>
  <script>
    $(function() {
      var cate_list = $("#lnb_cate > li")
      $("#lnb_cate > li > a").click(function(e) {
        $(this).parent().toggleClass('active');
        return true;
      });
    });
  </script>
</head>
<!-- body -->
<body>
  <!-- header -->
  <header>
    <!-- 대메뉴 -->
    <div id="gnbWrap">
      <div class="inside">
        <!-- 로고 -->
        <a href="/museum/index.jsp" class="logo" title="메인페이지로 이동"></a>
        <ul id="gnb">
          <li>
            <a href="./look.do?index=1&cate=observation">관람</a>
          </li>
          <li>
            <a href="./exhibition.do?index=1&cate=seum">전시</a>
          </li>
          <li>
            <a href="./education.do?cate=application">교육</a>
          </li>
          <li>
            <a href="./research.do?index=1&cate=donationinfo">연구</a>
          </li>
          <li>
            <a href="./news.do?cate=news">소식</a>
          </li>
          <li>
            <a href="./participation.do?cate=question">참여</a>
          </li>
          <li>
            <a href="./introduce.do?index=1&cate=purpose">전시관 소개</a>
          </li>
        </ul>
        <div class="sub_inside on">
          <ol id="gnb_sub">
            <li>
              <ul>
                <li><a href="./look.do?index=1&cate=observation">이용안내</a></li>
                <li><a href="./look.do?index=2&cate=floors">시설안내</a></li>
                <li><a href="./look.do?index=3&cate=group">기타</a></li>
              </ul>
            </li>
            <li>
              <ul>
                <li><a href="./exhibition.do?index=1&cate=seum">상설전시</a></li>
                <li><a href="./exhibition.do?cate=plan">기획전시</a></li>
                <li><a href="">사이버투어</a></li>
              </ul>
            </li>
            <li>
              <ul>
                <li><a href="./education.do?cate=application">교육 신청</a></li>
                <li><a href="./education.do?cate=data">교육 자료</a></li>
              </ul>
            </li>
            <li>
              <ul>
                <li><a href="./research.do?index=1&cate=donationinfo">자료 기증</a></li>
                <li><a href="./research.do?index=2&cate=collectionlist">자료실</a></li>
              </ul>
            </li>
            <li>
              <ul>
                <li><a href="./news.do?cate=news">새 소식</a></li>
                <li><a href="./news.do?cate=event">문화행사</a></li>
                <li><a href="./news.do?cate=plan">연간일정</a></li>
              </ul>
            </li>
            <li>
              <ul>
                <li><a href="./participation.do?cate=question">이용문의</a></li>
                <li><a href="./participation.do?cate=accept">의견수렴</a></li>
                <li><a href="./participation.do?cate=volunteer">자원봉사</a></li>
              </ul>
            </li>
            <li>
              <ul>
                <li><a href="./introduce.do?index=1&cate=purpose">기관 안내</a></li>
                <li><a href="./introduce.do?cate=direction">찾아오시는길</a></li>
                <li><a href="./introduce.do?cate=tourspot">주변정보</a></li>
              </ul>
            </li>
          </ol>
        </div>
      </div>
    </div>
  </header>