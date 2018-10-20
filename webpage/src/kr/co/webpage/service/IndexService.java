package kr.co.webpage.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.webpage.controller.CommandAction;

public class IndexService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		req.setAttribute("status", req.getParameter("status"));
		req.setAttribute("regis", req.getParameter("regis"));
		
		return "/index.jsp";
	}

}
