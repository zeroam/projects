$(function(){
	
	//form 전송이 발생할 때(submit 버튼 클릭했을 떄)
	$('.register>form').submit(function(){
		
		//비밀번호 일치여부 검사
		var pw1Tag = $('input[name=pw1]');
		var pw2Tag = $('input[name=pw2]');
		
		var pw1 = pw1Tag.val();
		var pw2 = pw2Tag.val();
		
		if(pw1 != pw2) {
			alert('비밀번호가 일치하지 않습니다.');
			pw1Tag.val('');
			pw2Tag.val('');
			pw1Tag.focus();
			return false; //폼 전송이 취소된다.
		}
		
		// 이름 한글 검사
		var nameTag = $('input[name=name]');
		var name = nameTag.val();
		var regName = /^[가-힣]{2,10}$/;	//정규식
		
		if(!regName.test(name)) {
			alert('이름을 정확하게 입력하세요.\n한글로만 입력하십시오');
			nameTag.val('');
			nameTag.focus();
			return false; //폼 전송 취소
		}
		
		return true; //최종적으로 폼 전송이 실행
	});
	
});