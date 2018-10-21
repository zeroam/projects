package kr.co.museum.service.look;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.museum.controller.CommandAction;

public class ComfortService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("content", "look");
		req.setAttribute("index", 2);
		req.setAttribute("cate", "comfort");
		return "/content/look/comfort.jsp";
	}

}
