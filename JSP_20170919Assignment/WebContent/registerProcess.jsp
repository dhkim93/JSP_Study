<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("pw");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	Boolean matchedId = false;

	PrintWriter outP = response.getWriter();
	Connection conn = null;
	PreparedStatement pstmt = null;
	String querySeach = "select * from member where id= ? ;";
	try {
		Context context = new InitialContext();
		DataSource source = (DataSource) context
				.lookup("java:comp/env/jdbc/myconn");
		conn = source.getConnection();
		System.out.println("서버접속성공!");

		pstmt = conn.prepareStatement(querySeach);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			System.out.println("입력한아이디" + id);

			outP.println("<script type='text/javascript'>");
			outP.println("alert('중복된 아이디 존재!');");
			outP.println("history.back();");
			outP.println("</script>");
			matchedId = true;

		}
		rs.close();
		pstmt.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	if (matchedId) {
		matchedId = false;
	} else if (!matchedId) {

		try {
			String queryInsert = "insert into member(No, ID, PW, Name, Tel) values (null,?, ?, ?, ?)";

			Context context = new InitialContext();
			DataSource source = (DataSource) context
					.lookup("java:comp/env/jdbc/myconn");
			conn = source.getConnection();

			pstmt = conn.prepareStatement(queryInsert);

			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, tel);

			int res = pstmt.executeUpdate();

			outP.println("<script type='text/javascript'>");
			outP.println("alert('가입 완료!');");
			outP.println("</script>");
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("tel", tel);
			pageContext.forward("loginForm.jsp");
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			out.println("SQL Error!");
		} finally {
			if (conn != null)
				conn.close();
			conn = null;
		}
	}
%>