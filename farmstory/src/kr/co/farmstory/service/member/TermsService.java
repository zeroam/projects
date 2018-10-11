package kr.co.farmstory.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory.controller.CommandAction;
import kr.co.farmstory.dao.MemberDAO;
import kr.co.farmstory.vo.TermsVO;

public class TermsService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		// 데이터베이스로 부터 fs_terms 테이블의 데이터 가져오기
		MemberDAO dao = MemberDAO.getInstance();
		TermsVO termsVO = dao.terms();
		
		req.setAttribute("vo", termsVO);
		
		return "/member/terms.jsp";
	}

}
