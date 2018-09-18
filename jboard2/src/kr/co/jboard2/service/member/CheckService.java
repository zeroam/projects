package kr.co.jboard2.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.jboard2.controller.CommandAction;
import kr.co.jboard2.dao.MemberDAO;

public class CheckService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String check = req.getParameter("check");
		String value = req.getParameter("value");
		
		MemberDAO dao = MemberDAO.getInstance();

		int result = 0;
		
		result = dao.check(check, value);
		
//		result = dao.checkUser(value);			
		
		String json = "{\"result\":"+result+"}";
		
		return "json:"+json;
	}

}
