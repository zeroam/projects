package kr.co.webpage.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.webpage.controller.CommandAction;
import kr.co.webpage.dao.MemberDAO;
import kr.co.webpage.vo.MemberVO;

public class LoginService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {

		
		// user, pass값 파라미터로 받기
		String user = req.getParameter("sgi-user");
		String pass = req.getParameter("sgi-pass");
		
		MemberVO vo = null;
		MemberDAO memberDAO = MemberDAO.getInstance();
		vo = memberDAO.login(user, pass);

		String method = req.getMethod();
		int result = 0;
		// 전송 방식이 POST 방식일 때 - 로그인		
		HttpSession session = req.getSession();
		if (vo != null) {
			// 세션값에 멤버 객체 넣기
			session.setAttribute("member", vo);
			// 로그인 여부
			session.setAttribute("login", true);
			result = 1;
		}
		
		//json 포맷 문자열 생성
		String json = "{\"result\":"+result+"}";
		return "json:"+json;
	}
}
