<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 전체 유저 목록을 가져오는 코드를 작성해보도록 하겠습니다.
	
	// 1. DB접속 변수 생성
	String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	
	ResultSet rs = null;
	Connection con = null;
	PreparedStatement pstmt = null;
	
	// 2. 연결
	try {
	Class.forName(dbType);
	
	con = DriverManager.getConnection(dbUrl,dbId,dbPw);
	
	pstmt = con.prepareStatement("SELECT * FROM userinfo");
	
	
	// 3. SELECT * FROM userinfo 실행 및 ResultSet에 저장
	rs = pstmt.executeQuery();
	
	// 4. ResultSet에 저장된 요소들 전체 리스트를 콘솔에 찍어주기
	/* while(rs.next()) {
		System.out.println(rs.getString(1));
		System.out.println(rs.getString(2));
		System.out.println(rs.getString(3));
		System.out.println(rs.getString(4));
	} */
	
	// .close() 로 자원 회수하는것을 try블럭 내부에 작성해주면
	// 평상시에는 상관없지만 모종의 이유로 에러가 발생했을때 자원회수를 못 할 수도 있습니다.
	// 그래서 finally 내부에 넣어줘야 합니다.
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		// finally는 try와 블럭(지역)이 다르기 때문에
		// try진입 전에 미리 선언해뒤야 아래와 같이 .close()구문을 적어둘 수 있습니다.
		
		// 문제는 현재 이 구문에서는 rs.next()가 rs.close()를 한 이후에 배치되어 있어서
		// 에러가 발생합니다.
		con.close();
		pstmt.close();
		rs.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 테이블 태그를 생성해주세요. 
	테이블은 위에 유저이름, 유저아이디, 유저비번, 유저이메일 순으로 나오고
	두 번째 줄부터는 반복문으로 해당 유저 관련 정보가 나오도록 하겠습니다.-->
	<table border='1'>
		<thead>
			<tr>
				<th>유저이름</th>
				<th>유저아이디</th>
				<th>유저비밀번호</th>
				<th>유저이메일</th>
			</tr>
		</thead>
		<tbody>
		<% while(rs.next()) { %>
		<tr>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
		</tr>
		<%} %>
		</tbody>
	</table>
	
</body>
</html>