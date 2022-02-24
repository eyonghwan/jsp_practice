package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

// DAO 클래스는 DB연동을 전담하여 처리합니다.
public class UserDAO {
	
	// DB접속에 필요한 변수들을 아래에 선언합니다.
	private String dbType = "com.mysql.cj.jdbc.Driver";
	private String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	private String dbId = "root";
	private String dbPw = "mysql";
	
	// 생성할 때 자동으로 Class.forName()을 실행하게 만듭니다.
	// 어떤 쿼리구문을 실행하더라도 공통적으로 활용하는 부분
	public UserDAO() {
		try {
			Class.forName(dbType);
		} catch(Exception e) {
			e.printStackTrace();
		}	
	}
	
	// user_list2.jsp의 코드 로직을 대체해보겠습니다.
	// user_list2.jsp에서 전체 유저 목록을 필요로 하기 때문에
	// 실행 결과로 List<UserVO>를 리턴해줘야 합니다.
	// 역시 SELECT 구문을 실행할때에는 리턴자료가 필요하고
	// INSERT, DELETE, UPDATE구문을 실행할 때는 리턴자료가 void입니다.
	public List<UserVO> getAllUserList() {
		// try블럭 진입 전 Connection, PreparedStatement, ResultSet 서언
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// try블럭 진입 전에 ArrayList 선언
		ArrayList<UserVO> userList = new ArrayList<>();
		try {
			// Connection, PreparedStatement, ResultSet을 선언합니다.
			con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM userinfo";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			// UserVO ArrayList에 rs에 든 자료를 저장해주세요.
			while(rs.next()) {
				String uName = rs.getString("uname");
				String uId = rs.getString("uid");
				String uPw = rs.getString("upw");
				String uEmail = rs.getString("uemail");
				
				UserVO userData = new UserVO(uName, uId, uPw, uEmail);
				userList.add(userData);
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
		
		return userList;
	}
	
	
	// login_update.jsp의 경우 로그인한 유저 한 명의 데이터만 DB에서 얻어옵니다.
	// 따라서, 그 한 명의 유져 데이터만을 이용해 SELECT구문을 써야합니다.
	// login_update.jsp 상단의 sId 변수에 들어있는 유저명을 이용해 유져데이터를 얻어옵니다.
	public UserVO getUserData(String sId) {
		// 접속로직은 getAllUserList()와 큰 차이가 없고 쿼리문만 좀 다릅니다.
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// try블럭 진입 전에 ArrayList 선언
		UserVO userData = new UserVO(null, null, null, null);
		try {
			// Connection, PreparedStatement, ResultSet을 선언합니다.
			con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM userinfo WHERE uid=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, sId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String uName = rs.getString("uname");
				String uId = rs.getString("uid");
				String uPw = rs.getString("upw");
				String uEmail = rs.getString("uemail");
					
				userData = new UserVO(uName, uId, uPw, uEmail);
			} else {
				userData = new UserVO(" ", " ", " ", " ");
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
		return userData; // DB에서 UserVO에 데이터를 받아주신 다음 null 대신 받아온 데이터를 리턴하세요.
	}
	
	// updateCHeck에 필요한 userUpdate메서드를 아래에 정의해주세요.
	// UPADTE구문을 실행하기 때문에 리턴 자료가 필요없고
	// update_check.jsp에 있는 쿼리문을 실행하기 위해
	// id, pw, name, email정보를 모두 받아옵니다.
	
	public void userUpdate(String id, String pw, String name, String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			String sql = "UPDATE userinfo SET upw = ?, uname = ?, uemail = ? WHERE uid=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, pw);
			pstmt.setString(2, name);
			pstmt.setString(3, email);
			pstmt.setString(4, id);
			
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
	
	public void deleteUser(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			String sql = "DELETE FROM userinfo WHERE uid=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
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
	
	public void insertUser(String id, String pw, String name, String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			
			String sql = "INSERT INTO userinfo VALUES(?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, pw);
			pstmt.setString(4, email);
			
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
	
}
