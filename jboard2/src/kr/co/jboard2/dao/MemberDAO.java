package kr.co.jboard2.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.PreparedStatement;

import kr.co.jboard2.utils.DBConfig;
import kr.co.jboard2.utils.SQL;
import kr.co.jboard2.vo.TermsVO;

public class MemberDAO {
	
	//싱글톤 객체로
	private static MemberDAO dao = new MemberDAO();
	public static MemberDAO getInstance() {
		return dao;
	}
	
	private MemberDAO() {}

	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	
	public void login() throws Exception {}
	
	public TermsVO terms() {
		
		String terms = null;
		String privacy = null;
		TermsVO termsVO = new TermsVO();
		try {
			
			
			//2단계
			conn = DBConfig.getConnection();
			
			//3단계
			stmt = conn.createStatement();
			
			//4단계
			rs = stmt.executeQuery(SQL.SELECT_TERMS);
			
			//5단계
			if(rs.next()) {
				terms = rs.getString(1);
				privacy = rs.getString(2);
				
			}
			
			termsVO.setTerms(terms);
			termsVO.setPrivacy(privacy);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			//6단계
			DBConfig.close(rs);
			DBConfig.close(stmt);
			DBConfig.close(conn);		
		}		
		return termsVO;
	}
	
	public void register() throws Exception {}
	
	public void checkValidate() throws Exception {}
	
}
