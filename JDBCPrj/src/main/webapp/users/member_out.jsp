<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// DB연결 후, 세션에서 받아온 아이디를 이용해
	// 회원 탈퇴 후 body태그 내에는 "아이디 회원의 탈퇴가 완료되었습니다."
	// 출력하고 실제로 DB에 DELETE 구문을 날려서 삭제까지 처리해주세요.
	
	// 로그인 안한 사용자 접근시 로그인 창으로 이동
	String uId = (String)session.getAttribute("session_id");
	if(uId == null) {
		response.sendRedirect("login_form.jsp");
	}

	try {
		String dbType = "com.mysql.cj.jdbc.Driver";
		String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
		String dbId = "root";
		String dbPw = "mysql";
		
		Class.forName(dbType);
		
		Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		String sql = "DELETE FROM userinfo WHERE uid=?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, uId);
		
		pstmt.executeUpdate();
		
		con.close();
		pstmt.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	session.invalidate();
	response.sendRedirect("login_form.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=uId %> 회원님의 탈퇴가 완료되었습니다.
</body>
</html>