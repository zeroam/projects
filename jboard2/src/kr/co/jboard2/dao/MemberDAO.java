package kr.co.jboard2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import kr.co.jboard2.utils.DBConfig;
import kr.co.jboard2.utils.SQL;
import kr.co.jboard2.vo.MemberVO;
import kr.co.jboard2.vo.TermsVO;

public class MemberDAO {

	// 싱글톤 객체로
	private static MemberDAO dao = new MemberDAO();

	public static MemberDAO getInstance() {
		return dao;
	}

	private MemberDAO() {
	}

	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;

	public void login() throws Exception {
	}
	
	//약관 페이지
	public TermsVO terms() {

		String terms = null;
		String privacy = null;
		TermsVO termsVO = new TermsVO();
		try {

			// 2단계
			conn = DBConfig.getConnection();

			// 3단계
			stmt = conn.createStatement();

			// 4단계
			rs = stmt.executeQuery(SQL.SELECT_TERMS);

			// 5단계
			if (rs.next()) {
				terms = rs.getString(1);
				privacy = rs.getString(2);

			}

			termsVO.setTerms(terms);
			termsVO.setPrivacy(privacy);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			// 6단계
			DBConfig.close(rs);
			DBConfig.close(stmt);
			DBConfig.close(conn);
		}
		return termsVO;
	}
	
	//회원가입 처리
	public boolean register(MemberVO memberVO) {
		
		boolean result = false;
		
		try {
			//2단계
			conn = DBConfig.getConnection();
			
			//3단계
			psmt = conn.prepareStatement(SQL.INSERT_MEMBER);
			psmt.setString(1, memberVO.getUid());
			psmt.setString(2, memberVO.getPass());
			psmt.setString(3, memberVO.getName());
			psmt.setString(4, memberVO.getNick());
			psmt.setString(5, memberVO.getEmail());
			psmt.setString(6, memberVO.getHp());
			psmt.setInt(7, memberVO.getGrade());
			psmt.setString(8, memberVO.getZip());
			psmt.setString(9, memberVO.getAddr1());
			psmt.setString(10, memberVO.getAddr2());
			psmt.setString(11, memberVO.getRegip());
			
			//4단계
			psmt.executeUpdate();
			
			result = true;
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			//6단계
			DBConfig.close(psmt);
			DBConfig.close(conn);
		}
		
		return result;
	}

	public int check(String check, String value) {
		int result = 0;

		
		try {

			// 2단계
			conn = DBConfig.getConnection();

			// 3단계
			switch(check) {
			case "uid":
				psmt = conn.prepareStatement(SQL.SELECT_CHECK_ID);
				break;
			case "nick":
				psmt = conn.prepareStatement(SQL.SELECT_CHECK_NICK);
				break;
			case "hp":
				psmt = conn.prepareStatement(SQL.SELECT_CHECK_HP);
				break;
			case "email":
				psmt = conn.prepareStatement(SQL.SELECT_CHECK_EMAIL);
				break;
			default:
				throw new SQLException();
			} 
			psmt.setString(1, value);

			// 4단계
			rs = psmt.executeQuery();

			// 5단계
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			// 6단계
			DBConfig.close(rs);
			DBConfig.close(stmt);
			DBConfig.close(conn);
		}
		return result;
	}
}
