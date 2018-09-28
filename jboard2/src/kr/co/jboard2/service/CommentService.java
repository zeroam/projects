package kr.co.jboard2.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommandAction;
import kr.co.jboard2.dao.BoardDAO;
import kr.co.jboard2.vo.BoardVO;

public class CommentService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		//현재 페이지
		String page = req.getParameter("page");
		//게시글 번호
		String parent = req.getParameter("parent");
		//글 유형
		String cate = req.getParameter("cate");
		//댓글 작성자 아이디
		String uid = req.getParameter("uid");
		//댓글 작성 내용
		String comment = req.getParameter("comment");

		
		//게시글 vo 객체 생성 및 초기화
		BoardVO vo = new BoardVO();
		vo.setParent(Integer.parseInt(parent));
		vo.setCate(cate);
		vo.setContents(comment);
		vo.setUid(uid);
		vo.setRegip(req.getRemoteAddr());
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.commentWrite(vo);
		
		//현재 댓글을 작성한 페이지로 리다이렉트
		return "redirect:/jboard2/view.do?seq="+parent+"&page="+page;
	}
}
