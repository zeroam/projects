package kr.co.jboard2.service;


import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.controller.CommandAction;
import kr.co.jboard2.dao.BoardDAO;
import kr.co.jboard2.dao.MemberDAO;
import kr.co.jboard2.vo.BoardVO;
import kr.co.jboard2.vo.MemberVO;

public class WriteService implements CommandAction {

	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		//작성완료 버튼을 눌렀을 때
		String method = req.getMethod();

		if(method.equals("POST")) {
			//post 값 인코딩
			try {
				req.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
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
			//로그인 여부 확인
			HttpSession session = req.getSession();
			if(session.getAttribute("member") == null) {
				return "redirect:/jboard2/member/login.do";
			} else {
				return "/write.jsp";				
			}
		}
		
	}
}
