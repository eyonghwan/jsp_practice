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
	// 로그인한 사용자가 해당페이지에 접근했는지 안 했는지 세션조회로 체크
	if(request.isRequestedSessionIdValid()) {
	String id = (String)session.getAttribute("session_id");
	String nick = (String)session.getAttribute("session_nick");
	out.println(nick + "(" + id + ")님 로그인을 환영합니다.<br/>");
	} else {
		response.sendRedirect("session_login.jsp");
	}
%>
	<a href="session_logout.jsp">로그아웃하기</a>
</body>
</html>