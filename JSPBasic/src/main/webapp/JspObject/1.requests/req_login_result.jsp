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
	String id = "rkrk12";
	String password = "sksk12";
	if(id.equals(request.getParameter("id")) && 
			password.equals(request.getParameter("pw"))) { %>
	<p><b><%= id %></b>님 환영합니다.</p>
	<% } else {%>
	<p>로그인에 실패했습니다.</p>
	<a href="req_login_form.jsp">로그인 창으로 돌아가기</a>
	<% } %>

</body>
</html>