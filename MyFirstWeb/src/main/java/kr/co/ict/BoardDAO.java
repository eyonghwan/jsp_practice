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
	
	// 페이징 처리를 위해 페이지 번호를 추가로 입력받습니다.
	public List<BoardVO> getAllBoardList(int pageNum) {
		// try블럭 진입 전 Connection, PreparedStatement, ResultSet 서언
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		final int BOARD_COUNT = 10;
		// try블럭 진입 전에 ArrayList 선언
		ArrayList<BoardVO> boardList = new ArrayList<>();
		try {
			// Connection, PreparedStatement, ResultSet을 선언합니다.
			con = ds.getConnection();
			int limitNum = (pageNum - 1) * BOARD_COUNT;
			

			String sql = "SELECT * FROM boardTbl ORDER BY board_num DESC limit ?,?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, limitNum);
			pstmt.setInt(2, BOARD_COUNT);
			
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

	public void insertBoard(String title, String content, String writer) {
		// DB 연결구문을 작성해서 보내주세요.
		// try블럭 진입 전 Connection, PreparedStatement 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			// Connection, PreparedStatement, ResultSet을 선언합니다.
			con = ds.getConnection();
			
			// INSERT의 경우 두 가지 유형이 있음
			// 전체 컬럼 요소 다 넣기 - INSERT INTO boardTbl VALUES (null, ?, ?, ?, now(), now(), 0)
			// 일부요소만 넣기 - INSERT INTO boardTbl(title, content, writer) VALUES (?, ?, ?)
			String sql = "INSERT INTO boardTbl(title, content, writer) VALUES (?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			// 실행 전 상단 쿼리문 ? 채워넣기
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, writer);
			// 실행하기
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}
		}	
	}
	
	public BoardVO getBoardDetail(int board_num) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO boarddata = null;
		try {
			con = ds.getConnection();
			
			String sql = "SELECT * FROM boardTbl WHERE board_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String title = rs.getString("title");
				String content = rs.getString("content");
				String writer = rs.getString("writer");
				Date bdate = rs.getDate("bdate");
				Date mdate = rs.getDate("mdate");
				int hit = rs.getInt("hit");
					
				boarddata = new BoardVO(board_num, title, content, writer, bdate, mdate, hit);
			}
			
		} catch(Exception e) {
			
		} finally {
			try {
				con.close();
				pstmt.close();
				rs.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}
		}
		return boarddata;
	}

	public void deleteBoard(int board_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			
			String sql = "DELETE FROM boardTbl WHERE board_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}
	
	public void updateBoard(int board_num, String title, String content) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			
			String sql = "UPDATE boardTbl SET mdate=now(), title=?, content=? WHERE board_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, board_num);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}
		}
	}

	public void upHit(int board_num) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ds.getConnection();
			
			String sql = "UPDATE boardTbl SET hit = (hit + 1) WHERE board_num = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}
		}
		System.out.println("현재 조회된 글 번호 : " + board_num);
		
	}

	// 페이징 처리를 위해 글 전체 개수를 구해오겠습니다.
	public int getPageNum() {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "SELECT COUNT(*) FROM boardTbl";
		int pageNum = 0;
		try {
			con = ds.getConnection();
			
			pstmt = con.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pageNum = rs.getInt(1);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
				pstmt.close();
			} catch(SQLException se) {
				se.printStackTrace();
			}
		}
		return pageNum;
	}
	
}
