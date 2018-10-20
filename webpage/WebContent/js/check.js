$(function() {
	
	var isIdOk 		= false;
	var isPwOk 		= false;
	var isEmailOk 	= false;
	
	
	//아이디를 입력하고 포커스가 빠질 때 중복체크 요청
	$('.sign-up-htm #user').focusout(function(){
		var tag = $(this);
		var value = tag.val();
		var regName = /^[a-zA-Z][a-zA-Z0-9]{3,}$/;
		$.ajax({
			url:'/webpage/member/checkUser.do?check=uid&value='+value,
			type:'get',
			dataType:'json',
			success: function(data){
				//alert(data.result);
				if(value === "") {
					$('.resultId').css('color', 'red').text('빈칸을 입력하세요');
				} else if(!regName.test(value)) {
					$('.resultId').css('color', 'red').text('영어와 숫자만 4자 이상 입력하십시요');
					tag.focus();
				}else if(data.result == 1) {
					$('.resultId').css('color', 'red').text('이미 사용중인 아이디 입니다.');
					//함수안에서는 $(this)가 적용되지 않음
					tag.focus();
				} else {
					$('.resultId').css('color', 'green').text('사용 가능한 아이디 입니다.');
					isIdOk = true;
				}
			}
		});
	});

	//이메일 중복 검사
	$('.sign-up-htm #email').focusout(function(){
		var tag = $(this);
		var value = tag.val();
		// 이메일 형식에 맞는 정규 표현식 넣기
		$.ajax({
			url:'/webpage/member/checkUser.do?check=email&value='+value,
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
					isEmailOk = true;
				}
			}
		});
	});
	
	// 회원가입 form 전송이 발생할 때(submit 버튼 클릭했을 떄)
	$('.sign-up-htm>form').submit(function(){
		
		//비밀번호 일치여부 검사
		var pw1Tag = $('#sgu-pass1');
		var pw2Tag = $('#sgu-pass2');
		
		var pw1 = pw1Tag.val();
		var pw2 = pw2Tag.val();
		
		if(pw1 != pw2) {
			pw1Tag.val('');
			pw2Tag.val('');
			pw1Tag.focus();
		} else {
			isPwOk = true;
		}
		
		// 조건에 부합하지 않을 때 폼전송 비활성화
		if(!isIdOk){
			alert('아이디를 다시 확인하십시오.');
			return false;
		}
		
		if(!isPwOk) {
			alert('비밀번호가 일치하지 않습니다.');
			return false;
		}
		
		if(!isEmailOk){
			alert('이메일을 다시 확인하십시오.')
			return false;
		}
		
		return true;
	});
	
	
	// 로그인 form 전송이 발생할 때
	$('.sign-in-htm>form').submit(function(e){
		e.preventDefault();
		var tag = $(this);
		var userTag = $('#sgi-user');
		var passTag = $('#sgi-pass');
		
		var user = userTag.val();
		var pass = passTag.val();
		var json = {
			"sgi-user": user,
			"sgi-pass": pass
		};
		
		$.ajax({
			url:"/webpage/member/login.do",
			type:"post",
			dataType:"json",
			data: json, 
			success: function(data) {
				if(data.result == 1) {					
					location.href='/webpage/index.do?status=success';
				} else {
					$('#page-top > .alert-error > span').text('로그인에 실패했습니다. 아이디,비밀번호를 다시 한번 확인해 주세요.');
					$('#page-top > .alert-error').removeClass('off').addClass('on');
				}
			}	
		});
	});
	
});