package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;

public class JDBCpstmtInsert {

	public static void main(String[] args) {
		// INSERT 구문을 작성해주세요.
		// 변수로 접속정보를 관리합니다.
		
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId = "root";
		String dbPw = "mysql";
		
		try {
			// 0. Scanner로 INSERT에 필요한 정보를 입력받기
			Scanner scan = new Scanner(System.in);
			System.out.println("추가할 회원의 아이디를 입력해주세요.");
			String uId = scan.nextLine();
			
			System.out.println("추가할 회원의 비밀번호를 입력해주세요.");
			String uPw = scan.nextLine();
			
			System.out.println("추가할 회원의 이름을 입력해주세요.");
			String uName = scan.nextLine();
			
			System.out.println("추가할 회원의 이메일을 입력해주세요.");
			String uEmail = scan.nextLine();
			
			// 1. 접속정보 정의 및 DB 연결하기
			Class.forName(dbType);
			
			Connection con = DriverManager.getConnection(dbUrl,dbId,dbPw);
			
			// 2. 쿼리문 생성
			// 		INSERT INTO 구문의 경우는 VALUES (?, ?, ?, ?)와 같이 값이 들어갈 자리를
			//		, 로 구분하는 부분까지 문자열로 구현해주셔야합니다.
			String sql = "INERT INTO userinfo VALUES(?, ?, ?, ?)";
			
			// 3. pstmt 생성 및 ?에 변수 매칭
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uName);
			pstmt.setString(2, uId);
			pstmt.setString(3, uPw);
			pstmt.setString(4, uEmail);
			
			// 4. 실행
			pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}

	}

}
