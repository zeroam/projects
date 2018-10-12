package kr.co.farmstory.config;

public class SQL {

	public static final String SELECT_TERMS = "SELECT * FROM FS_TERMS";
	public static final String SELECT_CHECK_ID = "SELECT COUNT(*) FROM FS_MEMBER WHERE uid=?";
	public static final String SELECT_CHECK_NICK = "SELECT COUNT(*) FROM FS_MEMBER WHERE nick=?";
	public static final String SELECT_CHECK_HP = "SELECT COUNT(*) FROM FS_MEMBER WHERE hp=?";
	public static final String SELECT_CHECK_EMAIL = "SELECT COUNT(*) FROM FS_MEMBER WHERE email=?";
	public static final String SELECT_UID_PASS = "SELECT * FROM FS_MEMBER WHERE uid=? AND pass=PASSWORD(?)";
	public static final String INSERT_MEMBER = "INSERT INTO FS_MEMBER (uid, pass, name, nick, email, hp, grade, zip, addr1, addr2, regip, rdate) VALUES (?,PASSWORD(?),?,?,?,?,?,?,?,?,?,NOW())";
	
	public static final String INSERT_BOARD = "INSERT INTO FS_BOARD (cate, title, contents, file, uid, regip, rdate) VALUES (?,?,?,?,?,?,NOW());";
	public static final String SELECT_BOARD = "SELECT b.*, m.nick FROM FS_BOARD AS b LEFT JOIN FS_MEMBER AS m ON b.uid = m.uid WHERE parent=0 ORDER BY b.seq DESC LIMIT ?, 10;";
	public static final String VIEW_BOARD = "SELECT * FROM FS_BOARD WHERE seq=?;";
	public static final String UPDATE_HIT = "UPDATE FS_BOARD SET hit = hit+1 WHERE seq=?;";
	public static final String GET_TOTAL_BOARD = "SELECT COUNT(*) FROM FS_BOARD WHERE parent=0;";
	public static final String DELETE_BOARD = "DELETE FROM FS_BOARD WHERE seq=? OR parent=?";
	public static final String UPDATE_BOARD = "UPDATE FS_BOARD SET title=?, contents=? WHERE seq=?;";
	
	public static final String INSERT_COMMENT ="INSERT INTO FS_BOARD SET parent=?, cate=?, contents=?, uid=?, regip=?, rdate=NOW();";
	public static final String SELECT_COMMENT = "SELECT b.*, m.nick FROM FS_BOARD AS b JOIN FS_MEMBER AS m USING(uid) WHERE parent=?;";
	public static final String INCREASE_COMMENT = "UPDATE FS_BOARD SET comment = comment+1 WHERE seq=?;";
	public static final String DECREASE_COMMENT = "UPDATE FS_BOARD SET comment = comment-1 WHERE seq=?;";
	
	public static final String SELECT_MAX_SEQ = "SELECT MAX(seq) FROM FS_BOARD";
	
	public static final String INSERT_FILE = "INSERT INTO FS_FILE SET parent=?, oldName=?, newName=?;";
	public static final String SELECT_FILE = "SELECT * FROM FS_FILE WHERE parent=?";

}
