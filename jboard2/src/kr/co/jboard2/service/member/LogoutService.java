package kr.co.jboard2.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.controller.CommandAction;

public class LogoutService implements CommandAction{

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		//세션 만료
		session.invalidate();
		return "redirect:/jboard2/member/login.do";
	}

}
