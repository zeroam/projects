package kr.co.jboard1.vo;

import java.sql.ResultSet;


// JB_BOARD ���̺� ��ü
public class BoardVO {

	private int seq;
	private int parent;
	private int comment;
	private String cate;
	private String title;
	private String content;
	private int file;
	private int hit;
	private String uid;
	private String regip;
	private String rdate;
	
	
	public static BoardVO initBoard(ResultSet rsList) throws Exception {
		BoardVO vo = new BoardVO();
		vo.setSeq(rsList.getInt(1));
		vo.setParent(rsList.getInt(2));
		vo.setComment(rsList.getInt(3));
		vo.setCate(rsList.getString(4));
		vo.setTitle(rsList.getString(5));
		vo.setContent(rsList.getString(6));
		vo.setFile(rsList.getInt(7));
		vo.setHit(rsList.getInt(8));
		vo.setUid(rsList.getString(9));
		vo.setRegip(rsList.getString(10));
		vo.setRdate(rsList.getString(11));
		return vo;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	
	
}
