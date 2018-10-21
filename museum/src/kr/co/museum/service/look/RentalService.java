package kr.co.museum.service.look;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.museum.controller.CommandAction;

public class RentalService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("index", 2);
		req.setAttribute("cate", "rental");
		return "/content/look/rental.jsp";
	}

}
