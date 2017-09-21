<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	if (id == null)
		id = "";
%>
<%
	//세션상에 아이디가 있으면 자동으로 아이디칸에 표시
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h2>login page</h2>

		<form name="login_form"
			action="<%=request.getContextPath()%>/login.jsp" method="post">
			<table border="1" width="300" height="400">
				<tr>
					<td width="100">아이디</td>
					<td><input type="text" name="id" value='<%=id%>' /></td>
				</tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" /></td>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="로그인"></td>
				</tr>


			</table>
		</form>
	</center>
</body>
</html>