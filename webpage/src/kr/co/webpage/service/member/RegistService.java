package kr.co.webpage.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.webpage.controller.CommandAction;
import kr.co.webpage.dao.MemberDAO;
import kr.co.webpage.vo.MemberVO;

public class RegistService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {

		boolean result = false;

		MemberDAO memberDAO = MemberDAO.getInstance();
		try {
			MemberVO memberVO = new MemberVO(req);
			// 데이터베이스에 회원 등록이 성공적으로 되었을 때, true값 반환
			result = memberDAO.register(memberVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result) {
			// 회원 등록이 정상적으로 되었을 때
			return "redirect:/webpage/index.do?regis=success";
		} else {
			// 회원 등록에 실패했을 때
			return "redirect:/webpage/index.do";
		}
	}

}
