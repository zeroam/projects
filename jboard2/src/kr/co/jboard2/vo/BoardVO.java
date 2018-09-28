package kr.co.jboard2.vo;

import java.sql.ResultSet;
import java.sql.SQLException;

public class BoardVO {

	private int seq;
	private int parent;
	private int comment;
	private String cate;
	private String title;
	private String contents;
	private int file;
	private int hit;
	private String uid;
	private String regip;
	private String rdate;
	private String nick;
	
	public BoardVO() {
		
	}
	
	public BoardVO(ResultSet rs) throws SQLException {
		this.seq = rs.getInt(1);
		this.parent = rs.getInt(2);
		this.comment = rs.getInt(3);
		this.cate = rs.getString(4);
		this.title = rs.getString(5);
		this.contents = rs.getString(6);
		this.file = rs.getInt(7);
		this.hit = rs.getInt(8);
		this.uid = rs.getString(9);
		this.regip = rs.getString(10);
		this.rdate = rs.getString(11);
	}
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public int getComment() {
		return comment;
	}
	public void setComment(int comment) {
		this.comment = comment;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getFile() {
		return file;
	}
	public void setFile(int file) {
		this.file = file;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
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
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	
	
}
