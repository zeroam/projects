package kr.co.jboard2.service;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommandAction;
import kr.co.jboard2.dao.BoardDAO;
import kr.co.jboard2.vo.BoardVO;

public class WriteService implements CommandAction {

	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String method = req.getMethod();

		//작성완료 버튼을 눌렀을 때
		if(method.equals("POST")) {
			//게시판 vo 객체 생성 및 초기화		
			BoardVO vo = new BoardVO();
			vo.setCate(req.getParameter("cate"));
			vo.setTitle(req.getParameter("subject"));
			vo.setContents(req.getParameter("content"));
			vo.setUid(req.getParameter("uid"));
			vo.setRegip(req.getRemoteAddr());
			
			//데이터 베이스에 글 등록
			BoardDAO dao = BoardDAO.getInstance();
			dao.write(vo);
			
			return "redirect:/jboard2/list.do";	
		} else {
			return "/write.jsp";				
		}	
	}
}
