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
	if(request.isRequestedSessionIdValid()) {
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
		if(id.equals("kkk1234") && pw.equals("1111")) {
			response.sendRedirect("session_welcome.jsp");
		}
	}
	%>
	<form action="session_login_check.jsp" method="post">
	아이디 : <input type="text" name="id" placeholder="아이디" required /><br/>
	비밀번호 : <input type="password" name="pw" placeholder="비밀번호" required /><br/>
	NickName : <input type="text" name="nickname" placeholder="닉네임" required /><br/>
	<input type="submit" value="로그인">&nbsp;&nbsp;&nbsp;
	<input type="reset" value="초기화">
	</form>
</body>
</html>