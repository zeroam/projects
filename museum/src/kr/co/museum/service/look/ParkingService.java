package kr.co.museum.service.look;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.museum.controller.CommandAction;

public class ParkingService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		req.setAttribute("index", 1);
		req.setAttribute("cate", "parking");
		return "/content/look/parking.jsp";
	}

}
