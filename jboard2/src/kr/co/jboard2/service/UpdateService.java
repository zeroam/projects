package kr.co.jboard2.service;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommandAction;
import kr.co.jboard2.dao.BoardDAO;
import kr.co.jboard2.vo.BoardVO;

public class UpdateService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		String method = req.getMethod();
		String seq = req.getParameter("seq");
		String pg = req.getParameter("page");
		
		// 수정완료 버튼을 눌렀을 때
		if (method.equals("POST")) {
			// post 값 인코딩		

			// 게시판 vo 객체 생성 및 초기화
			BoardVO vo = new BoardVO();
			vo.setSeq(Integer.parseInt(seq));
			vo.setCate(req.getParameter("cate"));
			vo.setTitle(req.getParameter("subject"));
			vo.setContents(req.getParameter("content"));
			vo.setUid(req.getParameter("uid"));
			vo.setRegip(req.getRemoteAddr());

			System.out.println("제목 : "+req.getParameter("subject"));
			System.out.println("내용 : "+req.getParameter("content"));
			
			//글 수정
			BoardDAO dao = BoardDAO.getInstance();
			dao.modify(vo);

			return "redirect:/jboard2/view.do?seq="+seq+"&page="+pg;
		// 글 수정 하러 들어올 경우
		} else {
			// 게시글 vo 객체 얻기
			BoardDAO dao = BoardDAO.getInstance();
			BoardVO vo = dao.view(seq);
			
			// 리퀘스트 속성값 부여
			req.setAttribute("vo", vo);
			req.setAttribute("page", pg);
			
			return "/update.jsp";
		}

	}

}
