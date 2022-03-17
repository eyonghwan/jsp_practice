<%@page import="kr.co.ict.UserVO"%>
<%@page import="kr.co.ict.UserDAO"%>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 폼에서 보낸 아이디 비밀번호를 받아서 변수에 저장해주세요 콘솔에 확인도 해주세요.
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	System.out.println(id);
	System.out.println(pw);
	/* 
	// DB 연결을 위한 변수선언
	String dbType = "com.mysql.cj.jdbc.Driver";
	String dbUrl = "jdbc:mysql://localhost:3306/jdbcprac1";
	String dbId = "root";
	String dbPw = "mysql";
	
	try {
		// 1. DB종류 선택 및 연결
		Class.forName(dbType);
		
		Connection con = DriverManager.getConnection(dbUrl, dbId, dbPw);
		
		// 2. 쿼리문 (사용자가 입력해준 id 조회하기) 선언 및 PreparedStatement 객체 생성
		
		String sql = "SELECT * FROM userinfo";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		// 3. 쿼리문 실행 결과 ResultSet에 받기
		
		ResultSet rs = pstmt.executeQuery();
		// 4. 사용자 입력 id를 기준으로 들어온 데이터가 있다면, (id.equals(DB내에 저장된 ID)로 검사가능)
		//    DB에 적재되어있던 비밀번호를 마저 사용자 입력 비밀번호와 비교해 다 일치하면 세션 발급
		//    그렇지 않다면 로그인에 실패했습니다. 메세지가 뜨도록 처리
		while(rs.next()) {
			if(id.equals(rs.getString("uid"))) {
				if(pw.equals(rs.getString("upw"))) {
					String name = rs.getString("uname");
					session.setAttribute("session_id", id);
					session.setAttribute("session_pw", pw);
					session.setAttribute("session_name", name);
					response.sendRedirect("login_welcome.jsp");
				}
			}
		}
		// 5. 만약 웬컴페이지도 만들 여력이 되신다면
		//    로그인 이후 리다이렉트로 넘겨서
		//    이름(아이디) 님 로그인을 환영합니다. 라는 문장이 뜨는 login_welcome.jsp까지 구현해주세요.
		
		con.close();
		pstmt.close();
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	*/
	UserDAO userdao = UserDAO.getInstance();
	UserVO uservo = userdao.getUserData(id);
	
	if(id.equals(uservo.getuId())) {
		if(pw.equals(uservo.getuPw())) {
			String name = uservo.getuName();
			session.setAttribute("session_id", id);
			session.setAttribute("session_pw", pw);
			session.setAttribute("session_name", name);
			response.sendRedirect("/MyFirstWeb/");
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
	<script>
		alert('로그인에 실패했습니다.');
		location.href='login_form.jsp';
	</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
</body>
</html>