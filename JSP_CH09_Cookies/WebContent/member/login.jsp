<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="util.Cookies"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	if (id.equals(password)) {
		//ID와 암호가 같으면 로그인에 성공한것으로 판단.
		response.addCookie(Cookies.createCookie("AUTH", id, "/", -1));
%>
<script>
	alert("로그인성공.");
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 성공</title>
</head>
<body>
	<%
		} else {//로그인 실패시
	%>
	<script>
		alert("로그인에 실패하였습니다.");
		history.go(-1);
	</script>
	<%
		}
	%>
</body>
</html>