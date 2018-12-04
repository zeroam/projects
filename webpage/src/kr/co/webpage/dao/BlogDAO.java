package kr.co.webpage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import kr.co.webpage.utils.DBConfig;
import kr.co.webpage.utils.SQL;
import kr.co.webpage.vo.ContentVO;

public class BlogDAO {

	// 싱글톤 객체
	private static BlogDAO dao = new BlogDAO();

	public static BlogDAO getInstance() {
		return dao;
	}

	private BlogDAO() {
	}

	// 드라이버 준비
	private Connection conn = null;
	private Statement stmt = null;
	private PreparedStatement psmt = null;
	private ResultSet rs = null;

	// 카테고리 가져오기
	public ArrayList<String> getCate() {
		ArrayList<String> cate = new ArrayList<>();
		String li = null;
		try {
			conn = DBConfig.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_DISTINCT_CATE);

			while (rs.next()) {
				li = rs.getString(1);
				cate.add(li);
			}

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			DBConfig.close(rs);
			DBConfig.close(stmt);
			DBConfig.close(conn);
		}
		return cate;
	}

	// 카테고리에 따른 리스트 가져오기
	public ArrayList<ContentVO> getList(String cate) {

		ArrayList<ContentVO> voList = new ArrayList<>();
		ContentVO vo = null;
		try {
			conn = DBConfig.getConnection();

			psmt = conn.prepareStatement(SQL.SELECT_LIST);
			psmt.setString(1, cate);

			rs = psmt.executeQuery();

			while (rs.next()) {
				vo = new ContentVO();
				vo.setCate(rs.getString(1));
				vo.setTitle(rs.getString(2));

				voList.add(vo);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			DBConfig.close(rs);
			DBConfig.close(stmt);
			DBConfig.close(conn);
		}

		return voList;
	}

	// 글 가져 오기
	public ContentVO getContent(String cate, String title) {
		ContentVO vo = null;
		try {
			conn = DBConfig.getConnection();

			psmt = conn.prepareStatement(SQL.SELECT_CONTENT);
			psmt.setString(1, cate);
			psmt.setString(2, title);

			rs = psmt.executeQuery();

			if (rs.next()) {
				vo = new ContentVO();
				vo.setSeq(rs.getInt(1));
				vo.setCate(rs.getString(2));
				vo.setTitle(rs.getString(3));
				vo.setcont(rs.getString(4));
				vo.setRdate(rs.getString(5));
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			DBConfig.close(rs);
			DBConfig.close(psmt);
			DBConfig.close(conn);
		}

		return vo;
	}
}
