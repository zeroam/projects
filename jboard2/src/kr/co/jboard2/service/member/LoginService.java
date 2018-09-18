package kr.co.jboard2.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.controller.CommandAction;
import kr.co.jboard2.dao.MemberDAO;
import kr.co.jboard2.vo.MemberVO;

public class LoginService implements CommandAction  {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String method = req.getMethod();
		HttpSession session = req.getSession();
		if(method.equals("POST")) {
			
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			
			MemberVO vo = null;
			MemberDAO memberDAO = MemberDAO.getInstance();
			vo = memberDAO.login(id, pw);
			if(vo != null) {
				//세션값에 멤버 객체 넣기
				session.setAttribute("member", vo);
				return "redirect:/jboard2/list.do";
			} else {
				return "redirect:/jboard2/member/login.do?result=fail";				
			}
		//세션 값이 있으면 로그인 상태 유지
		} else if(session.getAttribute("member") != null) {
			return "redirect:/jboard2/list.do";
		} else {
			String result = req.getParameter("result");
			req.setAttribute("result", result);
			return "/login.jsp";
		}
	}
}
