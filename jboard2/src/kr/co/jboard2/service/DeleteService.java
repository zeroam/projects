package kr.co.jboard2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommandAction;
import kr.co.jboard2.dao.BoardDAO;

public class DeleteService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		String seq = req.getParameter("seq");
		if(seq != null) {
			BoardDAO dao = BoardDAO.getInstance();
			dao.delete(seq);
			
			return "redirect:/jboard2/list.do";
		} else {
			return "/jboard2/view.do";
		}
		
	}

}
