<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>옵션 선택 화면</title>
</head>
<body>

<form action="<%= request.getContextPath() %>/view.jsp">

보고싶은 페이지 선택 :
	<select name="code">
		<option value="A">A 페이지</option>
		<option value="B">B 페이지</option>
		<option value="C">C 페이지</option>
	</select>
	
<input type="submit" value="이동">
</form>
</body>
</html>