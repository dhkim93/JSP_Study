<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page
	import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>

<%
	request.setCharacterEncoding("utf-8");
	String name = "";
	String price = "";
	String pCount = "";
	String imagePath = "";
	String filename = "";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String queryInsert = "insert into product(No, pName, price, pCount, imgPath) values (null,?, ?, ?, ?)";

	boolean check = ServletFileUpload.isMultipartContent(request);
	System.out.println("Check 값: " + check);
	try {

		Context context = new InitialContext();
		DataSource source = (DataSource) context
				.lookup("java:comp/env/jdbc/myconn");
		conn = source.getConnection();
		System.out.println("서버접속성공!");
	} catch (Exception e) {
		e.printStackTrace();
	}

	if (check) {
		try {
			/*
			D:\kwork\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSP_shoppingmall
			\\upload 경로로 이미지 업로드*/
			ServletContext context = this.getServletContext();
			String path = context.getRealPath("/upload");
			File dir = new File(path);//해당 경로에 대한 파일의 File 객체 생성!
			
			if (!dir.exists())
				dir.mkdir();
			
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(10 * 1024);
			factory.setRepository(dir);

			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(10 * 1024 * 1024);
			upload.setHeaderEncoding("utf-8");

			ArrayList items = (ArrayList) upload.parseRequest(request);

			for (int i = 0; i < items.size(); i++) {
				FileItem item = (FileItem) items.get(i);
				String value = item.getString("utf-8");

				if (item.isFormField()) {// form데이터라면 실행
					if (item.getFieldName().equals("productName"))
						name = value;
					else if (item.getFieldName().equals("productPrice"))
						price = value;
					else if (item.getFieldName().equals("productCount"))
						pCount = value;
				} else {
					if (item.getFieldName().equals("filename")) {
						filename = item.getName();
						imagePath = filename;
						System.out.println("filename@@@@@ " + filename);
						System.out.println("imagePath@@@@@ " + imagePath);

						if (filename == null
								|| filename.trim().length() == 0)// 파일
																	// name이
																	// 공백이거나
																	// 길이가
																	// 0일경우(첨부파일
																	// 지정하지
																	// 않았을경우)
							continue;

						filename = filename.substring(filename.lastIndexOf("\\") + 1);//지정한 파일의 경로 중에서 파일명만 골라서 저장
						System.out.println("filename " + filename);
						System.out.println("@@@@@@@@@@@@@@@@@dir " + dir);
						File file = new File(dir, filename);//파일이 업로드될경로(dir)과 filename을 지정!
						item.write(file);

					}
				}
			}
			
			System.out.println("productName " + name);
			System.out.println("price " + price);
			System.out.println("productCount  " + pCount);
			
			pstmt = conn.prepareStatement(queryInsert);
			pstmt.setString(1, name);
			pstmt.setString(2, price);
			pstmt.setString(3, pCount);
			pstmt.setString(4, imagePath);

			int res = pstmt.executeUpdate();

			pageContext.forward("main.jsp");
			pstmt.close();
			conn.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null)
				conn.close();
			conn = null;
		}
	}
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