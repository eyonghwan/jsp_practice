<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	// 스크립트릿을 활용한 로그인 확인
	String sId = (String)session.getAttribute("session_id");
%>
<c:set var="sId" value="<%= sId %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>안녕하세요 메인페이지입니다.</h1>
	<h2>web.xml 내부 welcomepage 설정에 index.jsp라고 적혀있어서</h2>
	<h2>이 페이지가 메인페이지로 자동 설정됩니다.</h2>
	<h2>여러분이 welcomepage 설정을 고쳐서 index.jsp가 아닌</h2>
	<h2>다른 임의의 명칭을 메인페이지로 만들어줄 수도 있습니다.</h2>
	
	<a href="http://localhost:8181/MyFirstWeb/boardList.do">게시판 입장하기</a><br/>
	<c:if test="${sessionScope.session_id eq null}">
		<a href="http://localhost:8181/MyFirstWeb/users/login_form.jsp">로그인 창으로</a><br/>
		<a href="http://localhost:8181/MyFirstWeb/users/join_form.jsp">회원가입하기</a><br/>	
	</c:if>
	<c:if test="${sessionScope.session_id ne null}">
		<a href="http://localhost:8181/MyFirstWeb/users/logout.jsp">로그아웃하기</a><br/>
	</c:if>
</body>
</html>