package kr.co.museum.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.museum.controller.CommandAction;

public class NewsService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		String index = req.getParameter("index");
		String cate = req.getParameter("cate");
		
		req.setAttribute("content", "news");
		req.setAttribute("index", index);
		req.setAttribute("cate", cate);
		return "/content/news/"+cate+".jsp";
	}

}
