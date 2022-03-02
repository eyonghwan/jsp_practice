<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 서블릿으로 보내기 위해서는 action에 서블릿 접속주소를 넣어야합니다.
	http부터 -->
	<form action="http://localhost:8181/MyFirstWeb/custom" method="get">
		<!-- /custom에서 받을 수 있도록 처리해주세요. -->
		<input type="text" name="jsp" placeholder="jsp"/>
		<input type="text" name="boot" placeholder="boot"/>
		<input type="text" name="jpa" placeholder="jpa"/>
		<input type="submit" value="보내기">
	</form>
</body>
</html>