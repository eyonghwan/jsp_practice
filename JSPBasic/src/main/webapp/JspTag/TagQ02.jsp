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
	int view = 0;
	void randomgugudan() {
	for (int i = 1; i < 9; i++){
	// out.println(dan + " X " + i + " = " + dan * i);		
	};
	}
%>
	<p>페이지 누적 요청 수 : <% out.println(++veiw); %> <br/>
	<% if(view % 10 == 0) {
		out.println("매 10번째 방문자에게는 기프티콘을 드립니다. <br/> 당첨되셨습니다!!");
		}
	%>
	</p>
	<hr/>
	<h1>랜덤 구구단 (<% out.print((int)(Math.random() * 8) + 1); %>단)</h1>

</body>
</html>