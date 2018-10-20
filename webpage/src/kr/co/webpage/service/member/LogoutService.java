package kr.co.webpage.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.webpage.controller.CommandAction;

public class LogoutService implements CommandAction{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		//request 객체로 부터 세션값 가져오기
		HttpSession session = req.getSession();
		//세션 만료
		session.invalidate();
		return "redirect:/webpage/index.do";
	}
}
