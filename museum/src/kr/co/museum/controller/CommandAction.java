package kr.co.museum.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandAction {

	public String requestProc(HttpServletRequest req, HttpServletResponse resp);
	
}
