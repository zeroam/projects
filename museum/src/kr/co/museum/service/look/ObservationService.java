package kr.co.museum.service.look;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.museum.controller.CommandAction;

public class ObservationService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		req.setAttribute("index", 1);
		req.setAttribute("cate", "observation");
		return "/content/look/observation.jsp";
	}

}
