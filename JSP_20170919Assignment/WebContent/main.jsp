<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String memberId = (String) session.getAttribute("id");
	boolean login = memberId == null ? false : true;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (login) {
	%>
	아이디 "<%=memberId%>"로 로그인 한 상태
	<%
		} else {
	%>
	로그인 하지 않은 상태
	<%
		}
	%>
</body>
</html>
