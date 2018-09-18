package kr.co.jboard2.utils;

public class SQL {

	public static final String SELECT_TERMS = "SELECT * FROM JB_TERMS";
	public static final String SELECT_CHECK_ID = "SELECT COUNT(*) FROM JB_MEMBER WHERE uid=?";
	public static final String SELECT_CHECK_NICK = "SELECT COUNT(*) FROM JB_MEMBER WHERE nick=?";
	public static final String SELECT_CHECK_HP = "SELECT COUNT(*) FROM JB_MEMBER WHERE hp=?";
	public static final String SELECT_CHECK_EMAIL = "SELECT COUNT(*) FROM JB_MEMBER WHERE email=?";
	public static final String INSERT_MEMBER = 
				"INSERT INTO JB_MEMBER "+
				"(uid, pass, name, nick, email, hp, grade, zip, addr1, addr2, regip, rdate) "+
				"VALUES (?,?,?,?,?,?,?,?,?,?,?,NOW())";

}
