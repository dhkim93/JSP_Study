<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*, dao.TicketDao, vo.TicketVO"%>
<%@ page import="java.util.ArrayList, java.io.PrintWriter"%>
<%
	PrintWriter outP = response.getWriter();
	String[] name = new String[] { "정기권번호", "차량번호", "차주전화", "주차등급",
			"정기권상태", "주차시작일", "주차종료일" };

	TicketDao tDao = new TicketDao();
	ArrayList<TicketVO> list = tDao.search();
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
				outP.print(list.get(i).getTicketNum());
				outP.print("</td>");

				outP.print("<td>");
				outP.print(list.get(i).getCarNum());
				outP.print("</td>");
				
				outP.print("<td>");
				outP.print(list.get(i).getTel());
				outP.print("</td>");
				
				outP.print("<td>");
				outP.print(list.get(i).getGrade());
				outP.print("</td>");
				
				outP.print("<td>");
				outP.print(list.get(i).getStatus());
				outP.print("</td>");
				
				outP.print("<td>");
				outP.print(list.get(i).getStartDate());
				outP.print("</td>");
				
				outP.print("<td>");
				outP.print(list.get(i).getEndDate());
				outP.print("</td>");
				
				outP.print("</tr>");
				
				if (i == list.size()) {
					outP.print("</table>");
				}
			}
		outP.print("</center>");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>정기권조회</h3>
	
</body>
</html>
