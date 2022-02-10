package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCUpdate {

	public static void main(String[] args) {
		// UPDATE구문도 처리해보세요.
		// UPDATE는 id는 변경하지 않습니다.
		// 어떤 아이디의 pw, name, email을 변경할 지 조회하기 위해
		// 먼저 id 를 받고, 그 다음
		// pw, name, email 을 받아서
		// UPDATE구문에서 조건절에 id를 넣어 타겟을 정하고
		// 나머지 항목만 수정되도록 처리해주세요.
		
		// JDBC 프로그래밍 순서
		// 1. DB종류 인식
		// 2. 연결하기(스키마주소, 아이디, 비밀번호)
		// 3. 쿼리문 발송 준비하기
		// 4. 쿼리문 발송 전 콘솔에 찍어서 체크하기
		// 5. 쿼리문 발송 후 변경 내역이 DB에 반영되었는지 체크
		
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId = "root";
		String dbPw = "mysql";
		
		try {
			Scanner scan = new Scanner(System.in);
			
			System.out.println("변경할 아이디를 입력해주세요.");
			String updateId = scan.nextLine(); 
			
			System.out.println("변경할 비밀번호를 입력해주세요.");
			String updatePw = scan.nextLine(); 
			
			System.out.println("변경할 이름을 입력해주세요.");
			String updateName = scan.nextLine(); 
			
			System.out.println("변경할 이메일을 입력해주세요.");
			String updateEmail = scan.nextLine(); 
			
			// DB종류 지정
			Class.forName(dbType);
			// DB서버와 자바간 연결
			Connection con = DriverManager.getConnection(dbUrl,dbId,dbPw);
			Statement stmt = con.createStatement();
			
			System.out.println("실행할 쿼리문");
			System.out.println("UPDATE userinfo SET upw = '" + updatePw + "', uname = '" + updateName +
					"', uemail = '" + updateEmail + "' WHERE uid = '" + updateId + "'");
			System.out.println("--------------------");
			stmt.executeUpdate("UPDATE userinfo SET upw = '" + updatePw + "', uname = '" + updateName +
														"', uemail = '" + updateEmail + "' WHERE uid = '" + updateId + "'");
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}

	}

}
