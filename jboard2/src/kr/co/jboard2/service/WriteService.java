package kr.co.jboard2.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommandAction;

public class WriteService implements CommandAction {

	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/view.jsp";
	}
}
