package kr.co.ict;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class JDBCSelectQ1 {

	public static void main(String[] args) {
		// Scanner를 이용해 uid를 입력받은 다음
		// SELECT 구문을 응용해서
		// WHERE uid = 입력받은 아이디
		// 형식으로 내가 조회한 아이디의 정보만
		// 콘솔에 찍히도록 로직을 작성해주세요.
		
		Scanner scan = new Scanner(System.in);
		System.out.println("조회할 유저의 아이디를 입력해주세요.");
		String uid = scan.nextLine();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jdbcprac1",// 접속 URL
														"root",// mysql 아이디
														"mysql"); // mysql 비밀번호

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM userinfo WHERE uid = '" + uid + "'");
			
			while(rs.next()) {
				System.out.println(rs.getString(1));
				System.out.println(rs.getString(2));
				System.out.println(rs.getString(3));
				System.out.println(rs.getString(4));
				System.out.println("-------------------");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		scan.close();
		

	}

}
