<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">

.invisible {
        clear: none;
        border: 0px none;
        float: none;
        background-color: #ffffff;
}

</style>
<script type="text/javascript">
	function goToPage() {
		out.println(nav.enroll);
		if (nav.enroll) {
			location.href="enroll.jsp";
		} else if (!join.pw.value) {
			alert("비밀번호를 입력하세요");
			return;
			document.join.pw.focus();
		} else {

			join.submit();
		}
	}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="enroll.jsp">정기권 등록</a>
<a href="ticket_search.jsp">정기권 조회</a>
<a href="inout.jsp">주차차량입.출고</a>
<a href="parking_search.jsp">주차현황조회</a>
<!-- <form value="nav">
<input type="button"  name="enroll" class="invisible" value="정기권등록">
<input type="button" name="ticket_search" class="invisible" value="정기권 조회">
<input type="button" name="inout" class="invisible" value="주차차량입.출고">
<input type="button" name="parking_search" class="invisible" value="주차현황조회">
</form> -->
</body>
</html>