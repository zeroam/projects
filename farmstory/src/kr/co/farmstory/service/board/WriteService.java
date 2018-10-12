package kr.co.farmstory.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory.controller.CommandAction;

public class WriteService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		String gr = req.getParameter("gr");
		String cate = req.getParameter("cate");
		
		req.setAttribute("gr", gr);
		req.setAttribute("cate", cate);
		
		
		return "/board/write.jsp";
	}

}
