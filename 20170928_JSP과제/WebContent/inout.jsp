<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주차차량입고.출고관리</title>

<script type="text/javascript">
function parking_in() {
	location.href="parkin_in.jsp";
}
function parking_out(url) {
	location.href="parkin_out.jsp";
}
</script>
</head>
<body>
<jsp:include page="header.jsp" /><br/>
<jsp:include page="nav.jsp" /><br/>
<h3>주차차량입고.출고관리</h3>
<form method="post" name="formInOut" action="parkin_in.jsp">

차량번호<input type="text" name="carno"/><input type="submit" value="주차입고"/><input type="button" onClick="parking_out()" value="주차출고"/><br/>

<iframe id="iframe" src="" width="90%" height="400" />
<jsp:include page="footer.jsp"/>
</form>

</body>
</html>