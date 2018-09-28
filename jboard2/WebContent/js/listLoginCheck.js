$(function() {
	// 글쓰기 클릭할 때 로그인 체크
	$('.btnWrite').click(function() {
		// 로그인 정보가 있을 경우
		if (login) {
			return true;
			// 로그인 정보가 없을 경우
		} else {
			alert('로그인하세요');
			return false;
		}
	});

	// 글제목 클릭할 때 로그인 체크
	$('.title').click(function() {
		// 로그인 정보가 있을 경우
		if (login) {
			return true;
			// 로그인 정보가 없을 경우
		} else {
			alert('로그인 하세요');
			return fales;
		}
	});

});