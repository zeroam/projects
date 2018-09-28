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

	//id, pass값을 가진 데이터 불러오기
	public MemberVO login(String id, String pw) {
		MemberVO vo = null;
		try {
			conn = DBConfig.getConnection();
			
			psmt = conn.prepareStatement(SQL.SELECT_UID_PASS);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new MemberVO();
				vo.setSeq(rs.getInt(1));
				vo.setUid(rs.getString(2));
				vo.setPass(rs.getString(3));
				vo.setName(rs.getString(4));
				vo.setNick(rs.getString(5));
				vo.setEmail(rs.getString(6));
				vo.setHp(rs.getString(7));
				vo.setGrade(rs.getInt(8));
				vo.setZip(rs.getString(9));
				vo.setAddr1(rs.getString(10));
				vo.setAddr2(rs.getString(11));
				vo.setRegip(rs.getString(12));
				vo.setRdate(rs.getString(13));
			}
		} catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConfig.close(rs);
			DBConfig.close(psmt);
			DBConfig.close(conn);
		}
		
		return vo;
	}
	
	//약관 페이지
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
	
	//회원가입 처리
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

	//중복 여부 검사
	public int check(String check, String value) {
		int result = 0;

		
		try {
			conn = DBConfig.getConnection();

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
