<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>초기화 파라미터 읽어오기</title>
</head>
<body>

	초기화 파리미터 목록:
	<ul>
		<%
			Enumeration<String> initParamEnum = application
					.getInitParameterNames();
			while (initParamEnum.hasMoreElements()) {

				String initParamName = initParamEnum.nextElement();
		%>
		<li><%=initParamName%> = <%=application.getInitParameter(initParamName)%>
			<%
				}
			%>
	</ul>
</body>
</html>