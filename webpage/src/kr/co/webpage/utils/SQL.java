package kr.co.webpage.utils;

public class SQL {
	
	public static final String SELECT_CHECK_ID = "SELECT COUNT(*) FROM MB_MEMBER WHERE user=?";
	public static final String SELECT_CHECK_EMAIL = "SELECT COUNT(*) FROM MB_MEMBER WHERE email=?";

	public static final String SELECT_UID_PASS = "SELECT * FROM MB_MEMBER WHERE user=? AND pass=PASSWORD(?)";
	public static final String INSERT_MEMBER = "INSERT INTO MB_MEMBER (user, pass, email, grade, regip, rdate) VALUES (?,PASSWORD(?),?,?,?,NOW())";
	
	public static final String SELECT_LIST = "SELECT cate, title FROM CONTENT WHERE cate=?";
	public static final String SELECT_CONTENT = "SELECT * FROM CONTENT WHERE cate=? AND title=?";
	public static final String SELECT_DISTINCT_CATE = "SELECT DISTINCT cate FROM CONTENT";

}
