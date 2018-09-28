package kr.co.jboard2.service.member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommandAction;
import kr.co.jboard2.dao.MemberDAO;
import kr.co.jboard2.vo.TermsVO;

public class TermsService implements CommandAction {
	
	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		MemberDAO dao = MemberDAO.getInstance();
		TermsVO termsVO = dao.terms();
		//request 객체에 속성값 부여
		req.setAttribute("vo", termsVO);		
		
		return "/terms.jsp";
	}
}
