package kr.co.farmstory.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory.controller.CommandAction;
import kr.co.farmstory.dao.MemberDAO;
import kr.co.farmstory.vo.MemberVO;

public class RegistService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {

		String method = req.getMethod();

		if (method.equals("GET")) {
			// terms에서 회원가입 페이지로 넘어갈 경우
			return "/member/register.jsp";
		} else {
			// register 페이지에서 회원가입을 할 경우
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
				return "redirect:/farmstory/";
			} else {
				// 회원 등록에 실패했을 때
				return "/member/register.jsp";
			}
		}
	}
}
