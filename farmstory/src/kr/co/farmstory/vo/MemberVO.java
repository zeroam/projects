package kr.co.farmstory.vo;

import javax.servlet.http.HttpServletRequest;

public class MemberVO {

	private int seq;
	private String uid;
	private String pass;
	private String name;
	private String nick;
	private String email;
	private String hp;
	private int grade;
	private String zip;
	private String addr1;
	private String addr2;
	private String regip;
	private String rdate;
	
	public MemberVO() {
		
	}
	
	public MemberVO(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("UTF-8");
		this.uid = req.getParameter("id");
		this.pass = req.getParameter("pw1");
		this.name = req.getParameter("name");
		this.nick = req.getParameter("nick");
		this.email = req.getParameter("email");
		this.hp = req.getParameter("hp");
		this.grade = 2;
		this.zip = req.getParameter("zip");
		this.addr1 = req.getParameter("addr1");
		this.addr2 = req.getParameter("addr2");
		this.regip = req.getRemoteAddr();
	}
	
	//get, set 메소드 ...
	
	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
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
