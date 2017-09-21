<%--  엑셀 파일 저장 경로: D:\kwork\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSP_Excel_file_create_read\excel_data --%>  
<%@page import="jxl.format.Alignment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %>
<%@ page import="jxl.*" %>
<%@ page import="jxl.write.*" %>

<%
String path = application.getRealPath("/excel_data");
File dir = new File(path);
if(!dir.exists()) dir.mkdir();
File excel_file = new File(dir, "sample.xls");

WritableWorkbook workbook = Workbook.createWorkbook(excel_file);
WritableSheet sheet = workbook.createSheet("Sample", 0);//시트의 이름은 Sample이고 0번째 부터 시작!

Label name_lb = new Label(1, 0, "Excel 데이터 표현");//글자입력개체(x축 1 y축 0에 Excel 데이터표현이라고 적음)
WritableFont name_font = new WritableFont(WritableFont.COURIER, 14, WritableFont.BOLD);//글자체 커리어 폰트, 14포인트 , 진하게로 적용(폰트적용)
WritableCellFormat name_format = new WritableCellFormat(name_font);//셀포맷지정
name_lb.setCellFormat(name_format);//셀포멧정한것을 name_lb에 전함
sheet.addCell(name_lb);//sheet에 적음

String[] header_str = new String[] {"이름","나이","연락처","주소"};
WritableFont[] header_font = new WritableFont[4];
WritableCellFormat[] header_format = new WritableCellFormat[header_str.length];

for(int i=0; i<header_str.length; i++) {//header_str 내용을 적어줌
	header_font[i] = new WritableFont(WritableFont.COURIER, 12, WritableFont.BOLD);
	header_format[i] = new WritableCellFormat(header_font[i]);
	
	header_format[i].setAlignment(jxl.format.Alignment.CENTRE);
	Label header_lb = new Label(i, 2, header_str[i]);
	header_lb.setCellFormat(header_format[i]);
	sheet.addCell(header_lb);
}

Object[][] data_arr = new Object[][] {
		{"홍길동",20,"010-1234-1234","서울 금천구"},
		{"박길동",21,"010-1234-1234","서울 금천구"},
		{"김동",22,"010-1234-1234","서울 금천구"}};

WritableFont left_font = new WritableFont(WritableFont.COURIER, 10, WritableFont.BOLD);
WritableCellFormat left_format = new WritableCellFormat(left_font);//왼쪽정렬
left_format.setAlignment(jxl.format.Alignment.LEFT);

WritableFont cen_font = new WritableFont(WritableFont.COURIER, 10, WritableFont.BOLD);
WritableCellFormat cen_format = new WritableCellFormat(left_font);//가운데 정렬
cen_format.setAlignment(jxl.format.Alignment.CENTRE);

for(int i=0; i<data_arr.length; i++) {
	for(int j=0; j<data_arr[i].length; j++) {
		WritableCell data = null;
		
		if(j == 1)//숫자데이터(나이)
			data = new jxl.write.Number(j, 3 + i, ((Integer)data_arr[i][j]).intValue());
		else//나머지는 다 문자열
			data = new Label(j, 3 + i, (String)data_arr[i][j]);
		
		if(j == 3) //주소데이터
			((WritableCell)data).setCellFormat(left_format);
		else
			((WritableCell)data).setCellFormat(cen_format);
		
		
		sheet.addCell(((WritableCell)data));
	}
}

CellView tel_view = new CellView();
tel_view.setAutosize(true);//크기 자동 맞춤
sheet.setColumnView(2, tel_view);

CellView addr_view = new CellView();
addr_view.setAutosize(true);
sheet.setColumnView(3, addr_view);

workbook.write();//엑셀에 출력
workbook.close();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
Excel file create OK!
</body>
</html>