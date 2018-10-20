package kr.co.webpage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.webpage.controller.CommandAction;
import kr.co.webpage.dao.BlogDAO;
import kr.co.webpage.vo.ContentVO;

public class BlogService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		
		String cate = req.getParameter("cate");
		String title = req.getParameter("title");
		
		Map<String, List<ContentVO>> cateMap = new HashMap<>();
		
		BlogDAO dao = BlogDAO.getInstance();
		// 카테고리 목록 가져오기
		List<String> cateList = dao.getCate();
		
		// 카테고리에 따른 리스트 목록 가져오기
		for(String str: cateList) {
			List<ContentVO> list = dao.getList(str);
			cateMap.put(str, list);
		}
		
		if(cate != null) {
			req.setAttribute("cate", cate);
		}
		
		// 컨텐츠 가져오기
		if(cate != null && title != null) {
			ContentVO content = dao.getContent(cate, title);
			req.setAttribute("content", content);
			req.setAttribute("title", title);
		}
		
		// 리퀘스트 속성 값 부여
		req.setAttribute("list", cateMap);
		
		return "blog.jsp";
	}

}
