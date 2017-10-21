<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.ArrayList, dao.ParkingDao, vo.TicketVO, java.io.PrintWriter"%>
<%
	String url = request.getParameter("url");
	String carno = request.getParameter("carno");
	ParkingDao pDao = new ParkingDao();
	
	String inCheck = pDao.parkIn(carno);
	String outCheck = pDao.parkOut(carno);
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
<script>
var inCheck="<%=inCheck %>";
var outCheck="<%=outCheck %>";
var carno="<%=carno%>";
var url = "<%=url%>";
alert(inCheck);
alert(outCheck);
alert(url);
if(inCheck == "true" && outCheck == "false" && url == "out"){
	document.location.href="parkin_out.jsp?carno="+carno;
}else if(inCheck == "false" && outCheck == "true" && url == "in"){
	document.location.href="parkin_in.jsp?carno="+carno;
}else if(inCheck == "true"){
	alert("이미 입고된 차량 입니다.!");	
}else if(outCheck == "true"){
	alert("이미 출고된 차량 입니다.!");	
}
	
</script>
</body>
</html>