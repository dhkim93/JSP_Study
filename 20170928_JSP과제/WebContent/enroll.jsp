<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주차 정기권 등록</title>

<script type="text/javascript">
	function checkBlank() {
		if (!join.carNum.value) {
			alert("차량번호를 입력하세요");
			document.join.carNum.focus();
			return;
		} else if (!join.tel.value) {
			alert("전화번호를 입력하세요");
			document.join.tel.focus();
			return;
		} else if (!join.grade.value) {
			alert("주차등급을 입력하세요");
			document.join.grade.focus();
			return;
		} else if (!join.status.value) {
			alert("정기권상태를 입력하세요");
			document.join.status.focus();
			return;
		} else {
			join.submit();
			alert("정기주차권신청이 완료 되었습니다!");
		}
	}
	function goSearch(){
		location.href="ticket_search.jsp";
	}
</script>
</head>
<body>
<center>
	<h3>주차 정기권 등록</h3>
	<table>
	<form method="post" name="join" action="registerProcess.jsp">
	<tr>
		<th>정기권번호(자동발생)</th>
		<td><input type="text" name="ticketNum"/></td>
	</tr>
	<tr>
		<th>차량번호</th>
		<td><input type="text" name="carNum"/></td>
	</tr>
	<tr>
		<th>차주전화</th>
		<td><input type="text" name="tel"/></td>
	</tr>
	<tr>
		<th>주차등급(M/Y)</th>
		<td><input type="text" name="grade"/></td>
	</tr>
	<tr>
		<th>정기권상태(Y/N)</th>
		<td><input type="text" name="status"/></td>
	</tr>
	<tr>
		<th>시작일</th>
		<td><input type="text" name="startDate"/></td>
	</tr>
	<tr>
		<th>종료일</th>
		<td><input type="text" name="endDate"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="button" value="등록" onClick="checkBlank()"/><input type="button" onClick="goSearch()" value="조회"/></td>
	</tr>
	</form>
	</table>
</center>
</body>
</html>