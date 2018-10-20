package kr.co.webpage.vo;

import javax.servlet.http.HttpServletRequest;

public class MemberVO {

	private int seq;
	private String user;
	private String pass;
	private String email;
	private int grade;
	private String regip;
	private String rdate;
	
	public MemberVO() {
		
	}
	
	// 회원가입할 때
	public MemberVO(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("UTF-8");
		this.user = req.getParameter("user");
		this.pass = req.getParameter("pass");
		this.email = req.getParameter("email");
		this.grade = 2;
		this.regip = req.getRemoteAddr();
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	//get, set 메소드 ...
	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getRegip() {
		return regip;
	}

	public void setRegip(String regip) {
		this.regip = regip;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
}
