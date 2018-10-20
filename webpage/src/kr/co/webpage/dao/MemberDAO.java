package kr.co.webpage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import kr.co.webpage.utils.DBConfig;
import kr.co.webpage.utils.SQL;
import kr.co.webpage.vo.MemberVO;
import kr.co.webpage.vo.TermsVO;

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
				vo.setUser(rs.getString(2));
				vo.setPass(rs.getString(3));
				vo.setEmail(rs.getString(4));
				vo.setGrade(rs.getInt(5));
				vo.setRegip(rs.getString(6));
				vo.setRdate(rs.getString(7));
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
	
	//회원가입 처리
	public boolean register(MemberVO memberVO) {
		
		boolean result = false;
		
		try {
			conn = DBConfig.getConnection();
			
			psmt = conn.prepareStatement(SQL.INSERT_MEMBER);
			psmt.setString(1, memberVO.getUser());
			psmt.setString(2, memberVO.getPass());
			psmt.setString(3, memberVO.getEmail());
			psmt.setInt(4, memberVO.getGrade());
			psmt.setString(5, memberVO.getRegip());
			
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
