
<%@page import="com.java.scrapserver.result.utils.Common"%>
<%@page import="org.apache.poi.ss.util.CellRangeAddress"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.hssf.util.HSSFColor"%>
<%@page import="java.awt.Color"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFColor"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.ss.usermodel.Font"%>
<%@page import="org.apache.poi.ss.usermodel.CellStyle"%>
<%@page import="java.util.List"%>
<%@page import="com.java.scrapserver.result.model.SugumBaksa"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	List<SugumBaksa> sugumBaksa = (List<SugumBaksa>) request.getAttribute("infoList");
	HSSFWorkbook workbook = new HSSFWorkbook();
	
	Sheet sheet0 = workbook.createSheet("점검표(수금박사)");
	Sheet sheet1 = workbook.createSheet("점검표(장부장)");
	Sheet sheet2 = workbook.createSheet("점검표(IBK모자)");
	
	setDefaultSheetWidth(sheet0);
	setDefaultSheetWidth(sheet1);
	setDefaultSheetWidth(sheet2);

	for(int i=0; i<sugumBaksa.size(); i++){
		SugumBaksa baksa = (SugumBaksa) sugumBaksa.get(i);
		if (baksa.getSts().equals("0")){
			createExcel(workbook, sheet0, baksa);
		}
		if (baksa.getSts().equals("1")){
			createExcel(workbook, sheet1, baksa);
		}
		if (baksa.getSts().equals("2")){
			createExcel(workbook, sheet2, baksa);
		}
	}
	
	
	String timeStamp = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	String name      = "스크래핑결과_"+timeStamp+".xls";
	response.setHeader("Content-Disposition", "attachment; filename="+ URLEncoder.encode(name, "UTF-8"));
	response.setContentType("application/vnd.ms-excel");
	workbook.write(response.getOutputStream());
	response.getOutputStream().flush();
	response.getOutputStream().close(); 
%>

<%!
private void setDefaultSheetWidth(Sheet sheet){	    
	sheet.setDefaultColumnWidth(16);
	sheet.setColumnWidth(0, 500);
	sheet.setColumnWidth(1, 5000);
	sheet.setColumnWidth(2, 4000);
	sheet.setColumnWidth(3, 4000);
	sheet.setColumnWidth(4, 4000);
	sheet.setColumnWidth(5, 4000);
	sheet.setColumnWidth(6, 4000);
	sheet.setColumnWidth(7, 3000);
	sheet.setColumnWidth(8, 8000);

}

private Font createAndSetFontStyle(Workbook workbook,boolean bold,int height, int color){
	Font font = workbook.createFont();
	if (bold){
		font.setBoldweight(Font.BOLDWEIGHT_BOLD);
	}
	font.setFontHeightInPoints((short)height);
	font.setColor((short)color);
	return font;
}

private CellStyle cellStyle(Workbook workbook,boolean border,int align, Font font, int backGroundColor){
	CellStyle cellStyle  = workbook.createCellStyle();
	if (border){
		cellStyle.setBorderBottom(CellStyle.BORDER_THIN);
		cellStyle.setBorderTop(CellStyle.BORDER_THIN);
		cellStyle.setBorderLeft(CellStyle.BORDER_THIN);
		cellStyle.setBorderRight(CellStyle.BORDER_THIN);
		cellStyle.setTopBorderColor(HSSFColor.BLACK.index);
		cellStyle.setLeftBorderColor(HSSFColor.BLACK.index);
		cellStyle.setRightBorderColor(HSSFColor.BLACK.index);
		cellStyle.setBottomBorderColor(HSSFColor.BLACK.index);
	}
	
	if (font != null){
		cellStyle.setFont(font);
	}
	
	if (align != 0){
		cellStyle.setAlignment((short)align);
	}
	
	if (backGroundColor != 0){
		cellStyle.setFillForegroundColor((short)backGroundColor);
		cellStyle.setFillPattern(CellStyle.SOLID_FOREGROUND);
	}
	cellStyle.setWrapText(true);
	cellStyle.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
	return cellStyle;
}

public Row createRow(Sheet sheet,int index,int height){
	Row row = sheet.getRow((short) index);
	if (row == null){
		row = sheet.createRow((short) index);
	}
	row.setHeight((short)height);
	return row;
}
public Row createRow(Sheet sheet,int index){
	Row row = sheet.getRow((short) index);
	if (row == null){
		row = sheet.createRow((short) index);
	}
	return row;
}

public  void createHeaderCell(Sheet sheet,CellStyle style , Row row, int index , String value, CellRangeAddress region){
	Cell cell = null; 
	cell = row.createCell(index);
	
	if(style != null){
		cell.setCellStyle(style);
	}
	if(value == null){
		value = "";
	}

	cell.setCellValue(value);
	if(sheet != null && region != null){
		 for(int rowNum =region.getFirstRow();rowNum<=region.getLastRow();rowNum++){
		        Row rows= sheet.getRow(rowNum);
		        if(rows==null){
		        	rows = sheet.createRow(rowNum);
		        }
		        for(int colNum=region.getFirstColumn();colNum<=region.getLastColumn();colNum++){
		           Cell currentCell = rows.getCell(colNum); 
		           if(currentCell==null){
		               currentCell = rows.createCell(colNum);
		           }    
		           currentCell.setCellStyle(style);
		        }
		    }
		sheet.addMergedRegion(region);
	}
}
	
private void createExcel(Workbook workbook,Sheet sheet,SugumBaksa sugumbaksa){
	Font font = null;
	CellStyle cellStyle = null;
	CellStyle cellStyle1= null;
	Common com = new Common();
	
	Row row = null;
	
	font = createAndSetFontStyle(workbook, true, 12, HSSFColor.BLACK.index);
	cellStyle = cellStyle(workbook, false, CellStyle.ALIGN_LEFT, font, HSSFColor.YELLOW.index);
	row = createRow(sheet, 0, 650);
	createHeaderCell(sheet, cellStyle, row, 1, "조회기준일", null);
	
	font = createAndSetFontStyle(workbook, true, 12, HSSFColor.BLUE.index);
	cellStyle = cellStyle(workbook, false, CellStyle.ALIGN_LEFT, font, 0);
	createHeaderCell(sheet, cellStyle, row, 2, com.strToDateFormat(String.valueOf(sugumbaksa.getDateReport()),0), null);
	
	font = createAndSetFontStyle(workbook, true, 10, HSSFColor.BLACK.index);
	cellStyle = cellStyle(workbook, true, CellStyle.ALIGN_CENTER, font, HSSFColor.GREY_25_PERCENT.index);
	row = createRow(sheet, 1);
	createHeaderCell(sheet, cellStyle, row, 1, "체크항목", null);
	createHeaderCell(sheet, cellStyle, row, 2, "등록계정수 \n (쿠콘)", null);
	createHeaderCell(sheet, cellStyle, row, 3, "등록계정수 \n (수박)", null);
	createHeaderCell(sheet, cellStyle, row, 4, "기준일", new CellRangeAddress(1,1,4,5));
	createHeaderCell(sheet, cellStyle, row, 6, "거래건수 \n (쿠콘)", null);
	createHeaderCell(sheet, cellStyle, row, 7, "수금박사 \n (컨텐츠)", null);
	createHeaderCell(sheet, cellStyle, row, 8, "비고", null);
	
	cellStyle = cellStyle(workbook, true, CellStyle.ALIGN_CENTER, font, 0);
	font = createAndSetFontStyle(workbook, false, 10, HSSFColor.BLACK.index);
	cellStyle1= cellStyle(workbook, true, CellStyle.ALIGN_CENTER, font, HSSFColor.YELLOW.index);
	row = createRow(sheet, 2);
	createHeaderCell(sheet, cellStyle, row, 1, "계좌", new CellRangeAddress(2,3,1,1));	
	createHeaderCell(sheet, cellStyle1, row, 2,String.valueOf(sugumbaksa.getTtBankCnt()), new CellRangeAddress(2,3,2,2));	
	row = createRow(sheet, 4);
	createHeaderCell(sheet, cellStyle, row, 1, "법인카드", new CellRangeAddress(4,6,1,1));
	createHeaderCell(sheet, cellStyle1, row, 2, String.valueOf(sugumbaksa.getTtCardCnt()), new CellRangeAddress(4,6,2,2));
	row = createRow(sheet, 7);
	createHeaderCell(sheet, cellStyle, row, 1, "카드매출(가맹점)", new CellRangeAddress(7,9,1,1));
	createHeaderCell(sheet, cellStyle1, row, 2, String.valueOf(sugumbaksa.getTtCardSaleCnt()), new CellRangeAddress(7,9,2,2));
	row = createRow(sheet, 10);
	createHeaderCell(sheet, cellStyle, row, 1, "전자세금계산서", new CellRangeAddress(10,13,1,1));
	createHeaderCell(sheet, cellStyle1, row, 2, String.valueOf(sugumbaksa.getTtEtaxCnt()), new CellRangeAddress(10,13,2,2));
	row = createRow(sheet, 14);
	createHeaderCell(sheet, cellStyle, row, 1, "현금영수증", new CellRangeAddress(14,15,1,1));
	createHeaderCell(sheet, cellStyle1, row, 2, String.valueOf(sugumbaksa.getTtCashCnt()), new CellRangeAddress(14,15,2,2));
	row = createRow(sheet, 16);
	createHeaderCell(sheet, cellStyle, row, 1, "개인카드", new CellRangeAddress(16,20,1,1));
	createHeaderCell(sheet, cellStyle1, row, 2, String.valueOf(sugumbaksa.getTtPsnCardCnt()), new CellRangeAddress(16,20,2,2));
	
	Font fontbold = createAndSetFontStyle(workbook, true, 10, HSSFColor.BLACK.index);
	cellStyle = cellStyle(workbook, true, CellStyle.ALIGN_LEFT, fontbold, 0);
	cellStyle1 = cellStyle(workbook, true, CellStyle.ALIGN_CENTER, font, HSSFColor.YELLOW.index);	
	CellStyle cellStyle2 = cellStyle(workbook, true, CellStyle.ALIGN_LEFT, fontbold, 0);
	CellStyle cellStyle3 = cellStyle(workbook, true, CellStyle.ALIGN_LEFT, font, 0);
	CellStyle cellStyleY = cellStyle(workbook, true, CellStyle.ALIGN_LEFT, fontbold, HSSFColor.GREEN.index);
	String value[] = new String[]{"입금(D-1)","출금(D-1)","승인(D-2)","청구(D)","한도(D-1)","입금(D-1)","매입(D-1)","승인(D-1)","매입(D-1)","매입_면세(D-1)","매출(D-1)","매출_면세(D-1)","매입(D-1)","매출(D-1)","승인(D-2)","청구(D)","한도(D-1)","결제일","카드목록"};
	int j = 2;
	String dt = com.strToDateFormat(String.valueOf(sugumbaksa.getDateReport()),-1) ;
	String val= "";	
	for(int i=0; i<value.length;i++){
		String dec= "";
		row = createRow(sheet, j);
		j++;

		if (i==0 || i==1 || i==5 || i==6 || i==7){
			
			createHeaderCell(sheet, cellStyleY, row, 4, value[i].toString(), null);	
		}else{
			createHeaderCell(sheet, cellStyle, row, 4, value[i].toString(), null);		
		}		
		
		if (i==2){
			dt = com.strToDateFormat(String.valueOf(sugumbaksa.getDateReport()),-2) ;
		}else if (i==3){
			dt = com.strToDateFormat(String.valueOf(sugumbaksa.getDateReport()),0) ;
		}else{dt = com.strToDateFormat(String.valueOf(sugumbaksa.getDateReport()),-1) ;}
		
		if (i==0)      val = String.valueOf(sugumbaksa.getAccInCnt());
		else if (i==1) val = String.valueOf(sugumbaksa.getAccOutCnt());
		else if (i==2) val = String.valueOf(sugumbaksa.getCardApprcnt());
		else if (i==3) val = String.valueOf(sugumbaksa.getCartBillCnt());
		else if (i==4) val = String.valueOf(sugumbaksa.getCardLimitCnt());
		else if (i==5) val = String.valueOf(sugumbaksa.getSaleHstReceCnt());
		else if (i==6) val = String.valueOf(sugumbaksa.getSaleHstPurcCnt());
		else if (i==7) val = String.valueOf(sugumbaksa.getSaleHstApprCnt());
		else if (i==8) val = String.valueOf(sugumbaksa.getSearchGuhunA());
		else if (i==9) val = String.valueOf(sugumbaksa.getSearchGuhunB());
		else if (i==10) val = String.valueOf(sugumbaksa.getSearchGuhunC());
		else if (i==11) val = String.valueOf(sugumbaksa.getSearchGuhunD());
		else if (i==12) val = String.valueOf(sugumbaksa.getCashRcpPurcCnt());
		else if (i==13) val = String.valueOf(sugumbaksa.getCashRcpSaleCnt());
		else if (i==14) val = String.valueOf(sugumbaksa.getPsnCardApprCnt());
		else if (i==15) val = String.valueOf(sugumbaksa.getPsnCardBillCnt());
		else if (i==16) val = String.valueOf(sugumbaksa.getPsnCardLimitCnt());
		else if (i==17) val = String.valueOf(sugumbaksa.getPsnCardPaymentDateCnt());
		else if (i==18) val = String.valueOf(sugumbaksa.getPsnCardListCnt());
		createHeaderCell(sheet, cellStyle1, row, 6, val, null); 

		
		if (i == 3){
			dec = "전월 청구 전체";
		}else if (i==4){
			dec = "등록일자 기준";
		}else if (i == 15){
			dec = "전월 청구 전체";
		}else if (i == 17 || i ==18){
			dec = "전체";
		}

		createHeaderCell(sheet, cellStyle2, row, 3, "", null);		
		createHeaderCell(sheet, cellStyle2, row, 5, dt, null);
		createHeaderCell(sheet, cellStyle3, row, 7, "", null);
		createHeaderCell(sheet, cellStyle3, row, 8, dec, null);	
		
	}

	row = createRow(sheet, 22);
	cellStyle = cellStyle(workbook, false, CellStyle.ALIGN_CENTER, fontbold, HSSFColor.YELLOW.index);
	createHeaderCell(sheet, cellStyle1, row, 2, "", new CellRangeAddress(22,25,1,8));
}
%>