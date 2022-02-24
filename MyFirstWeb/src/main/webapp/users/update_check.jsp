<%@page import="kr.co.ict.UserDAO"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. form에서 보낸 비번, 이름, 이메일을 변수로 저장해주세요.
	request.setCharacterEncoding("utf-8");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	// 2. session에 저장된 아이디를 변수로 저장해주세요.
	String id = (String)session.getAttribute("session_id");
	if(id == null) {
		response.sendRedirect("login_form.jsp");
	}
	
	/*
	// 3. DB접속정보 변수로 관리
	String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	// 4. 연결
	try {
		Class.forName(dbType);
		Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
	
	// 5. pstmt생성 및 ?에 값 세팅
	String sql = "UPDATE userinfo SET uname=?, upw=?, uemail=? WHERE uid=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, name);
	pstmt.setString(2, pw);
	pstmt.setString(3, email);
	pstmt.setString(4, id);
	
	// 6. pstmt 실행 및 자원 회수
	pstmt.executeUpdate();
	
	con.close();
	pstmt.close();
	} catch(Exception e) {
		e.printStackTrace();
	}
	*/
	UserDAO userdao = new UserDAO();
	userdao.userUpdate(id, pw, name, email);
	// 7. body태그에 XXX 회원님의 정보가 수정되었습니다. 라고 안내해주기
	// 웰컴페이지로 돌아갈 수 있는 링크 넣어주기.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=name %> 회원님의 정보가 수정되었습니다.</h1>
	<a href="login_welcome.jsp">돌아가기</a>
</body>
</html>