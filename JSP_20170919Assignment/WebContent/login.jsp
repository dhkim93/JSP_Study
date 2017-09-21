<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = "";
	String tel = "";
	Boolean matchedId = false;
	Connection conn = null;
	PreparedStatement pstmt = null;
	String queryS = "select * from member where id = ? and pw = ?;";
	try {
		Context context = new InitialContext();
		DataSource source = (DataSource) context
				.lookup("java:comp/env/jdbc/myconn");
		conn = source.getConnection();
		System.out.println("서버접속성공!");
	} catch (Exception e) {
		e.printStackTrace();

	}
	try {
		System.out.println("처리전!");
		pstmt = conn.prepareStatement(queryS);
		pstmt.setString(1, id);
		pstmt.setString(2, password);

		ResultSet rs = pstmt.executeQuery();
		System.out.println("while전!");
		while (rs.next()) {
			System.out.println("id찾기전!");
			name = rs.getString("name");
			tel = rs.getString("tel");

			System.out.println("id찾음!");
			System.out.println("같은아이디존재!");
			matchedId = true;
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setAttribute("tel", tel);
			pageContext.forward("main.jsp");

		}
		if (matchedId) {
			matchedId = false;
		} else {
			response.sendRedirect("join.jsp");
		}
		rs.close();
		pstmt.close();

	} catch (Exception e) {
		e.printStackTrace();
		return;
	} finally {
		if (conn != null)
			conn.close();
		conn = null;
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 성공</title>
</head>
<body>

</body>
</html>
