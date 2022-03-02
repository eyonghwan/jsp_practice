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
 		4 X ${dan } = ${4 * dan }<br/>
 	</c:forEach>
	<hr/>
	
	<c:forEach var="dan" begin="2" end="9" step="1">
		<c:forEach var="hang" begin="1" end="9" step="1">
		${dan } X ${hang } = ${dan* hang }<br/>
		</c:forEach>
		<hr/>
	</c:forEach>
	
	<h1>숫자가 아닌 요소를 반복하는 JSTL</h1>
	<%-- arr변수 내에 과일 5개 이름을 배열로 저장하는 구문 --%>
	<c:set var="arr" value='<%=new String[] {"사과", "딸기", "망고", "바나나", "포도"} %>'/>
	<%-- c:foreach는 향산됭 for문처럼 쓸 수도 있습니다. --%>
	<c:forEach var="i" items="${arr }">
		${i} &nbsp;
	</c:forEach>
	<%--
		String[] arr = {"사과", "딸기", "망고", "바나나", "포도"}
		for(String i : arr) {
			out.println(i + "&nbsp;");
		}
	 --%>
	 <%-- int 배열에 10, 20, 30, 40, 50을 넣어주시고 
	 c:foreach문을 이용해 화면에 출력해주세요. --%>
	 <c:set var="nums" value='<%=new int[] {10, 20, 30, 40, 50} %>'/>
	 <c:forEach var="i" items="${nums}">
	 ${i} &nbsp;
	 </c:forEach>
</body>
</html>