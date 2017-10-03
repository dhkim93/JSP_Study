<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*, dao.TicketDao"%>
<%
	request.setCharacterEncoding("utf-8");
	String tno = request.getParameter("ticketNum");
	String carno = request.getParameter("carNum");
	String phone = request.getParameter("tel");
	String grade = request.getParameter("grade");
	String tstat = request.getParameter("status");
	String start = request.getParameter("startDate");
	String end = request.getParameter("endDate");
	String startdate = start.substring(0,4)+"-"+start.substring(4,6)+"-"+start.substring(6,8);
	String enddate = end.substring(0,4)+"-"+end.substring(4,6)+"-"+end.substring(6,8);
	
	out.println(tno);
	out.println(carno);
	out.println(phone);
	out.println(grade);
	out.println(tstat);
	out.println(startdate);
	out.println(enddate);
	
	TicketDao tDao = new TicketDao();
	int res=tDao.enroll(tno, carno, phone, grade, tstat, startdate, enddate);
	if(res>0){
		pageContext.forward("ticket_search.jsp");
	}
	/* Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		String queryInsert = "insert into ticket_tbl_01(tno, carno, phone, grade, tstat, startdate, enddate) values (?, ?, ?, ?, ?, ?, ?)";

		Context context = new InitialContext();
		DataSource source = (DataSource) context
				.lookup("java:comp/env/jdbc/myconn");
		conn = source.getConnection();
		System.out.println("서버접속성공!");

		pstmt = conn.prepareStatement(queryInsert);

		pstmt.setString(1, tno);
		pstmt.setString(2, carno);
		pstmt.setString(3, phone);
		pstmt.setString(4, grade);
		pstmt.setString(5, tstat);
		pstmt.setString(6, startdate);
		pstmt.setString(7, enddate);

		int res = pstmt.executeUpdate();
		 
		pageContext.forward("ticket_search.jsp");
		pstmt.close();
	} catch (SQLException e) {
		e.printStackTrace();
		out.println("SQL Error!");
	} finally {
		if (conn != null)
			conn.close();
		conn = null;
	} */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>