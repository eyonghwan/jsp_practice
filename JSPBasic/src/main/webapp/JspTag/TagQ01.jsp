<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	// Declaration 내부에
	// 1~10 범위의 난수를 리턴하는 메서드
	// int randomNumber() 를 선언해주세요.
	int randomNumber() {
		// 정수 1~10까지 발생시켜서 리턴하도록 로직 작성
		int rannum = (int)(Math.random() * 10) + 1;
		return 	rannum;	
	}

	String randomcolor() {
		int rannum = (int)(Math.random() * 3);
		String luckcolor = "노랑";
		switch(rannum) {
			case 0: 
				luckcolor="빨강";
				break;
			case 1: 
				luckcolor="노랑";
				break;
			case 2: 
				luckcolor="파랑";
				break;
			}; 
			return luckcolor;
	}
	
	// declaration에 선언한 변수는 서버를 끄기 전까지는 값이 누적됩니다.
	public int total=0;
	
%>
	<h3>오늘의 행운의 숫자와 행운의 색깔</h3>
	<p>행운의 숫자는 1~10범위 입니다.</p>
	<p>행운의 숫자 : <b><%= randomNumber() %></b></p>
	<p>색깔은 1/3확률로 바뀝니다.(빨강, 노랑, 파랑)</p>
	<p>행운의 색깔 : <b><%= randomcolor() %></b></p>
	<h3>오늘의 방문자수</h3>
	<%
		out.println(++total);
		// scriptlet 내부에 선언한 변수는 접속시마다 초기화됩니다.
		int currentNum = 0;
		out.println("<br/>" + ++currentNum);
	%>
</body>
</html>