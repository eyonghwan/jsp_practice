<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	double height = Double.parseDouble(request.getParameter("height")) / 100;	    
	double weight = Double.parseDouble(request.getParameter("weight"));
	double bmi = weight / (height * height);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
	bmi지수 계산 공식 = [체중(Kg) / 신장(m) * 신장(m)]
	즉, 175cm이라면 실제 신장에 들어가야 하는 값은 1.75m
	* bmi지수가 23을 초과한다면 "체중조절을 고려해보세요." 출력
	18.5 미만이라면 "당신은 저체중입니다." 출력
	나머지인 경우 "당신은 정상체중입니다."를 출력하되,
	스크립트릿에 if문을 넣어서 선택적으로 결과가 나오게 해 보세요.
	
	* 폼에서 전달되는 데이터는 무조건 문자열로 전달됩니다.
	따라서 정수나 실수로 변환해야하는데
	String -> int,double
	Integer.parseInt("문자열") ==> 문자열을 정수로
	Double.parseDouble("문자열") ==> 문자열을 실수로
--%>
<h1>BMI 결과</h1>
<p>당신의 BMI 지수는 <%= bmi %> 입니다.</p>
<%
	if(bmi > 23) {
		out.println("체중조절을 고려해보세요.");
	} else if(bmi < 18.5) {
		out.println("당신은 저체중입니다.");
	} else {
		out.println("당신은 정상체중입니다.");
	}
%>

</body>
</html>