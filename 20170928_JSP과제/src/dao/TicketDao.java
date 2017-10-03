package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;

import vo.TicketVO;

public class TicketDao extends HttpServlet{
	public int enroll(String tno, String carno, String phone, String grade, String tstat, String startdate, String enddate) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		int res = 0;
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
			pstmt.setString(5, tstat.toUpperCase());
			pstmt.setString(6, startdate);
			pstmt.setString(7, enddate);
			
			res = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL Error!");
		} finally {
			if (conn != null)
				conn.close();
			conn = null;
		}
		return res;
	}
	
	public ArrayList search(){
		TicketVO tVO = null;
		ArrayList listTicket = new ArrayList();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String searchQuery = "SELECT * FROM ticket_tbl_01;";
		try {
			Context context = new InitialContext();
			DataSource source = (DataSource) context
					.lookup("java:comp/env/jdbc/myconn");
			conn = source.getConnection();
			System.out.println("서버접속성공!");

			pstmt = conn.prepareStatement(searchQuery);
			rs = pstmt.executeQuery();
			String grade="";
			while (rs.next()) {
				if(rs.getString(4).toUpperCase().equals("M")){
					grade = "월회원";
				}else if(rs.getString(4).toUpperCase().equals("Y")){
					grade = "연회원";
				}
				
				tVO = new TicketVO(rs.getString(1), rs.getString(2), rs.getString(3), grade, rs.getString(5), rs.getString(6), rs.getString(7));
				System.out.print("정기권번호 : " + rs.getString(1));
				System.out.print(", 차량번호 : " + rs.getString(2));
				System.out.print(", 차주전화 : " + rs.getString(3));
				System.out.print(", 주차등급 : " + grade);
				System.out.print(", 정기권상태 : " + rs.getString(5));
				System.out.print(", 주차시작일 : " + rs.getString(6));
				System.out.println(", 주차종료일 : " + rs.getString(7));
				
				listTicket.add(tVO);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {// JDBC 종료
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return listTicket;
		
	}
}
