$(document).ready(function() {

	var chk1 = $('input[name=chk1]');
	var chk2 = $('input[name=chk2]');

	$('.btnNext').click(function(e) {
		//e.preventDefault();

		if ($(chk1).is(":checked") && $(chk2).is(":checked")) {
			return true;
		} else {
			alert("동의 체크를 하셔야 합니다.");
			return false;
		}
	});
	$('.btnCancel').click(function(e) {
		// e.preventDefault();
		if (confirm("정말 취소하시겠습니까?")) {
			// 로그인 화면으로 이동
			return true;
		} else {
			return false;
		}
	});
});