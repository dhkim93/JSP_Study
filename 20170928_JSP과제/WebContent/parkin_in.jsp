<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>주차차량입고.출고관리</h3>
<form>

차량번호<input type="text" name="carno"/><input type="button" value="주차입고"/><input type="button" onClick="parking_out()" value="주차출고"/>
<br/><br/><br/><br/>

<table>
<tr>
		<th>정기권번호</th>
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
		<th>등급</th>
		<td><input type="text" name="grade"/></td>
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
		<th>비고</th>
		<td><input type="text" name="status"/></td>
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