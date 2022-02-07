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
	int age = Integer.parseInt(request.getParameter("age"));
	if(age < 20) {
		response.sendRedirect("bus_junior.jsp");
	} else if (age < 60) {
		response.sendRedirect("bus_adult.jsp");
	} else {
		response.sendRedirect("bus_senior.jsp");
	}
	%>
</body>
</html>