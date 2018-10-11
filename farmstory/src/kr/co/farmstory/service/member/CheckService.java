package kr.co.farmstory.service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.farmstory.controller.CommandAction;
import kr.co.farmstory.dao.MemberDAO;

public class CheckService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String check = req.getParameter("check");
		String value = req.getParameter("value");
		
		MemberDAO dao = MemberDAO.getInstance();

		int result = 0;
		
		result = dao.check(check, value);
		
		//json 포맷 문자열 생성
		String json = "{\"result\":"+result+"}";
		
		return "json:"+json;
	}

}
