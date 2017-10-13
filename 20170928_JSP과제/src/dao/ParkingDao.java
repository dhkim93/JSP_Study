package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import vo.ParkingVO;
import vo.TicketVO;

public class ParkingDao {
	public int enroll(String parkno, String carno, String grade, String tstat, String indate, String outdate) throws NamingException, SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		int res = 0;
		try {
			String queryInsert = "insert into park_info_tbl(parkno, carno, grade, tstat, indate, outdate) values (?, ?, ?, ?, ?, ?)";

			Context context = new InitialContext();
			DataSource source = (DataSource) context
					.lookup("java:comp/env/jdbc/myconn");
			conn = source.getConnection();
			System.out.println("서버접속성공!");

			pstmt = conn.prepareStatement(queryInsert);
			pstmt.setString(1, parkno);
			pstmt.setString(2, carno);
			pstmt.setString(3, grade.toUpperCase());
			pstmt.setString(4, tstat.toUpperCase());
			pstmt.setString(5, indate);
			pstmt.setString(6, outdate);
			
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
	
	public ArrayList searchIn(String carno){
		TicketVO tVO = null;
		ArrayList listParking = new ArrayList();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String searchQuery = "SELECT * FROM ticket_tbl_01 where carno= ?;";
		try {
			Context context = new InitialContext();
			DataSource source = (DataSource) context
					.lookup("java:comp/env/jdbc/myconn");
			conn = source.getConnection();
			System.out.println("서버접속성공!");

			pstmt = conn.prepareStatement(searchQuery);
			pstmt.setString(1, carno);
			rs = pstmt.executeQuery();
			String grade="";
			String tstat="";
			while (rs.next()) {
				if(rs.getString(4).toUpperCase().equals("M")){
					grade = "월회원";
				}else if(rs.getString(4).toUpperCase().equals("Y")){
					grade = "연회원";
				}else if(rs.getString(4).toUpperCase().equals("D")){
					grade = "일회원";
				}
				
				
				tVO = new TicketVO(rs.getString(1), rs.getString(2), rs.getString(3), grade, rs.getString(5), rs.getString(6), rs.getString(7));
				System.out.print("정기권번호 : " + rs.getString(1));
				System.out.print(", 차량번호 : " + rs.getString(2));
				System.out.print(", 차주전화 : " + rs.getString(3));
				System.out.print(", 등급 : " + tstat);
				System.out.print(", 주차시작일 : " + rs.getString(6));
				System.out.println(", 주차종료일 : " + rs.getString(7));
				System.out.println(", 비고 : " + grade + "입니다.");
				
				listParking.add(tVO);
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
		return listParking;
		
	}
	
	public ArrayList searchOut(String carno){
		ParkingVO pVO = null;
		ArrayList listParking = new ArrayList();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String searchQuery = "SELECT * FROM park_info_tbl where carno=?;";
		try {
			Context context = new InitialContext();
			DataSource source = (DataSource) context
					.lookup("java:comp/env/jdbc/myconn");
			conn = source.getConnection();
			System.out.println("서버접속성공!");

			pstmt = conn.prepareStatement(searchQuery);
			pstmt.setString(1, carno);
			rs = pstmt.executeQuery();
			String grade="";
			String tstat="";
			while (rs.next()) {
				if(rs.getString(3).toUpperCase().equals("M")){
					grade = "월회원";
				}else if(rs.getString(3).toUpperCase().equals("Y")){
					grade = "연회원";
				}else if(rs.getString(3).toUpperCase().equals("D")){
				grade = "일회원";
				}
				
				if(rs.getString(4).toUpperCase().equals("I")){
					tstat = "입고";
				}else if(rs.getString(4).toUpperCase().equals("O")){
					tstat = "출고";
				}
				
				pVO = new ParkingVO(rs.getString(1), rs.getString(2), grade, tstat, rs.getString(5), rs.getString(6));
				System.out.print("주차번호 : " + rs.getString(1));
				System.out.print(", 차량번호 : " + rs.getString(2));
				System.out.print(", 주차등급 : " + grade);
				System.out.print(", 상태 : " + tstat);
				System.out.print(", 주차시작일 : " + rs.getString(5));
				System.out.println(", 주차종료일 : " + rs.getString(6));
				
				listParking.add(pVO);
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
		return listParking;
		
	}
}
