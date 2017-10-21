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
	int nextNum = pDao.searchParkingNum();
	
	String ticketNum = list.get(0).getTicketNum();	
	String carNum = list.get(0).getCarNum();
	String tel = list.get(0).getTel();	
	String grade = list.get(0).getGrade();	
	String startDate = list.get(0).getStartDate();	
	String endDate = list.get(0).getEndDate();	
	String remark = list.get(0).getGrade();
	
	if(grade.toUpperCase().equals("M")){
		grade = "월회원";
	}else if(grade.toUpperCase().equals("Y")){
		grade = "연회원";
	}else if(grade.toUpperCase().equals("D")){
		grade = "일회원";
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
	function inCheck(){
		var carno="<%=carno%>";
		
		alert(carno);
		
		var message = confirm("[차량입고]하시겠습니까?");
		if(message == true){
			
			document.location.href="parkin_inEnd.jsp?carno="+carno;
			alert("[입고완료]되었습니다.!");
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
				<th>정기권번호</th>
				<td><input type="text" name="ticketNum"
					value="<%=list.get(0).getTicketNum()%>" /></td>
			</tr>
			<tr>
				<th>차량번호</th>
				<td><input type="text" name="carNum"
					value="<%=list.get(0).getCarNum()%>" /></td>
			</tr>
			<tr>
				<th>차주전화</th>
				<td><input type="text" value="<%=list.get(0).getTel()%>"
					name="tel" /></td>
			</tr>
			<tr>
				<th>등급</th>
				<td><input type="text" name="grade"
					value="<%=list.get(0).getGrade()%>" /></td>
			</tr>
			<tr>
				<th>주차시작일</th>
				<td><input type="text" name="startDate"
					value="<%=list.get(0).getStartDate()%>" /></td>
			</tr>
			<tr>
				<th>주차종료일</th>
				<td><input type="text" name="endDate"
					value="<%=list.get(0).getEndDate()%>" /></td>
			</tr>
			<tr>
				<th>비고</th>
				<td><input type="text" name="status"
					value="<%=grade + "입니다."%>" /></td>
			</tr>
			<tr>
				<th>다음주차번호</th>
				<td><input type="text" name="nextParkNum" value="<%=nextNum%>" /></td>
			</tr>
		</table>
		<input type="button" value="입고확인" onClick="inCheck()" />
	</form>
</body>
</html>