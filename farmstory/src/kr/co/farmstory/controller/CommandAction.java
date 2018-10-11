package kr.co.farmstory.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 다형성 구현을 위한 인터페이스
public interface CommandAction {

	public String requestProc(HttpServletRequest req, HttpServletResponse resp);
	
}
