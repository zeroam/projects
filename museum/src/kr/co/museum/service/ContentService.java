package kr.co.museum.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.museum.controller.CommandAction;

public class ContentService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		String content = req.getParameter("content");
		String index = req.getParameter("index");
		String cate = req.getParameter("cate");
		
		req.setAttribute("content", content);
		req.setAttribute("index", index);
		req.setAttribute("cate", cate);
		return "/content/"+content+"/"+cate+".jsp";
	}

}
