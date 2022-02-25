<%@page import="kr.co.ict.UserVO"%>
<%@page import="kr.co.ict.UserDAO"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 세션에서 아이디를 얻어옵니다. 세션 결과값이 null이면 login_form.jsp로 이동
	String id = (String)session.getAttribute("session_id");
	if(id==null) {
		response.sendRedirect("login_form.jsp");
	}
	/*
	// 2. DB연결
	String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	try {
		Class.forName(dbType);
		
		Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		// 3. 로그인된 아이디의 전체 정보(SELECT * FROM...)를 얻어옵니다.
		
		String sql = "SELECT * FROM userinfo WHERE uid=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		// 4. name, email을 변수에 저장합니다.
		name = rs.getString("uname");
		email = rs.getString("uemail");
		
		con.close();
		pstmt.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		
	}
	*/
	// 5. 하단 form의 value에 해당 변수에 든 값이 들어가도록 설정합니다.
	
	UserDAO userDao = UserDAO.getInstance();
	UserVO userData = userDao.getUserData(id);
%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- update의 경우는 update_check.jsp 로 자료를 보내야 하는데
	보통 정보 수정을 하는 경우는, 미리 회원정보가 form에 기입되어 있는 경우가 많습니다.
	먼저 폼 양식은, 아이디 없이 비밀번호는 비어있고, name, email은 DB에 있던 정보가
	채워진 상태로 창이 열리게 만들겠습니다. 폼만 완성시켜보내주세요. 
	input 태그에서 value 속성을 이용하면 미리 채워질 값을 지정할 수 있습니다.-->
	<h1> <%=id %>님의 정보 수정 페이지</h1>
	<form action="update_check.jsp" method="post">
	비밀번호 : <input type="password" name="pw" required><br/>
	이름 : <input type="text" name="name" value=<%=userData.getuName() %> required><br/>
	이메일 : <input type="email" name="email" value=<%=userData.getuEmail() %>><br/>
	<input type="submit" value="수정하기">
	<input type="reset" value="초기화">
	</form>
</body>
</html>