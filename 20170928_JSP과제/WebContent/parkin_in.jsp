<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.util.ArrayList, dao.ParkingDao, vo.TicketVO, java.io.PrintWriter" %>
<%
	PrintWriter outP = response.getWriter();

	request.setCharacterEncoding("utf-8");
	String carno = (String)request.getParameter("carno");
	outP.print(carno);
	System.out.println(carno);
	
	 ParkingDao pDao = new ParkingDao();
	ArrayList<TicketVO> list = pDao.searchIn(carno);
	String ticketNum = list.get(0).getTicketNum();	
	String carNum = list.get(0).getCarNum();
	String tel = list.get(0).getTel();	
	String grade = list.get(0).getStatus();	
	String startDate = list.get(0).getStartDate();	
	String endDate = list.get(0).getEndDate();	
	String remark = list.get(0).getGrade()+"입니다.";
	pageContext.forward("parkin_process.jsp");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>


<form>
<table>
<tr>
		<th>정기권번호</th>
		<td><input type="text" name="ticketNum" value="<%=list.get(0).getTicketNum() %>"/></td>
	</tr>
	<tr>
		<th>차량번호</th>
		<td><input type="text" name="carNum" value="<%=list.get(0).getCarNum() %>"/></td>
	</tr>
	<tr>
		<th>차주전화</th>
		<td><input type="text" value="<%=list.get(0).getTel() %>" name="tel"/></td>
	</tr>
	<tr>
		<th>등급</th>
		<td><input type="text" name="grade" value="<%=list.get(0).getStatus() %>"/></td>
	</tr>
	<tr>
		<th>시작일</th>
		<td><input type="text" name="startDate" value="<%=list.get(0).getStartDate() %>" /></td>
	</tr>
	<tr>
		<th>종료일</th>
		<td><input type="text" name="endDate" value="<%=list.get(0).getEndDate() %>" /></td>
	</tr>
	<tr>
		<th>비고</th>
		<td><input type="text" name="status" value="<%=list.get(0).getGrade()+"입니다." %>"/></td>
	</tr>
	<tr>
		<th>다음주차번호</th>
		<td><input type="text" name="nextParkNum"/></td>
	</tr>
</table>
<input type="button" value="입고확인"/>
</form>
</body>
</html>