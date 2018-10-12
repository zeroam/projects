package kr.co.farmstory.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.farmstory.controller.CommandAction;
import kr.co.farmstory.dao.MemberDAO;
import kr.co.farmstory.vo.MemberVO;

public class LoginService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		String method = req.getMethod();
		HttpSession session = req.getSession();
		//전송 방식이 POST 방식일 때
		if(method.equals("POST")) {
			//id, pw값 파라미터로 받기
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			
			MemberVO vo = null;
			MemberDAO memberDAO = MemberDAO.getInstance();
			vo = memberDAO.login(id, pw);
			if(vo != null) {
				//세션값에 멤버 객체 넣기
				session.setAttribute("member", vo);
				//로그인 여부, 로그인 성공
				session.setAttribute("login", true);
				return "redirect:/farmstory/index.do";
			} else {
				//로그인 실패
				return "redirect:/farmstory/member/login.do?result=fail";				
			}
		//세션 값이 있으면 로그인 상태 유지
		} else if(session.getAttribute("member") != null) {
			return "redirect:/farmstory";
		} else {
			String result = req.getParameter("result");
			req.setAttribute("result", result);
			return "/member/login.jsp";
		}
	}
}
