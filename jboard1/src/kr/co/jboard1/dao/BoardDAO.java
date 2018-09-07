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
//�����ͺ��̽��� ������ �����ϴ� ��ü
public class BoardDAO {

	public static BoardDAO dao = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return dao;
	}
	
	private BoardDAO() {};
	
	// ��ü �� ����
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

	// ������ ���
	public int getPage() throws Exception {
		// ������ ���
		int paging = 0;
		int total = getTotalCount();
		
		if (total % 10 == 0) {
			paging = total / 10;
		} else {
			paging = total / 10 + 1;
		}
		
		return paging;
	}
	
	//Limit Start�� ���
	public int getLimit(String pg) {
		int start = 0;
		if (pg == null) {
			start = 1;
		} else {
			start = Integer.parseInt(pg);
		}
		
		return start;
	}

	// �۾���
	public void write(String[] vars) {
		ConnectDataBase conn = null;
		try {
			conn = new ConnectDataBase();
			conn.executeUpdate(SQL.BOARD_WRITE, vars);
			//5�ܰ�
		
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			//6�ܰ�
			if(conn != null) try {conn.close(); } catch(SQLException e) {}
		}
	}

	// �۸��
	public List<BoardVO> list(int p) throws Exception {
		//��ü�غ�
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

	// �ۺ���
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

	// �ۼ���
	public void modify() {

	}

	// ��۾���
	public void commentWrite() {

	}

	// ��۸��
	public void commentList() {

	}

}
