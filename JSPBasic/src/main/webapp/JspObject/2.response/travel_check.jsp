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
	//radio는 여러 대상 중 하나만 선택할 수 있기 때문에 데이터가 무조건
	// 하나만 넘어옵니다.
	String contry = request.getParameter("contry");
	// 콘솔을 이용해 전달데이터 확인
	System.out.println(contry);
	if(contry.equals("China")) {
		response.sendRedirect("travel_China.jsp");
	} else if(contry.equals("USA")) {
		response.sendRedirect("travel_USA.jsp");
	} else if(contry.equals("Chile")) {
		response.sendRedirect("travel_Chile.jsp");
	} else if(contry.equals("Russia")) {
		response.sendRedirect("travel_Russia.jsp");
	}
%> 
</body>
</html>