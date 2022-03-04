package kr.co.ict;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	private DataSource ds = null;
	
	private static BoardDAO boarddao = new BoardDAO();
	
	private BoardDAO() {
		try {
			Context ct = new InitialContext();
			ds = (DataSource)ct.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static BoardDAO getInstance() {
		if(boarddao == null) {
			boarddao = new BoardDAO();
		}
		return boarddao;
	}
	
	public List<BoardVO> getAllBoardList() {
		// try블럭 진입 전 Connection, PreparedStatement, ResultSet 서언
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// try블럭 진입 전에 ArrayList 선언
		ArrayList<BoardVO> boardList = new ArrayList<>();
		try {
			// Connection, PreparedStatement, ResultSet을 선언합니다.
			con = ds.getConnection();
			
			String sql = "SELECT * FROM boardTbl";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			// UserVO ArrayList에 rs에 든 자료를 저장해주세요.
			while(rs.next()) {
				int board_num = rs.getInt("board_num");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				Date bdate = rs.getDate("bdate");
				Date mdate = rs.getDate("mdate");
				int hit = rs.getInt("hit");
				
				BoardVO BoardData = new BoardVO(board_num, title, content, writer, bdate, mdate, hit);
				boardList.add(BoardData);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
				rs.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}
		}
		
		return boardList;
	}
}
