package kr.co.jboard2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import kr.co.jboard2.utils.DBConfig;
import kr.co.jboard2.utils.SQL;
import kr.co.jboard2.vo.BoardVO;

public class BoardDAO {
	//싱글톤 객체
	private static BoardDAO dao = new BoardDAO();
	public static BoardDAO getInstance() {
		return dao;
	}
	private BoardDAO() {}
	
	//드라이버 준비
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;
	
	//글 목록 메소드
	public void list() {}
	
	
	//글쓰기 메소드
	public void write(BoardVO vo) {
		try {
			conn = DBConfig.getConnection();
			
			psmt = conn.prepareStatement(SQL.INSERT_BOARD);
			psmt.setString(1, vo.getCate());
			psmt.setString(2,vo.getTitle());
			psmt.setString(3, vo.getContents());
			psmt.setString(4, vo.getUid());
			psmt.setString(5, vo.getRegip());
			
			psmt.executeUpdate();
			
		} catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConfig.close(psmt);
			DBConfig.close(conn);
		}
		
	}
	
	public void modify() {}
	public void delete() {}
}
