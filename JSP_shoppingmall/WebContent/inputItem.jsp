<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>

<h2>*상품 등록*</h2>
<form method="post" enctype="multipart/form-data" action="input_process.jsp">

<table>
<tr>
	<th>품명</th>
	<td><input type="text" name="productName"></td>
</tr>
<tr>
	<th>가격</th>
	<td><input type="text" name="productPrice"></td>
</tr>
<tr>
	<th>보유수량</th>
	<td><input type="text" name="productCount"></td>
</tr>
<tr>
	<th>이미지</th>
	<td><input type="file" value="찾기" name="filename"></td>
</tr>
<tr>
	<td colspan="2" align="center"> <input type="submit" value="등록"></td>
</tr>

</table>

</form>
</center>
</body>
</html>