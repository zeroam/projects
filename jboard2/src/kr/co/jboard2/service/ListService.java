package kr.co.jboard2.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.controller.CommandAction;
import kr.co.jboard2.dao.BoardDAO;
import kr.co.jboard2.vo.BoardVO;

public class ListService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		//세션값이 없음에도 URL로 접근하는 것 막기
		if(session.getAttribute("member") == null) {
			return "redirect:/jboard2/member/login.do";
		}
		
		//arraylist로 boardVO 객체 받기
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardVO> voList = dao.list();
		req.setAttribute("list", voList);
		
		return "/list.jsp";
	}

}
