<%@ page import="kr.co.ict.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 아까 발생했던 rs.close() 실행 문제로 인해
	// DB에 있는 자료를 꺼냈을 때, 곧바로 java데이터로 받아오는 작업을 수행한 다음
	// rs.close()를 하면 문제가 없습니다.
	// 따라서 SELECT 구문의 결과(SQL데이터)를 담을 클래스가 필요하고
	// 이를 VO(Value Object)라고 부릅니다.
	// VO는 클래스이기 때문에 src/main/java에 클래스를 선언 및 정의합니다.
	// UserVO.class 를 만들어보겠습니다.
	
	/*
	// 1. DB접속 변수 생성
	String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// ArrayList<userVO> 자료형을 이용해 한 줄 한 줄 단위로 여러 row를 저장합니다.
	List<UserVO> userList = new ArrayList<>();
	
	// 2. 연결
	
	try { 
		Class.forName(dbType);
		
		con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		// 3. SELECT * FROM userinfo 실행 및 ResultSet 저장
		String sql = "SELECT * FROM userinfo";
		
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		// 테이블에 저장된 데이터를 자바로 옮기기 위해서 UserVO를 선언합니다.
		
		while(rs.next()) {
			// 1. ResultSet에서 데이터 가져오기
			String uName = rs.getString("uname");
			String uId = rs.getString("uid");
			String uPw = rs.getString("upw");
			String uEmail = rs.getString("uemail");
			
			UserVO userData = new UserVO(uName, uId, uPw, uEmail);
			userList.add(userData);
		}
		// System.out.println(userList);
		// out.println(userList+"<br/>");
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		// 이 영역에서 바로 .close()를 쓰고도 데이터를 body태그에서 쓰려면
		// .close()이전에 DB에 있던 데이터를 모조리 자바로 옮겨야 합니다.
		con.close();
		pstmt.close();
		rs.close();
	}
	*/
	UserDAO userDao = UserDAO.getInstance();
	List<UserVO> userList = userDao.getAllUserList();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 향상된 for문을 이용해서 userList 내부의 데이터를 
	Table형태도 user_list1과 동일한 양식으로 화면에 출력해주세요. -->
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
		<% for(UserVO userData : userList) { %>
		<tr>
			<td><%= userData.getuName() %></td>
			<td><%= userData.getuId() %></td>
			<td><%= userData.getuPw() %></td>
			<td><%= userData.getuEmail() %></td>
		</tr>
		<%} %>
		</tbody>
	</table>
</body>
</html>