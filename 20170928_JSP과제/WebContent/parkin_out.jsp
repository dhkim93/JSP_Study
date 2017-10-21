<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, dao.TicketDao, dao.ParkingDao, vo.ParkingVO"%>    
<%

	request.setCharacterEncoding("utf-8");
	String carno = (String)request.getParameter("carno");
	
	TicketDao tDao = new TicketDao();
	ParkingDao pDao = new ParkingDao();
	
	ArrayList<ParkingVO> list = pDao.searchOut(carno);
	int nextNum = pDao.searchParkingNum();
	
	String parkNum = list.get(0).getParkno();	
	String carNum = list.get(0).getCarno();
	String grade = list.get(0).getGrade();
	String status = list.get(0).getTstat();
	String startDate = list.get(0).getIndate();	
	String endDate = list.get(0).getOutdate();	
	
	int len = startDate.length();
	System.out.println("len길이@@@@"+len);
	String startDate1 = startDate.substring(0, 19);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	function outCheck(){
		var carno="<%=carno%>";
		alert(carno);
		var message = confirm("[차량출고]하시겠습니까?");
		if(message == true){
			
			document.location.href="parkin_outEnd.jsp?carno="+carno;
			alert("[출고완료]되었습니다.!");
		}else{ 
			alert("취소!");
		}
	}
</script>
</head>
<body>
<form>
		<table>
			<tr>
				<th>주차번호</th>
				<td><input type="text" name="ticketNum"
					value="<%=list.get(0).getParkno()%>" /></td>
			</tr>
			<tr>
				<th>차량번호</th>
				<td><input type="text" name="carNum"
					value="<%=list.get(0).getCarno()%>" /></td>
			</tr>
			<tr>
				<th>등급</th>
				<td><input type="text" value="<%=list.get(0).getGrade()%>"
					name="tel" /></td>
			</tr>
			<tr>
				<th>상태</th>
				<td><input type="text" name="grade"
					value="<%=list.get(0).getTstat()%>" /></td>
			</tr>
			<tr>
				<th>입고일시</th>
				<td><input type="text" name="startDate"
					value="<%=startDate1 %>" /></td>
			</tr>
			<tr>
				<th>출고일시</th>
				<td><input type="text" name="endDate"
					value="" /></td>
			</tr>
			<tr>
				<th>비고</th>
				<td><input type="text" name="status"
					value="출차 준비 중입니다."/></td>
			</tr>
			
		</table>
		<input type="button" value="출고확인" onClick="outCheck()" />
	</form>
</body>
</html>