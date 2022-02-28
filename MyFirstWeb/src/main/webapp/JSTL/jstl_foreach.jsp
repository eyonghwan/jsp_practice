<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	int total = 0;
	for(int i = 0; i < 101; i++) {
		total += i;
	}
	out.println("<h1>1부터 100까지 총 합은 : " + total + "</h1>");
 --%>
 
 	<!-- begin 시작값, end 끝값(포함), step 증가숫자, var 태그내에서 쓸 변수 명-->
 	<c:forEach begin="1" end="100" step="1" var="number">
 		<c:set var="total" value="${total + number }"/>
 	</c:forEach>
 	<h1>1~100까지 누적합 : ${total }</h1>
 	
 	<!-- foreach문을 이용해서 구구단 4단을 출력해보세요. -->
 	<c:forEach begin="2" end="9" step="1" var="dan">
 		<c:set var="total" value="${4*dan}"/>
 		<c:out value="4 X ${dan } = ${total }"/>
 		<hr/>
 	</c:forEach>
	
</body>
</html>