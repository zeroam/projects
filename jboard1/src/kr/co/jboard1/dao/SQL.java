package kr.co.jboard1.dao;

public class SQL {
	
	//ȸ��
	
	
	//�Խ���
	public static final String BOARD_COUNT = "SELECT COUNT(*) FROM JB_BOARD";
	public static final String BOARD_LIST = "SELECT * FROM JB_BOARD ORDER BY seq DESC LIMIT ?, 10;";
	
	
	//�۾���
	public static final String BOARD_WRITE = "INSERT INTO JB_BOARD SET "
											+ "cate='notice', title=?, contents=?, "
											+ "uid=?, regip=?, rdate=NOW();";
	public static final String BOARD_VIEW = "SELECT * FROM JB_BOARD WHERE seq=?;";
	
}
