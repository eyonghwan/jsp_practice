<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.isRequestedSessionIdValid()) {
		response.sendRedirect("login_welcome.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 아이디와 비밀번호를 적어넣을 수 있는 폼을 만들어주세요.
	목적지는 login_check.jsp 입니다. -->
	<h1>로그인 창입니다.</h1>
	<form action="login_check.jsp" method="post">
	<input type="text" name="id" placeholder="아이디" required/><br/>
	<input type="password" name="pw" placeholder="비밀번호" required/><br/>
	<input type="submit" value="로그인"/>
	<input type="reset" value="초기화"/>
	</form>
	<a href="join_form.jsp">회원가입하기</a>

</body>
</html>