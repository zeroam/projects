<%@page import="kr.co.jboard1.dao.BoardDAO"%>
<%@page import="kr.co.jboard1.vo.BoardVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jboard1.vo.MemberVO"%>
<%@page import="kr.co.jboard1.vo.ConnectDataBase"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//파라미터 수신
	request.setCharacterEncoding("UTF-8");
	String pg = request.getParameter("pg");

	MemberVO user = (MemberVO) session.getAttribute("user");


	BoardDAO dao = BoardDAO.getInstance();
	//Start 값 계산
	int p = dao.getLimit(pg);
	//전체 페이지 계산
	int paging = dao.getPage();
	//글 목록
	List<BoardVO> list = dao.list(p);
%>