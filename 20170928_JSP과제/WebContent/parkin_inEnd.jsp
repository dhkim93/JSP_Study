<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page
	import="java.util.ArrayList, dao.TicketDao, dao.ParkingDao, vo.TicketVO"%>
<%
	request.setCharacterEncoding("utf-8");
	String carno = (String)request.getParameter("carno");
	TicketDao tDao = new TicketDao();
	ParkingDao pDao = new ParkingDao();

	ArrayList<TicketVO> list = tDao.searchIn(carno);
	String tstat = "I";
	pDao.parkInsert(carno, list.get(0).getGrade(), tstat);	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>