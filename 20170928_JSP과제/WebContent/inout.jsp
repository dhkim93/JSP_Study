<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주차차량입고.출고관리</title>

<script type="text/javascript">
function parking_in_out(url) {
	var carno= document.getElementById("carno").value;
	document.getElementById('iframe').src="parkin_process.jsp?url="+url+"&carno="+carno;
	
}

</script>
</head>
<body>

<h3>주차차량입고.출고관리</h3>
<form method="get">

차량번호<input type="text" id="carno"/>&nbsp;&nbsp;
<input type="button" onClick="parking_in_out('in')" value="주차입고"/>&nbsp;&nbsp;<input type="button" onClick="parking_in_out('out')" value="주차출고"/><br/>

<iframe id="iframe" width="90%" height="300"/>
</form>

</body>
</html>