<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가고싶은 여행지들</title>
</head>
<body>
	<%--
		form태그를 만들어주시고 목적지는 travel_check.jsp, post방식입니다.
		라디오버튼을 최소 4개를 만들어주세요.
		각 라디오 버튼에는 속성으로 value= 이라고해서 뭘 선택했는지 식별할 수 있도록
		각 버튼별로 다른 value 값을 지정해주세요.
		
		submit버튼도 하나 만들어주세요.
	--%>
	<form action="travel_check.jsp" method="post">
	중국<input type="radio" name="contry" value="China"><br/>
	미국<input type="radio" name="contry" value="USA"><br/>
	칠레<input type="radio" name="contry" value="Chile"><br/>
	러시아<input type="radio" name="contry" value="Russia"><br/>
	<input type="submit" value="여행가기">
	</form>
</body>
</html>