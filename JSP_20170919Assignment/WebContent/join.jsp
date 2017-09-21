<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입창</title>
<script type="text/javascript">
	function checkBlank() {
		if (!join.id.value) {
			alert("아이디를 입력하세요");
			document.join.id.focus();
			return;
		} else if (!join.pw.value) {
			alert("비밀번호를 입력하세요");
			return;
			document.join.pw.focus();
		} else {

			join.submit();
		}
	}
</script>

</head>
<body>
	<center>

		<form method="post" name="join" action="registerProcess.jsp">
			<table border="1">
				<tr>
					<th>ID</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="tel"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button"
						value="가입완료" onClick="checkBlank()"> <input type="reset"
						value="취소" "/></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>
