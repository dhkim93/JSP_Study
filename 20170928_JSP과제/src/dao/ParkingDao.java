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
	public int enroll(String parkno, String carno, String grade, String tstat,
			String indate, String outdate) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int res = 0;
		try {
			String queryInsert = "insert into park_info_tbl(parkno, carno, grade, tstat, indate, outdate) values (null, ?, ?, ?, ?, ?)";

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

	public String parkIn(String carno) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String inStat = "";
		String searchQuery = "SELECT * FROM park_info_tbl where carno= ?;";
		try {
			Context context = new InitialContext();
			DataSource source = (DataSource) context
					.lookup("java:comp/env/jdbc/myconn");
			conn = source.getConnection();
			System.out.println("서버접속성공!");
			
			System.out.println("inStat은"+inStat);
			pstmt = conn.prepareStatement(searchQuery);
			pstmt.setString(1, carno);
			rs = pstmt.executeQuery();
			
			if (rs.next()){
				System.out.println("차량번호" + carno);
				System.out.println("이미 입고된 차량");
				inStat = "true";
				System.out.println("inStat은"+inStat);
			} else {
				inStat="false";
				System.out.println("inStat은"+inStat);				
			}
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
		return inStat;
	}
	
	public String parkOut(String carno) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String outStat = "";
		String searchQuery = "SELECT * FROM park_info_tbl where carno= ? AND tstat= 'I'; ";
		try {
			Context context = new InitialContext();
			DataSource source = (DataSource) context
					.lookup("java:comp/env/jdbc/myconn");
			conn = source.getConnection();
			System.out.println("서버접속성공!");
			
			System.out.println("outStat은"+outStat);
			pstmt = conn.prepareStatement(searchQuery);
			pstmt.setString(1, carno);
			rs = pstmt.executeQuery();
			
			if (!rs.next()) {
				System.out.println("차량번호" + carno);
				System.out.println("출고 후");
				outStat="true";
				System.out.println("outStat은"+outStat);
			} else {
				outStat = "false";
				System.out.println("출고 전");
				System.out.println("outStat은"+outStat);
				
			}
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
		return outStat;
	}

	public int parkInsert(String carno, String grade, String tstat) {
		ParkingVO pVO = null;
		ArrayList listParking = new ArrayList();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int res = 0;

		try {
			String queryInsert = "insert into park_info_tbl(parkno, carno, grade, tstat, indate, outdate) values (null, ?, ?, ?, now(), null)";

			Context context = new InitialContext();
			DataSource source = (DataSource) context
					.lookup("java:comp/env/jdbc/myconn");
			conn = source.getConnection();
			System.out.println("서버접속성공!");
			
			pstmt = conn.prepareStatement(queryInsert);

			pstmt.setString(1, carno);
			pstmt.setString(2, grade);
			pstmt.setString(3, tstat);

			res = pstmt.executeUpdate();
			pstmt.close();
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
		return res;
	}
	
	public int parkUpdate(String carno) {
		ParkingVO pVO = null;
		ArrayList listParking = new ArrayList();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int res = 0;

		try {
			String queryUpdate = "UPDATE park_info_tbl set tstat='O', outdate= now() where carno= ?;";

			Context context = new InitialContext();
			DataSource source = (DataSource) context
					.lookup("java:comp/env/jdbc/myconn");
			conn = source.getConnection();
			System.out.println("서버접속성공!");
			
			pstmt = conn.prepareStatement(queryUpdate);

			pstmt.setString(1, carno);

			res = pstmt.executeUpdate();
			pstmt.close();
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
		return res;
	}

	public ArrayList searchIn() {
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
			rs = pstmt.executeQuery();
			String grade = "";
			String tstat = "";
			while (rs.next()) {
				if (rs.getString(4).toUpperCase().equals("M")) {
					grade = "월회원";
				} else if (rs.getString(4).toUpperCase().equals("Y")) {
					grade = "연회원";
				} else if (rs.getString(4).toUpperCase().equals("D")) {
					grade = "일회원";
				}

				tVO = new TicketVO(rs.getString(1), rs.getString(2),
						rs.getString(3), grade, rs.getString(5),
						rs.getString(6), rs.getString(7));
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

	public ArrayList searchOut(String carno) {
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
			String grade = "";
			String tstat = "";
			while (rs.next()) {

				pVO = new ParkingVO(rs.getString(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getString(6));
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
	
	public int searchParkingNum() {
		int pNum = 0;
		ParkingVO pVO = null;

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String searchQuery = "SELECT COUNT(*) FROM park_info_tbl";
		try {
			Context context = new InitialContext();
			DataSource source = (DataSource) context
					.lookup("java:comp/env/jdbc/myconn");
			conn = source.getConnection();
			System.out.println("서버접속성공!");

			pstmt = conn.prepareStatement(searchQuery);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				pNum = rs.getInt(1) + 1;

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
		return pNum;
	}
	
	public ArrayList search() {
		ParkingVO pVO = null;
		ArrayList listParking = new ArrayList();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String searchQuery = "SELECT * FROM park_info_tbl;";
		try {
			Context context = new InitialContext();
			DataSource source = (DataSource) context
					.lookup("java:comp/env/jdbc/myconn");
			conn = source.getConnection();
			System.out.println("서버접속성공!");

			pstmt = conn.prepareStatement(searchQuery);
			rs = pstmt.executeQuery();
			String grade="";
			String status="";
			while (rs.next()) {
				if (rs.getString(3).toUpperCase().equals("M")) {
					grade = "월회원";
				} else if (rs.getString(3).toUpperCase().equals("Y")) {
					grade = "연회원";
				} else if (rs.getString(3).toUpperCase().equals("D")) {
					grade = "일회원";
				}
				
				if(rs.getString(4).toUpperCase().equals("I")){
					status="입고";
				}else if(rs.getString(4).toUpperCase().equals("O")){
					status="출고";
				}
				
				String startDate = rs.getString(5).substring(0, 19);
				
				if(status.equals("출고")){//출고일때만
					String endDate = rs.getString(6).substring(0, 19);//2017-10-21 21:42:08.0에서 .0 자르기
					pVO = new ParkingVO(rs.getString(1), rs.getString(2), grade,
							status, startDate, endDate);
					
				}else{
					pVO = new ParkingVO(rs.getString(1), rs.getString(2), grade,
							status, startDate, "");//Null값일 때 주차현황에 출고일시가 아무것도 안뜨게함
				}
				
				System.out.print("주차번호 : " + rs.getString(1));
				System.out.print(", 차량번호 : " + rs.getString(2));
				System.out.print(", 주차등급 : " + rs.getString(3));
				System.out.print(", 상태 : " + rs.getString(4));
				System.out.print(", 주차시작일 : " + startDate);

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
