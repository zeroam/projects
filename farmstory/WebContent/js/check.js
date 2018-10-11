$(function() {
	
	//아이디를 입력하고 포커스가 빠질 때 중복체크 요청
	$('input[name=id]').focusout(function(){
		var tag = $(this);
		var value = tag.val();
		var regName = /^[a-zA-Z][a-zA-Z0-9]{3,}$/;
		$.ajax({
			url:'/farmstory/member/checkUser.do?check=uid&value='+value,
			type:'get',
			dataType:'json',
			success: function(data){
				if(value === "") {
					$('.resultId').css('color', 'red').text('빈칸을 입력하세요');
				} else if(!regName.test(value)) {
					$('.resultId').css('color', 'red').text('영어와 숫자만 4자 이상 입력하십시요');
					tag.focus();
				}
				else if(data.result == 1) {
					$('.resultId').css('color', 'red').text('이미 사용중인 아이디 입니다.');
					//함수안에서는 $(this)가 적용되지 않음
					tag.focus();
				} else {
					$('.resultId').css('color', 'green').text('사용 가능한 아이디 입니다.');
				}
			}
		});
	});
	
	//닉네임 중복 검사
	$('input[name=nick]').focusout(function(){
		var tag = $(this);
		var value = tag.val();
		$.ajax({
			url:'/farmstory/member/checkUser.do?check=nick&value='+value,
			type:'get',
			dataType:'json',
			success: function(data){
				if(value === "") {
					$('.resultNick').css('color', 'red').text('빈칸을 입력하세요');
				} else if(data.result == 1) {
					$('.resultNick').css('color', 'red').text('이미 사용중인 닉네임입니다.');
					//함수안에서는 $(this)가 적용되지 않음
					tag.focus();
				} else {
					$('.resultNick').css('color', 'green').text('사용 가능한 닉네임입니다.');
				}
			}
		});
	});
	
	//이메일 중복 검사
	$('input[name=email]').focusout(function(){
		var tag = $(this);
		var value = tag.val();
		$.ajax({
			url:'/farmstory/member/checkUser.do?check=email&value='+value,
			type:'get',
			dataType:'json',
			success: function(data){
				if(value === "") {
					$('.resultEmail').css('color', 'red').text('빈칸을 입력하세요');
				} else if(data.result == 1) {
					$('.resultEmail').css('color', 'red').text('이미 사용중인 이메일입니다.');
					//함수안에서는 $(this)가 적용되지 않음
					tag.focus();
				} else {
					$('.resultEmail').css('color', 'green').text('사용 가능한 이메일입니다.');
				}
			}
		});
		
	});
	
	//전화번호 중복 검사
	$('input[name=hp]').focusout(function(){
		var tag = $(this);
		var value = tag.val();
		$.ajax({
			url:'/farmstory/member/checkUser.do?check=hp&value='+value,
			type:'get',
			dataType:'json',
			success: function(data){
				if(value === "") {
					$('.resultHp').css('color', 'red').text('빈칸을 입력하세요');
				} else if(data.result == 1) {
					$('.resultHp').css('color', 'red').text('이미 사용중인 전화번호입니다.');
					//함수안에서는 $(this)가 적용되지 않음
					tag.focus();
				} else {
					$('.resultHp').css('color', 'green').text('사용 가능한 전화번호입니다.');
				}
			}
		});
		
	});
	
});