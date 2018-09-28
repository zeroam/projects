package kr.co.jboard2.utils;

public class SQL {

	public static final String SELECT_TERMS = "SELECT * FROM JB_TERMS";
	public static final String SELECT_CHECK_ID = "SELECT COUNT(*) FROM JB_MEMBER WHERE uid=?";
	public static final String SELECT_CHECK_NICK = "SELECT COUNT(*) FROM JB_MEMBER WHERE nick=?";
	public static final String SELECT_CHECK_HP = "SELECT COUNT(*) FROM JB_MEMBER WHERE hp=?";
	public static final String SELECT_CHECK_EMAIL = "SELECT COUNT(*) FROM JB_MEMBER WHERE email=?";
	public static final String SELECT_UID_PASS = "SELECT * FROM JB_MEMBER WHERE uid=? AND pass=?";
	public static final String INSERT_MEMBER = "INSERT INTO JB_MEMBER (uid, pass, name, nick, email, hp, grade, zip, addr1, addr2, regip, rdate) VALUES (?,?,?,?,?,?,?,?,?,?,?,NOW())";
	
	public static final String INSERT_BOARD = "INSERT INTO JB_BOARD (cate, title, contents, file, uid, regip, rdate) VALUES (?,?,?,?,?,?,NOW());";
	public static final String SELECT_BOARD = "SELECT b.*, m.nick FROM JB_BOARD AS b LEFT JOIN JB_MEMBER AS m ON b.uid = m.uid WHERE parent=0 ORDER BY b.seq DESC LIMIT ?, 10;";
	public static final String VIEW_BOARD = "SELECT * FROM JB_BOARD WHERE seq=?;";
	public static final String UPDATE_HIT = "UPDATE JB_BOARD SET hit = hit+1 WHERE seq=?;";
	public static final String GET_TOTAL_BOARD = "SELECT COUNT(*) FROM JB_BOARD WHERE parent=0;";
	public static final String DELETE_BOARD = "DELETE FROM JB_BOARD WHERE seq=? OR parent=?";
	public static final String UPDATE_BOARD = "UPDATE JB_BOARD SET title=?, contents=? WHERE seq=?;";
	
	public static final String INSERT_COMMENT ="INSERT INTO JB_BOARD SET parent=?, cate=?, contents=?, uid=?, regip=?, rdate=NOW();";
	public static final String SELECT_COMMENT = "SELECT b.*, m.nick FROM JB_BOARD AS b JOIN JB_MEMBER AS m USING(uid) WHERE parent=?;";
	public static final String INCREASE_COMMENT = "UPDATE JB_BOARD SET comment = comment+1 WHERE seq=?;";
	public static final String DECREASE_COMMENT = "UPDATE JB_BOARD SET comment = comment-1 WHERE seq=?;";
	
	public static final String SELECT_MAX_SEQ = "SELECT MAX(seq) FROM JB_BOARD";
	
	public static final String INSERT_FILE = "INSERT INTO JB_FILE SET parent=?, oldName=?, newName=?;";
	public static final String SELECT_FILE = "SELECT * FROM JB_FILE WHERE parent=?";

}
