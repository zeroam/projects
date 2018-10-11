package kr.co.farmstory.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import kr.co.farmstory.config.DBConfig;
import kr.co.farmstory.config.SQL;
import kr.co.farmstory.vo.MemberVO;
import kr.co.farmstory.vo.TermsVO;

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

	// 약관 페이지
	public TermsVO terms() {

		String terms = null;
		String privacy = null;
		TermsVO termsVO = new TermsVO();
		try {
			conn = DBConfig.getConnection();

			stmt = conn.createStatement();

			rs = stmt.executeQuery(SQL.SELECT_TERMS);

			if (rs.next()) {
				terms = rs.getString(1);
				privacy = rs.getString(2);

			}

			termsVO.setTerms(terms);
			termsVO.setPrivacy(privacy);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			DBConfig.close(rs);
			DBConfig.close(stmt);
			DBConfig.close(conn);
		}
		return termsVO;
	}

	// 회원가입 처리
	public boolean register(MemberVO memberVO) {

		boolean result = false;

		try {
			conn = DBConfig.getConnection();

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

			psmt.executeUpdate();

			result = true;
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			DBConfig.close(psmt);
			DBConfig.close(conn);
		}

		return result;
	}

	// 중복 여부 검사
	public int check(String check, String value) {
		int result = 0;

		try {
			conn = DBConfig.getConnection();

			switch (check) {
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

			rs = psmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			DBConfig.close(rs);
			DBConfig.close(stmt);
			DBConfig.close(conn);
		}
		return result;
	}

}