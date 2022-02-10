package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

public class JDBDInsert {

	public static void main(String[] args) {
		// Scanner로 id, pw, name, email을 입력받아
		// INSERT INTO 구문을 이용해 DB에 데이터를 적재하도록 만들어보겠습니다.
		
		// SELECT Q1처럼 작성해주시되(입력받기, DB연결, 쿼리문 실행 등..)
		// SELECT구문을 제외한 나머지 INSERT, DELETE, UPDATE 구문은
		// 결과 데이터가 없기 때문에 실행했을때 에러가 나지 않는다면
		// 우선 실행된 것으로 볼 수 있꼬, 실행이 된 다음 워크벤치에서
		// 데이터가 들어갔는지 학인해주시면 됩니다.
		
		// 쿼리문 실행시 SELECT구문은 executeQuery(구문); 을 호출했지만
		// SELECT이외 구문은 executeUpdate(구문); 을 호출합니다.
		
		 try {
			Scanner scan = new Scanner(System.in);
			
			System.out.println("유저 아이디를 입력하세요.");
			String uid = scan.nextLine();
			
			System.out.println("유저 비밀번호를 입력하세요.");
			String upw = scan.nextLine();
			
			System.out.println("유저 이름을 입력하세요.");
			String uname = scan.nextLine();
			
			System.out.println("유저 이메일을 입력하세요.");
			String uemail = scan.nextLine();
			
			Class.forName("com.mysql.cj.jdbc.Driver");
				
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac1",// 접속 URL
															"root",// mysql 아이디
															"mysql"); // mysql 비밀번호
			Statement stmt = con.createStatement();
			stmt.executeUpdate("INSERT INTO userinfo VALUES('" + uname + "', '" + uid + "', '" + upw + "', '" + uemail + "')");
			

		 } catch(Exception e) {
			 e.printStackTrace();
		 }

	}

}
