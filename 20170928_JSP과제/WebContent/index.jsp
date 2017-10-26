<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String contentPage = request.getParameter("contentPage");
    if(contentPage==null)
    	contentPage="body.jsp";
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style tyle="text/css">
#header {
	height:30px;
}
#nav {
	height:30px;
}
#body {
	height:400px;
}
#footer {
    position: fixed;
    bottom:0;
    height:50px;   
}
</style>
<body>
<div id="header">
<%@ include file="header.jsp" %>
</div>
<div id="nav">
<%@ include file="nav.jsp" %>
</div>
<div id="body">
<jsp:include page="<%=contentPage %>"/> 
</div>
<div id="footer">
<%@ include file="footer.jsp" %>
</div>

</body>
</html>