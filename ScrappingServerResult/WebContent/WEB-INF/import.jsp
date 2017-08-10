<%@page import="java.util.Date"%>
<%@page import="com.java.scrapserver.result.utils.Common"%>
<%@page import="org.apache.log4j.Logger"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="org.apache.poi.ss.usermodel.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="org.apache.poi.ss.usermodel.FormulaEvaluator"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/static/css/content.css" rel="stylesheet" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
function openCity(evt, cityName) {
    // Declare all variables
    var i, tabcontent, tablinks;

    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }

    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }

    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
function insertScrappingServerInformation(){
	var info = [{
			  "id"            :1
			 ,"dateReport"    :$("#dateReport").val().replace(/\-/g, '')
			 ,"accInCnt"      :$("#sugumaccInCnt").text()
			 ,"accOutCnt"     :$("#sugumaccOutCnt").text()
			 ,"cardApprcnt"   :$("#sugumcardApprcnt").text()
			 ,"cartBillCnt"   :$("#sugumcartBillCnt").text()
			 ,"cardLimitCnt"  :$("#sugumcardLimitCnt").text()
			 ,"saleHstReceCnt":$("#sugumsaleHstReceCnt").text()
			 ,"saleHstPurcCnt":$("#sugumsaleHstPurcCnt").text()
			 ,"saleHstApprCnt":$("#sugumsaleHstApprCnt").text()
			 ,"searchGuhunA"  :$("#sugumsearchGuhunA").text()
			 ,"searchGuhunB"  :$("#sugumsearchGuhunB").text()
			 ,"searchGuhunC"  :$("#sugumsearchGuhunC").text()
			 ,"searchGuhunD"  :$("#sugumsearchGuhunD").text()
			 ,"cashRcpPurcCnt":$("#sugumcashRcpPurcCnt").text()
			 ,"cashRcpSaleCnt":$("#sugumcashRcpSaleCnt").text()
			 ,"psnCardApprCnt":$("#sugumpsnCardApprCnt").text()
			 ,"psnCardBillCnt":$("#sugumpsnCardBillCnt").text()
			 ,"psnCardLimitCnt":$("#sugumpsnCardLimitCnt").text()
			 ,"psnCardPaymentDateCnt":$("#sugumpsnCardPaymentDateCnt").text()
			 ,"psnCardListCnt":$("#sugumpsnCardListCnt").text()
			 ,"ttBankCnt"     :$("#sugumttBankCnt").text()
			 ,"ttCardCnt"     :$("#sugumttCardCnt").text()
			 ,"ttCardSaleCnt" :$("#sugumttCardSaleCnt").text()
			 ,"ttEtaxCnt"     :$("#sugumttEtaxCnt").text()
			 ,"ttCashCnt"     :$("#sugumttCashCnt").text()
			 ,"ttPsnCardCnt"  :$("#sugumttPsnCardCnt").text()
			 ,"sts"           :"0"
	},{
		      "id"            :2
		     ,"dateReport"    :$("#dateReport").val().replace(/\-/g, '')
			 ,"accInCnt"      :$("#chaungaccInCnt").text()
			 ,"accOutCnt"     :$("#chaungaccOutCnt").text()
			 ,"cardApprcnt"   :$("#chaungcardApprcnt").text()
			 ,"cartBillCnt"   :$("#chaungcartBillCnt").text()
			 ,"cardLimitCnt"  :$("#chaungcardLimitCnt").text()
			 ,"saleHstReceCnt":$("#chaungsaleHstReceCnt").text()
			 ,"saleHstPurcCnt":$("#chaungsaleHstPurcCnt").text()
			 ,"saleHstApprCnt":$("#chaungsaleHstApprCnt").text()
			 ,"searchGuhunA"  :$("#chaungsearchGuhunA").text()
			 ,"searchGuhunB"  :$("#chaungsearchGuhunB").text()
			 ,"searchGuhunC"  :$("#chaungsearchGuhunC").text()
			 ,"searchGuhunD"  :$("#chaungsearchGuhunD").text()
			 ,"cashRcpPurcCnt":$("#chaungcashRcpPurcCnt").text()
			 ,"cashRcpSaleCnt":$("#chaungcashRcpSaleCnt").text()
			 ,"psnCardApprCnt":$("#chaungpsnCardApprCnt").text()
			 ,"psnCardBillCnt":$("#chaungpsnCardBillCnt").text()
			 ,"psnCardLimitCnt":$("#chaungpsnCardLimitCnt").text()
			 ,"psnCardPaymentDateCnt":$("#chaungpsnCardPaymentDateCnt").text()
			 ,"psnCardListCnt":$("#chaungpsnCardListCnt").text()
			 ,"ttBankCnt"     :$("#chaungttBankCnt").text()
			 ,"ttCardCnt"     :$("#chaungttCardCnt").text()
			 ,"ttCardSaleCnt" :$("#chaungttCardSaleCnt").text()
			 ,"ttEtaxCnt"     :$("#chaungttEtaxCnt").text()
			 ,"ttCashCnt"     :$("#chaungttCashCnt").text()
			 ,"ttPsnCardCnt"  :$("#chaungttPsnCardCnt").text()
			 ,"sts"           :"1"
	},{
		
		     "id"             :3
			 ,"dateReport"    :$("#dateReport").val().replace(/\-/g, '')
			 ,"accInCnt"      :$("#ibkaccInCnt").text()
			 ,"accOutCnt"     :$("#ibkaccOutCnt").text()
			 ,"cardApprcnt"   :$("#ibkcardApprcnt").text()
			 ,"cartBillCnt"   :$("#ibkcartBillCnt").text()
			 ,"cardLimitCnt"  :$("#ibkcardLimitCnt").text()
			 ,"saleHstReceCnt":$("#ibksaleHstReceCnt").text()
			 ,"saleHstPurcCnt":$("#ibksaleHstPurcCnt").text()
			 ,"saleHstApprCnt":$("#ibksaleHstApprCnt").text()
			 ,"searchGuhunA"  :$("#ibksearchGuhunA").text()
			 ,"searchGuhunB"  :$("#ibksearchGuhunB").text()
			 ,"searchGuhunC"  :$("#ibksearchGuhunC").text()
			 ,"searchGuhunD"  :$("#ibksearchGuhunD").text()
			 ,"cashRcpPurcCnt":$("#ibkcashRcpPurcCnt").text()
			 ,"cashRcpSaleCnt":$("#ibkcashRcpSaleCnt").text()
			 ,"psnCardApprCnt":$("#ibkpsnCardApprCnt").text()
			 ,"psnCardBillCnt":$("#ibkpsnCardBillCnt").text()
			 ,"psnCardLimitCnt":$("#ibkpsnCardLimitCnt").text()
			 ,"psnCardPaymentDateCnt":$("#ibkpsnCardPaymentDateCnt").text()
			 ,"psnCardListCnt":$("#ibkpsnCardListCnt").text()
			 ,"ttBankCnt"     :$("#ibkttBankCnt").text()
			 ,"ttCardCnt"     :$("#ibkttCardCnt").text()
			 ,"ttCardSaleCnt" :$("#ibkttCardSaleCnt").text()
			 ,"ttEtaxCnt"     :$("#ibkttEtaxCnt").text()
			 ,"ttCashCnt"     :$("#ibkttCashCnt").text()
			 ,"ttPsnCardCnt"  :$("#ibkttPsnCardCnt").text()
			 ,"sts"           :"2"
	}];
	var d = {
			data : info
	}
	//console.log(d);
	 $.ajax({
        url: '${pageContext.request.contextPath }/insertScrapInformation',
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
        },
        type: "POST",
        dataType: "json",
        data: JSON.stringify(info),
        contentType: 'application/json',
        success: function(html) {
            alert(html.status);
        }
    }); 

}
</script>
</head>
<body>

<a href="/ScrappingServerResult/">��ũ���ΰ��</a> | 
<a href="/ScrappingServerResult/import">Import Excel</a> 

<hr>

<div>
	<form action="${pageContext.request.contextPath }/listDataOnView" method="post" enctype="multipart/form-data">
		<input type="file" name="file" onchange="this.form.submit();">		
	</form>
	<button onclick="insertScrappingServerInformation();">Import</button>
</div>



<%
	Common common = new Common();
	try{
		    String str = request.getAttribute("parth") == null ? "" : (String)request.getAttribute("parth")  ;//"C:\\Users\\Mango\\Desktop\\Book1.xlsx";
			System.out.println("Parth ======== " + str);
			if (!str.equals("")){
		    	FileInputStream input = new FileInputStream(new File(str));
		    	//Create Workbook instance holding reference to .xlsx file
				XSSFWorkbook workbook = new XSSFWorkbook(input);
				
				FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
				
				//Get first/desired sheet from the workbook
				XSSFSheet sheet = workbook.getSheetAt(0);
				XSSFSheet sheet1 = workbook.getSheetAt(1);
				XSSFSheet sheet2 = workbook.getSheetAt(2);
				//Iterate through each rows one by one
				/* Iterator<Row> rowIterator = sheet.iterator();
				int i= 1;
				while (rowIterator.hasNext()) 
				{
					Row row = rowIterator.next();
					//For each row, iterate through all the columns
					Iterator<Cell> cellIterator = row.cellIterator();
					
					while (cellIterator.hasNext()) 
					{
						Cell cell = cellIterator.next();
						//If it is formula cell, it will be evaluated otherwise no change will happen
						switch (evaluator.evaluateInCell(cell).getCellType()) 
						{

						case Cell.CELL_TYPE_NUMERIC:
								System.out.print(cell.getNumericCellValue() + "\t\t");
								break;
							case Cell.CELL_TYPE_STRING:
								System.out.print(cell.getStringCellValue() + "\t\t");
								break;
							case Cell.CELL_TYPE_FORMULA:
								//Not again
								break;
						}
					}
					if (i==5) break;
					System.out.println("");
					System.out.println("");
					System.out.println("");
					
				} 
				input.close(); */
%>
<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'sugum_baksa')">����ǥ(���ݹڻ�)</button>
  <button class="tablinks" onclick="openCity(event, 'chaugngbochaung')">����ǥ(�����)</button>
  <button class="tablinks" onclick="openCity(event, 'ibk')">����ǥ(IBK����)</button>
</div>
<input type="hidden" value="<%=common.excelReturnDateValue(sheet.getRow(0).getCell(2).getDateCellValue()) %>" id="dateReport"/>
<div id="sugum_baksa" class="tabcontent" style="display: block;">
<table  style="width:100%">
	<colgroup>
		<col width="15%"/>
		<col width="10%"/>
		<col width="12%"/>
		<col width="8%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="25%"/>
	</colgroup>
	<thead>
		<tr>
			<th>üũ�׸�</th>
			<th>��ϰ�����(����)</th>
			<th>��ϰ�����(����)</th>
			<th colspan="2">������</th>
			<th>�ŷ��Ǽ�(����)</th>
			<th>���ݹڻ�(������)</th>
			<th>���</th>
		</tr>
	</thead>
	<tbody>
	    <% 
	    	Row row  = sheet.getRow(2);
	    	Date dt = sheet.getRow(0).getCell(2).getDateCellValue();
	    %>
	    
	    <tr>
	    	<td rowspan="2" class="t-center">����</td>
	    	<td rowspan="2" class="t-center"><div id="sugumttBankCnt"><%=common.excellReturnLongValue(sheet.getRow(2).getCell(2).toString()) %></div> </td>
	    	<td></td>
	    	<td>�Ա�(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt,-1) %></td>
	    	<td class="t-center"><div id="sugumaccInCnt"><%=common.excellReturnLongValue(sheet.getRow(2).getCell(6).toString()) %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>���(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt,-1 )   %></td>
	    	<td class="t-center"><div id="sugumaccOutCnt"><%=common.excellReturnLongValue(sheet.getRow(3).getCell(6).toString()) %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	    <tr>
	    	<td rowspan="3" class="t-center">����ī��</td>
	    	<td rowspan="3" class="t-center"><div id="sugumttCardCnt"><%=common.excellReturnLongValue(sheet.getRow(4).getCell(2).toString())  %></div></td>
	    	<td></td>
	    	<td>����(D-2)</td>
	    	<td><%=common.excelReturnDateValue(dt,-2) %></td>
	    	<td class="t-center"><div id="sugumcardApprcnt"><%=common.excellReturnLongValue(sheet.getRow(4).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>û��(D)</td>
	    	<td><%=common.excelReturnDateValue(dt) %> </td>
	    	<td class="t-center"><div id="sugumcartBillCnt"><%=common.excellReturnLongValue(sheet.getRow(5).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td>���� û�� ��ü</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>�ѵ�(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt,-1) %></td>
	    	<td class="t-center"><div id="sugumcardLimitCnt"><%=common.excellReturnLongValue(sheet.getRow(6).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td>������� ����</td>
	    </tr>
	     <tr>
	    	<td rowspan="3" class="t-center">ī�����(������)</td>
	    	<td rowspan="3" class="t-center"><div id="sugumttCardSaleCnt"><%=common.excellReturnLongValue(sheet.getRow(7).getCell(2).toString() )  %></div></td>
	    	<td></td>
	    	<td>�Ա�(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="sugumsaleHstReceCnt"><%=common.excellReturnLongValue(sheet.getRow(7).getCell(6).toString()) %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="sugumsaleHstPurcCnt"><%=common.excellReturnLongValue(sheet.getRow(8).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="sugumsaleHstApprCnt"><%=common.excellReturnLongValue(sheet.getRow(9).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	    <tr>
	    	<td rowspan="4" class="t-center">���ڼ��ݰ�꼭</td>
	    	<td rowspan="4" class="t-center"><div id="sugumttEtaxCnt"><%=common.excellReturnLongValue(sheet.getRow(10).getCell(2).toString())  %></div></td>
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="sugumsearchGuhunA"><%=common.excellReturnLongValue(sheet.getRow(10).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����_�鼼(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="sugumsearchGuhunB"><%=common.excellReturnLongValue(sheet.getRow(11).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="sugumsearchGuhunC"><%=common.excellReturnLongValue(sheet.getRow(12).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����_�鼼(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="sugumsearchGuhunD"><%=common.excellReturnLongValue(sheet.getRow(13).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>
	    	<td rowspan="2" class="t-center">���ݿ�����</td>
	    	<td rowspan="2" class="t-center"><div id="sugumttCashCnt"><%=common.excellReturnLongValue(sheet.getRow(14).getCell(2).toString())  %></div></td>
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="sugumcashRcpPurcCnt"><%=common.excellReturnLongValue(sheet.getRow(14).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="sugumcashRcpSaleCnt"><%=common.excellReturnLongValue(sheet.getRow(15).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>
	    	<td rowspan="5" class="t-center">����ī��</td>
	    	<td rowspan="5" class="t-center"><div id="sugumttPsnCardCnt"><%=common.excellReturnLongValue(sheet.getRow(16).getCell(2).toString() ) %></div></td>
	    	<td></td>
	    	<td>����(D-2)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="sugumpsnCardApprCnt"><%=common.excellReturnLongValue(sheet.getRow(16).getCell(6).toString() ) %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>û��(D)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="sugumpsnCardBillCnt"><%=common.excellReturnLongValue(sheet.getRow(17).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td>���� û�� ��ü</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>�ѵ�(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="sugumpsnCardLimitCnt"><%=common.excellReturnLongValue(sheet.getRow(18).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>������</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="sugumpsnCardPaymentDateCnt"><%=common.excellReturnLongValue(sheet.getRow(19).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td>��ü</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>ī����</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="sugumpsnCardListCnt"><%=common.excellReturnLongValue(sheet.getRow(20).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td>��ü</td>
	    </tr>
	</tbody>
</table>
</div>
<div id="chaugngbochaung" class="tabcontent">
  <table  style="width:100%">
	<colgroup>
		<col width="15%"/>
		<col width="10%"/>
		<col width="12%"/>
		<col width="8%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="25%"/>
	</colgroup>
	<thead>
		<tr>
			<th>üũ�׸�</th>
			<th>��ϰ�����(����)</th>
			<th>��ϰ�����(�����)</th>
			<th colspan="2">������</th>
			<th>�ŷ��Ǽ�(����)</th>
			<th>IBK����(������)</th>
			<th>���</th>
		</tr>
	</thead>
	<tbody>
	    <tr>
	    	<td rowspan="2" class="t-center">����</td>
	    	<td rowspan="2" class="t-center"><div id="chaungttBankCnt"><%=common.excellReturnLongValue(sheet1.getRow(2).getCell(2).toString()) %></div> </td>
	    	<td></td>
	    	<td>�Ա�(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt,-1) %></td>
	    	<td class="t-center"><div id="chaungaccInCnt"><%=common.excellReturnLongValue(sheet1.getRow(2).getCell(6).toString()) %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>���(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt,-1 )   %></td>
	    	<td class="t-center"><div id="chaungaccOutCnt"><%=common.excellReturnLongValue(sheet1.getRow(3).getCell(6).toString()) %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	    <tr>
	    	<td rowspan="3" class="t-center">����ī��</td>
	    	<td rowspan="3" class="t-center"><div id="chaungttCardCnt"><%=common.excellReturnLongValue(sheet1.getRow(4).getCell(2).toString())  %></div></td>
	    	<td></td>
	    	<td>����(D-2)</td>
	    	<td><%=common.excelReturnDateValue(dt,-2) %></td>
	    	<td class="t-center"><div id="chaungcardApprcnt"><%=common.excellReturnLongValue(sheet1.getRow(4).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>û��(D)</td>
	    	<td><%=common.excelReturnDateValue(dt) %> </td>
	    	<td class="t-center"><div id="chaungcartBillCnt"><%=common.excellReturnLongValue(sheet1.getRow(5).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td>���� û�� ��ü</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>�ѵ�(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt,-1) %></td>
	    	<td class="t-center"><div id="chaungcardLimitCnt"><%=common.excellReturnLongValue(sheet1.getRow(6).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td>������� ����</td>
	    </tr>
	     <tr>
	    	<td rowspan="3" class="t-center">ī�����(������)</td>
	    	<td rowspan="3" class="t-center"><div id="chaungttCardSaleCnt"><%=common.excellReturnLongValue(sheet1.getRow(7).getCell(2).toString() )  %></div></td>
	    	<td></td>
	    	<td>�Ա�(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="chaungsaleHstReceCnt"><%=common.excellReturnLongValue(sheet1.getRow(7).getCell(6).toString()) %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="chaungsaleHstPurcCnt"><%=common.excellReturnLongValue(sheet1.getRow(8).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="chaungsaleHstApprCnt"><%=common.excellReturnLongValue(sheet1.getRow(9).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	    <tr>
	    	<td rowspan="4" class="t-center">���ڼ��ݰ�꼭</td>
	    	<td rowspan="4" class="t-center"><div id="chaungttEtaxCnt"><%=common.excellReturnLongValue(sheet1.getRow(10).getCell(2).toString())  %></div></td>
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="chaungsearchGuhunA"><%=common.excellReturnLongValue(sheet1.getRow(10).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����_�鼼(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="chaungsearchGuhunB"><%=common.excellReturnLongValue(sheet1.getRow(11).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="chaungsearchGuhunC"><%=common.excellReturnLongValue(sheet1.getRow(12).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����_�鼼(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="chaungsearchGuhunD"><%=common.excellReturnLongValue(sheet1.getRow(13).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>
	    	<td rowspan="2" class="t-center">���ݿ�����</td>
	    	<td rowspan="2" class="t-center"><div id="chaungttCashCnt"><%=common.excellReturnLongValue(sheet1.getRow(14).getCell(2).toString())  %></div></td>
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="chaungcashRcpPurcCnt"><%=common.excellReturnLongValue(sheet1.getRow(14).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="chaungcashRcpSaleCnt"><%=common.excellReturnLongValue(sheet1.getRow(15).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>
	    	<td rowspan="5" class="t-center">����ī��</td>
	    	<td rowspan="5" class="t-center"><div id="chaungttPsnCardCnt"><%=common.excellReturnLongValue(sheet1.getRow(16).getCell(2).toString() ) %></div></td>
	    	<td></td>
	    	<td>����(D-2)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="chaungpsnCardApprCnt"><%=common.excellReturnLongValue(sheet1.getRow(16).getCell(6).toString() ) %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>û��(D)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="chaungpsnCardBillCnt"><%=common.excellReturnLongValue(sheet1.getRow(17).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td>���� û�� ��ü</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>�ѵ�(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="chaungpsnCardLimitCnt"><%=common.excellReturnLongValue(sheet1.getRow(18).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>������</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="chaungpsnCardPaymentDateCnt"><%=common.excellReturnLongValue(sheet1.getRow(19).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td>��ü</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>ī����</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="chaungpsnCardListCnt"><%=common.excellReturnLongValue(sheet1.getRow(20).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td>��ü</td>
	    </tr>
	</tbody>
</table>
</div>
<div id="ibk" class="tabcontent">
  <table  style="width:100%">
	<colgroup>
		<col width="15%"/>
		<col width="10%"/>
		<col width="12%"/>
		<col width="8%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="10%"/>
		<col width="25%"/>
	</colgroup>
	<thead>
		<tr>
			<th>üũ�׸�</th>
			<th>��ϰ�����(����)</th>
			<th>��ϰ�����(IBK����)</th>
			<th colspan="2">������</th>
			<th>�ŷ��Ǽ�(����)</th>
			<th>IBK����(������)</th>
			<th>���</th>
		</tr>
	</thead>
	<tbody>
	    <tr>
	    	<td rowspan="2" class="t-center">����</td>
	    	<td rowspan="2" class="t-center"><div id="ibkttBankCnt"><%=common.excellReturnLongValue(sheet2.getRow(2).getCell(2).toString()) %></div> </td>
	    	<td></td>
	    	<td>�Ա�(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt,-1) %></td>
	    	<td class="t-center"><div id="ibkaccInCnt"><%=common.excellReturnLongValue(sheet2.getRow(2).getCell(6).toString()) %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>���(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt,-1 )   %></td>
	    	<td class="t-center"><div id="ibkaccOutCnt"><%=common.excellReturnLongValue(sheet2.getRow(3).getCell(6).toString()) %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	    <tr>
	    	<td rowspan="3" class="t-center">����ī��</td>
	    	<td rowspan="3" class="t-center"><div id="ibkttCardCnt"><%=common.excellReturnLongValue(sheet2.getRow(4).getCell(2).toString())  %></div></td>
	    	<td></td>
	    	<td>����(D-2)</td>
	    	<td><%=common.excelReturnDateValue(dt,-2) %></td>
	    	<td class="t-center"><div id="ibkcardApprcnt"><%=common.excellReturnLongValue(sheet2.getRow(4).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>û��(D)</td>
	    	<td><%=common.excelReturnDateValue(dt) %> </td>
	    	<td class="t-center"><div id="ibkcartBillCnt"><%=common.excellReturnLongValue(sheet2.getRow(5).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td>���� û�� ��ü</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>�ѵ�(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt,-1) %></td>
	    	<td class="t-center"><div id="ibkcardLimitCnt"><%=common.excellReturnLongValue(sheet2.getRow(6).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td>������� ����</td>
	    </tr>
	     <tr>
	    	<td rowspan="3" class="t-center">ī�����(������)</td>
	    	<td rowspan="3" class="t-center"><div id="ibkttCardSaleCnt"><%=common.excellReturnLongValue(sheet2.getRow(7).getCell(2).toString() )  %></div></td>
	    	<td></td>
	    	<td>�Ա�(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="ibksaleHstReceCnt"><%=common.excellReturnLongValue(sheet2.getRow(7).getCell(6).toString()) %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="ibksaleHstPurcCnt"><%=common.excellReturnLongValue(sheet2.getRow(8).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="ibksaleHstApprCnt"><%=common.excellReturnLongValue(sheet2.getRow(9).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	    <tr>
	    	<td rowspan="4" class="t-center">���ڼ��ݰ�꼭</td>
	    	<td rowspan="4" class="t-center"><div id="ibkttEtaxCnt"><%=common.excellReturnLongValue(sheet2.getRow(10).getCell(2).toString())  %></div></td>
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="ibksearchGuhunA"><%=common.excellReturnLongValue(sheet2.getRow(10).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����_�鼼(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="ibksearchGuhunB"><%=common.excellReturnLongValue(sheet2.getRow(11).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="ibksearchGuhunC"><%=common.excellReturnLongValue(sheet.getRow(12).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����_�鼼(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="ibksearchGuhunD"><%=common.excellReturnLongValue(sheet2.getRow(13).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>
	    	<td rowspan="2" class="t-center">���ݿ�����</td>
	    	<td rowspan="2" class="t-center"><div id="ibkttCashCnt"><%=common.excellReturnLongValue(sheet2.getRow(14).getCell(2).toString())  %></div></td>
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="ibkcashRcpPurcCnt"><%=common.excellReturnLongValue(sheet2.getRow(14).getCell(6).toString())  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>����(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="ibkcashRcpSaleCnt"><%=common.excellReturnLongValue(sheet2.getRow(15).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>
	    	<td rowspan="5" class="t-center">����ī��</td>
	    	<td rowspan="5" class="t-center"><div id="ibkttPsnCardCnt"><%=common.excellReturnLongValue(sheet2.getRow(16).getCell(2).toString() ) %></div></td>
	    	<td></td>
	    	<td>����(D-2)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="ibkpsnCardApprCnt"><%=common.excellReturnLongValue(sheet2.getRow(16).getCell(6).toString() ) %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>û��(D)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="ibkpsnCardBillCnt"><%=common.excellReturnLongValue(sheet2.getRow(17).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td>���� û�� ��ü</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>�ѵ�(D-1)</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="ibkpsnCardLimitCnt"><%=common.excellReturnLongValue(sheet2.getRow(18).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>������</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="ibkpsnCardPaymentDateCnt"><%=common.excellReturnLongValue(sheet2.getRow(19).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td>��ü</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>ī����</td>
	    	<td><%=common.excelReturnDateValue(dt, -1) %></td>
	    	<td class="t-center"><div id="ibkpsnCardListCnt"><%=common.excellReturnLongValue(sheet2.getRow(20).getCell(6).toString() )  %></div></td>
	    	<td></td>
	    	<td>��ü</td>
	    </tr>
	</tbody>
</table>
</div>
	<%   
				}
			}	
			catch(Exception e){
				e.printStackTrace();
			}
%>
</body>
</html>