package kr.co.museum.service.look;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.museum.controller.CommandAction;

public class FloorService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		req.setAttribute("index", 2);
		req.setAttribute("cate", "floors");
		return "/content/look/floors.jsp";
	}

}
