<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("utf-8");
	// String name = request.getParameter("id");
	// String nickname = request.getParameter("nickname");
%>
<body>
	<%-- 
	이름 : <%=name %><br/>
	별명 : <%=nickname %><br/>
	 --%>
------------------------EL식 출력-------------------<br/>
	이름 : ${param.id }
	별명 : ${param.nickname }
</body>
</html>