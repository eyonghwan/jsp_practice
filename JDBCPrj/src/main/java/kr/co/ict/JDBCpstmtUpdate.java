package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class JDBCpstmtUpdate {

	public static void main(String[] args) {
		// UPSATE구문을 Scanner로 입력받은 자료를 토대로 실행하는 로직을 작성해주세요.
		// 변수로 접속정보를 관리합니다.
		
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId = "root";
		String dbPW = "mysql";
		
		try {
			
			Scanner scan = new Scanner(System.in);
			System.out.println("업데이트할 회원의 아이디를 입력해주세요.");
			String uId = scan.nextLine();
			
			System.out.println("업데이트할 회원의 비밀번호를 입력해주세요.");
			String uPw = scan.nextLine();
			
			System.out.println("업데이트할 회원의 이름을 입력해주세요.");
			String uName = scan.nextLine();
			
			System.out.println("업데이트할 회원의 이메일을 입력해주세요.");
			String uEmail = scan.nextLine();
			
			
			Class.forName(dbType);
			
			Connection con = DriverManager.getConnection(dbUrl, dbId, dbPW);
			
			String sql = "UPDATE userinfo SET upw=?, uname=?, uemail=? WHERE uid=?";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, uPw);
			pstmt.setString(2, uName);
			pstmt.setString(3, uEmail);
			pstmt.setString(4, uId);
			
			pstmt.executeUpdate();
			
			// .close()로 열린 자료 닫기
			// 일반 자바코드는 어짜피 코드실행 끝나면 프로그램이 강제로 종료되지만
			// 서버의 경우는 코드실행이 끝나도 서버가 계속 돌아가 자원회수를 안 해주면 시스템에 부하가 걸릴 수도 있음.
			// 이를 막기 위해 호출이 끝난 자원은 .close()로 사용해제를 해 줘야 함.
			con.close();
			pstmt.close();
			scan.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			// 종료 안내 구문 + close()로 열린 자료 닫기
			System.out.println("수정로직 실행 완료");
		}

	}

}
