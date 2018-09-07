package kr.co.jboard1.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.co.jboard1.config.DBConfig;
import kr.co.jboard1.vo.BoardVO;
import kr.co.jboard1.vo.ConnectDataBase;

//DAO : Data Access Object
//데이터베이스와 쿼리를 수행하는 객체
public class BoardDAO {

	public static BoardDAO dao = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return dao;
	}
	
	private BoardDAO() {};
	
	// 전체 글 갯수
	public int getTotalCount() throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		int count = 0;

		conn = DBConfig.getConnect();

		stmt = conn.createStatement();
		rs = stmt.executeQuery(SQL.BOARD_COUNT);

		if (rs.next()) {
			count = rs.getInt(1);
		}

		if(rs!=null) rs.close();
		if(stmt!=null) stmt.close();
		if(conn!=null) conn.close();

		return count;
	}

	// 페이지 계산
	public int getPage() throws Exception {
		// 페이지 계산
		int paging = 0;
		int total = getTotalCount();
		
		if (total % 10 == 0) {
			paging = total / 10;
		} else {
			paging = total / 10 + 1;
		}
		
		return paging;
	}
	
	//Limit Start값 계산
	public int getLimit(String pg) {
		int start = 0;
		if (pg == null) {
			start = 1;
		} else {
			start = Integer.parseInt(pg);
		}
		
		return start;
	}

	// 글쓰기
	public void write(String[] vars) {
		ConnectDataBase conn = null;
		try {
			conn = new ConnectDataBase();
			conn.executeUpdate(SQL.BOARD_WRITE, vars);
			//5단계
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			//6단계
			if(conn != null) try {conn.close(); } catch(SQLException e) {}
		}
	}

	// 글목록
	public List<BoardVO> list(int p) throws Exception {
		//객체준비
		List<BoardVO> list = new ArrayList<>();
		ConnectDataBase conn = new ConnectDataBase();
		ResultSet rsList = conn.executeQuery(SQL.BOARD_LIST, (p - 1) * 10);
		
		
		while(rsList.next()) {
			BoardVO vo = BoardVO.initBoard(rsList);
			list.add(vo);
		}
		
		rsList.close();
		conn.close();
		
		return list;
	}

	// 글보기
	public BoardVO view(String seq) throws Exception {
		ConnectDataBase conn = new ConnectDataBase();
		BoardVO vo = null;
		ResultSet rs = conn.executeQuery("SELECT * FROM JB_BOARD WHERE seq='"+seq+"';");
		if(rs.next()) {
			vo = BoardVO.initBoard(rs);
		}
		if(rs!=null) rs.close();
		if(conn!=null) conn.close();
		
		return vo;
	}

	// 글수정
	public void modify() {

	}

	// 댓글쓰기
	public void commentWrite() {

	}

	// 댓글목록
	public void commentList() {

	}

}
