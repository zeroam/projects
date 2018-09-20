package kr.co.jboard2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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
	public ArrayList<BoardVO> list(int page) {
		//리스트 배열
		ArrayList<BoardVO> voList = new ArrayList<>();
		BoardVO vo = null;
		try {
			//게시글 출력 시작할 번호
			int num = (page-1)*10;
			
			conn = DBConfig.getConnection();
			
			psmt = conn.prepareStatement(SQL.SELECT_BOARD);
			psmt.setInt(1, num);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				//게시판 객체 초기화
				vo = new BoardVO(rs);
				//게시판 객체 리스트 배열에 추가하기
				voList.add(vo);
			}
		} catch(ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			DBConfig.close(rs);
			DBConfig.close(stmt);
			DBConfig.close(conn);
		}
		return voList;
	}
	
	
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
	
	//글보기 메소드
	public BoardVO view(String seq) {
		BoardVO vo = null;
		
		try {
			conn = DBConfig.getConnection();
			
			psmt = conn.prepareStatement(SQL.VIEW_BOARD);
			psmt.setString(1, seq);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				vo = new BoardVO(rs);
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
	
	//글수정 메소드
	public void modify() {}
	
	//글삭제 메소드
	public void delete() {}
	
	//전체 페이지 계산
	public int getTotalPage() {
		//전체 페이지
		int total_page = 1;
		
		try {
			conn = DBConfig.getConnection();
					
			psmt = conn.prepareStatement(SQL.GET_TOTAL_BOARD);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				//전체 게시글 숫자
				int total_board = rs.getInt(1);
				
				//10으로 나누어 떨어질 경우
				if(total_board%10 == 0) {
					total_page = total_board/10;
				//10으로 안나누어 떨어질 경우
				} else {
					total_page = total_board/10 + 1;
				}
			}
		} catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConfig.close(rs);
			DBConfig.close(psmt);
			DBConfig.close(conn);
		}
		return total_page;
	}
	
	//게시글 시작 번호 구하기
	public int getBoardNumber(int page) {
		int startNum = 1;
		
		try {
			conn = DBConfig.getConnection();
					
			psmt = conn.prepareStatement(SQL.GET_TOTAL_BOARD);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				//전체 게시글 숫자
				int total_board = rs.getInt(1);
				startNum = total_board - (page-1)*10;
			}
		} catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBConfig.close(rs);
			DBConfig.close(psmt);
			DBConfig.close(conn);
		}
		
		return startNum;
	}
}
