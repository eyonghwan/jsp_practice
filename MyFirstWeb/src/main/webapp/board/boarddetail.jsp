<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${board.title }<br/>
	글제목 : <input type="text" value="${board.title }" readonly>
	글쓴이 : <input type="text" value="${board.writer }" readonly>
	조회수 : ${board.hit }<br/>
	쓴 날짜 : <input type="text" value="${board.bdate }" readonly><br/>
	마지막 수정날짜 : ${board.mdate }<br/>
	본문 : <textarea rows="15" cols="50" readonly>${board.content }</textarea><br/>
	<a href="http://localhost:8181/MyFirstWeb/boardList.do">목록으로</a>
	<c:if test="${sessionScope.session_id eq board.writer}">
		<form action="http://localhost:8181/MyFirstWeb/boardDelete.do" method="post">
			<!-- 내부를 조금 고쳐서 글 번호를 넘기도록 만들어주세요.
			해당 서블릿에서 글 번호를 콘솔에 찍게도 만들어주세요.-->			
			<input type="hidden" name="writer" value="${board.writer}">
			<input type="hidden" name="board_num" value="${board.board_num }">
			<input type="submit" value="삭제하기">
		</form>
		<form action="http://localhost:8181/MyFirstWeb/boardUpdateForm.do" method="post">
			<input type="hidden" name="writer" value="${board.writer}">
			<input type="hidden" name="board_num" value="${board.board_num }">
			<input type="submit" value="수정하기">
		</form>
	</c:if>
</body>
</html>