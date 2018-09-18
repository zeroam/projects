package kr.co.jboard2.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommandAction;
import kr.co.jboard2.dao.MemberDAO;
import kr.co.jboard2.vo.MemberVO;

public class RegistService implements CommandAction  {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String method = req.getMethod();
		
		if(method.equals("GET")) {
			//terms에서 회원가입 페이지로 넘어갈 경우
			return "/register.jsp";			
		} else {
			//register 페이지에서 회원가입을 할 경우
			
			boolean result = false;
			
			MemberDAO memberDAO = MemberDAO.getInstance();
			try {
				MemberVO memberVO = new MemberVO(req);
				result = memberDAO.register(memberVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(result) {
				return "redirect:/jboard2/member/login.do";				
			} else {
				return "/register.jsp";
			}
		}	
	}
}
