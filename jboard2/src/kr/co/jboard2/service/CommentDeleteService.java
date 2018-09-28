package kr.co.jboard2.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommandAction;
import kr.co.jboard2.dao.BoardDAO;

public class CommentDeleteService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		//댓글 seq, parent 값 가져오기
		String seq = req.getParameter("seq");
		String parent = req.getParameter("parent");
		String page = req.getParameter("page");
		
		if(seq!=null) {
			BoardDAO dao = BoardDAO.getInstance();
			//댓글 삭제
			dao.delete(seq);
			//댓글 수 감소
			dao.decreaseCommentNo(parent);
		}
		
		
		return "/view.do?seq="+parent+"&page"+page;
	}

}
