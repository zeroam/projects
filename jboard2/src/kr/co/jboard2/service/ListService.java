package kr.co.jboard2.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.jboard2.controller.CommandAction;
import kr.co.jboard2.dao.BoardDAO;
import kr.co.jboard2.vo.BoardVO;

public class ListService implements CommandAction {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		//세션값이 없음에도 URL로 접근하는 것 막기
		if(session.getAttribute("member") == null) {
			return "redirect:/jboard2/member/login.do";
		}
		
		//현재 페이지
		int page = 1;
		if(req.getParameter("page") != null) {
			page = Integer.parseInt(req.getParameter("page"));			
		}
		
		//arraylist로 boardVO 객체 받기
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardVO> voList = dao.list(page);
		req.setAttribute("list", voList);
		
		//전체 페이지 얻고 리퀘스트 객체에 속성 지정하기
		int total_page = dao.getTotalPage();
		req.setAttribute("total_page", total_page);
		
		//게시글 시작번호 구하기
		int startNum = dao.getBoardNumber(page);
		req.setAttribute("startNum", startNum);
		
		//현재 페이지 번호 설정
		req.setAttribute("page", page);
		
		//이전 이후 페이지 설정
		int prepage = 1;
		if(page > 1) {
			prepage = page-1;
		}
		int postpage = page+1;
		if(page >= total_page) {
			postpage = page;
		}
		
		req.setAttribute("prepage", prepage);
		req.setAttribute("postpage", postpage);
		
		//페이지 그룹 계산
		int groupCurrent = (int)Math.ceil(page/10.0);
		int groupStart = (groupCurrent-1)*10 + 1;
		int groupEnd = groupCurrent*10;
		if(groupEnd > total_page) {
			groupEnd = total_page;
		}
		
		req.setAttribute("groupStart", groupStart);
		req.setAttribute("groupEnd", groupEnd);
		
		
		return "/list.jsp";
	}

}
