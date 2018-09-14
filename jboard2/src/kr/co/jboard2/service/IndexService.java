package kr.co.jboard2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommandAction;

public class IndexService implements CommandAction  {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		//로그인 안했을 경우
		return "redirect:/jboard2/member/login.do";
		
		//로그인 했을 경우
		//return "/list.jsp";
	}

}
