<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// 한글데이터 깨지지않게 인코딩 설정 바꾸기
	request.setCharacterEncoding("utf-8");
	// form에서 보내준 데이터 받아오기
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nick = request.getParameter("nickname");
	
	if(id == null) {
		response.sendRedirect("session.welcome.jsp");
	}
	
	if(id.equals("kkk1234") && pw.equals("1111")) {
		session.setAttribute("session_id", id);
		session.setAttribute("session_pw", pw);
		session.setAttribute("session_nick", nick);
		response.sendRedirect("session_welcome.jsp");
	} else { %>
		<a href="session_login.jsp">로그인 창으로 돌아가기</a>
	<% } %>
</body>
</html>