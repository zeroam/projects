package kr.co.museum.service.look;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.museum.controller.CommandAction;

public class HandicapService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("index", 3);
		req.setAttribute("cate", "handicap");
		return "/content/look/handicap.jsp";
	}

}
