package kr.co.jboard2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommandAction;

public class IndexService implements CommandAction  {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		//�α��� ������ ���
		return "redirect:/jboard2/member/login.do";
		
		//�α��� ���� ���
		//return "/list.jsp";
	}

}
