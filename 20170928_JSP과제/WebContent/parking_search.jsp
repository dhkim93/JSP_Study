<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*, dao.ParkingDao, vo.ParkingVO"%>
<%@ page import="java.util.ArrayList, java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>주차현황조회</h3>

</body>
</html>
<%
	PrintWriter outP = response.getWriter();
	String[] name = new String[] { "주차번호", "차량번호", "주차등급", "상태",
			"입고일시", "출고일시"};

	ParkingDao pDao = new ParkingDao();
	ArrayList<ParkingVO> list = pDao.search();
	if (list != null) {
		outP.print("<center>");
		for (int i = 0; i < list.size(); i++) {
			if (i == 0) {
				outP.print("<table border='1'>");
				outP.print("<tr>");
				for(int j =0; j<name.length;j++){
					outP.print("<td>");
					outP.print(name[j]);
					outP.print("</td>");
				}
				out.print("</tr>");
			} 
				outP.print("<tr>");
				
				outP.print("<td>");
				outP.print(list.get(i).getParkno());
				outP.print("</td>");

				outP.print("<td>");
				outP.print(list.get(i).getCarno());
				outP.print("</td>");
				
				outP.print("<td>");
				outP.print(list.get(i).getGrade());
				outP.print("</td>");
				
				outP.print("<td>");
				outP.print(list.get(i).getTstat());
				outP.print("</td>");
				
				outP.print("<td>");
				outP.print(list.get(i).getIndate());
				outP.print("</td>");
				
				outP.print("<td>");
				outP.print(list.get(i).getOutdate());
				outP.print("</td>");
				
				outP.print("</tr>");
				
				if (i == list.size()) {
					outP.print("</table>");
				}
			}
		outP.print("</center>");
	}
%>