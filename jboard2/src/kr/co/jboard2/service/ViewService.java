package kr.co.jboard2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommandAction;
import kr.co.jboard2.dao.BoardDAO;
import kr.co.jboard2.vo.BoardVO;

public class ViewService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		String seq = req.getParameter("seq");
		
		//게시글 vo 객체 얻기
		BoardDAO dao = BoardDAO.getInstance();
		BoardVO vo = dao.view(seq);
		
		//리퀘스트 속성값 부여
		req.setAttribute("vo", vo);
		
		return "/view.jsp";
	}
}
