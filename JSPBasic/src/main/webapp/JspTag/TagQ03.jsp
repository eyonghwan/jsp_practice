<%@ page import = "java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로또 번호 생성 결과</h1>
	<p>이번주 로또는 이 번호</p>
	<% 
	List<Integer> lotto = new ArrayList<>();
	
	while(true) {
		int random = (int)(Math.random() * 45) + 1;
		if(!lotto.contains(random)); {
			lotto.add(random);
			}
		if(lotto.size() == 6) {
			break; 
			} 
		} 
	Collections.sort(lotto);
	%>
	<% 
		for(Integer num : lotto) {
			out.println(num + "&nbsp");
			}
	%>
</body>
</html>