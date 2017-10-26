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
	function changeView(value){
		if (value == "0") {
			location.href="index.jsp?contentPage=enroll.jsp";
		}else if (value == "1"){
			location.href="index.jsp?contentPage=ticket_search.jsp";
		}else if(value == "2"){
			location.href="index.jsp?contentPage=inout.jsp";
		}else if(value == "3"){
			location.href="index.jsp?contentPage=parking_search.jsp";
		}
	}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
        <p>
            <button onclick="changeView(0)">정기권등록</button>
            <button  id="ticketSearch" onclick="changeView(1)">정기권조회</button>
            <button id="joinBtn" onclick="changeView(2)">주차차량입.출고</button>
            <button id="parkSearch" onclick="changeView(3)">주차현황조회</button>
        </p>
    </div>
</body>
</html>