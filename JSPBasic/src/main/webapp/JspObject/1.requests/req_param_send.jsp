<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 아래에 form을 만들고 내부에 input 4개를 만들어주세요.
input태그의 type속성은 하나는 text, 하나는 password,
name속성은 하나는 apple, 하나는 banana로 해주세요.
reset버튼과 submit버튼도 각각 하나씩 만들어주세요. --%>
<form action="req_param_getpost.jsp" method="get">
	<input type="text" name="apple" placeholder="apple"/><br/>
	<input type="password" name="banana" placeholder="banana"/><br/>
	
	취미 : 
	<input type="checkbox" name="hobby" value="요리">요리&nbsp;
	<input type="checkbox" name="hobby" value="낚시">낚시&nbsp;
	<input type="checkbox" name="hobby" value="독서">독서&nbsp;
	<input type="checkbox" name="hobby" value="헬스">헬스&nbsp;
	<input type="checkbox" name="hobby" value="탁구">탁구&nbsp;
	<br/>
	전공 : (name, value는 각각 정해주세요. radio 4개를 작성해주시면 됩니다.)
	<br/>
	<input type="radio" name="major" value="경영">경영학과&nbsp;
	<input type="radio" name="major" value="경제">경제학과&nbsp;
	<input type="radio" name="major" value="물리">물리학과&nbsp;
	<input type="radio" name="major" value="지리">지리학과&nbsp;
	
	<input type="reset"/>
	<input type="submit"/>
</form>
</body>
</html>