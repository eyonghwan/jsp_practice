package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCDelete {

	public static void main(String[] args) {
		// 사용자가 Scanner로 아이디를 입력하면
		// 해당 아이디 정보가 DB에서 삭제되도록 로직을 작성해보세요.
		// 역시 executeUpdate("실행문"); 으로 실행합니다.
		// 실행 전 콘솔을 이용해 쿼리문을 확인하는 코드도 같이 작성해주세요.
		
		// 접속용 DB종류, 주소, id, pw는 변수로 관리해도 됩니다.
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId = "root";
		String dbPw = "mysql";
		
		try {
			Scanner scan = new Scanner(System.in);
			
			System.out.println("삭제할 아이디를 입력해주세요.");
			String delId = scan.nextLine();
			// DB종류 지정
			Class.forName(dbType);
			// DB서버와 자바간 연결
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
			Statement stmt = con.createStatement();
			
			System.out.println("발송할 쿼리문");
			System.out.println("DELETE FROM userinfo WHERE uid = '" + delId + "'");
			System.out.println("-----------------------");
			stmt.executeUpdate("DELETE FROM userinfo WHERE uid = '" + delId + "'");
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}

	}

}
