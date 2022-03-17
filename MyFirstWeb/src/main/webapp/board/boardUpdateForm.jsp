<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:if test="${board.writer ne sessionScope.session_id}">
		<% response.sendRedirect("http://localhost:8181/MyFirstWeb/boardList.do"); %>
	</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	${board.title }
	<form action="http://localhost:8181/MyFirstWeb/boardUpdate.do" method="post">
		글제목 : <input type="text" name="title" value="${board.title }" >
		글쓴이 : <input type="text" value="${board.writer }" readonly>
		조회수 : ${board.hit }<br/>
		쓴 날짜 : <input type="text" value="${board.bdate }" readonly><br/>
		마지막 수정날짜 : ${board.mdate }<br/>
		본문 : <textarea rows="15" cols="50" name="content">${board.content }</textarea><br/>
		<input type="hidden" name="writer" value="${board.writer }">
		<input type="hidden" name="board_num" value="${board.board_num }">
		<input type="submit" value="수정">
	</form>
</body>
</html>