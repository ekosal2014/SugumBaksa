<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/ScrappingServerResult/static/css/content.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


</head>
<body>
<a href="/ScrappingServerResult/">스크래핑결과</a> | 
<a href="/ScrappingServerResult/import">Import Excel</a> 
<hr>

<div>
	 <form action="/ScrappingServerResult/export" name="form1" method="post">
     	<input type="text" readonly="readonly" id="chdl-dt" name="chdl-dt">
     </form>
     <button id="btn-search">Search</button>
	 <button id="btn-exportExcel">Export Excel</button>
</div>

<div id="no-dataView">
	<table style="width: 100%;text-align: center;margin-top:20px;">
		<tbody>
			<tr>
				<td>It has not Information!!!!!</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="tab" style="display:none;">
  <button class="tablinks" onclick="openCity(event, 'sugum_baksa')">점검표(수금박사)</button>
  <button class="tablinks" onclick="openCity(event, 'chaugngbochaung')">점검표(장부장)</button>
  <button class="tablinks" onclick="openCity(event, 'ibk')">점검표(IBK모자)</button>
</div>
<div id="sugum_baksa" class="tabcontent" >
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
			<th>체크항목</th>
			<th>등록계정수(쿠콘)</th>
			<th>등록계정수(수박)</th>
			<th colspan="2">기준일</th>
			<th>거래건수(쿠콘)</th>
			<th>수금박사(컨텐츠)</th>
			<th>비고</th>
		</tr>
	</thead>
	<tbody>
	    <tr>
	    	<td rowspan="2" class="t-center">계좌</td>
	    	<td rowspan="2" class="t-center"><div id="sugumttBankCnt"></div> </td>
	    	<td></td>
	    	<td>입금(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumaccInCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>출금(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumaccOutCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	    <tr>
	    	<td rowspan="3" class="t-center">법인카드</td>
	    	<td rowspan="3" class="t-center"><div id="sugumttCardCnt"></div></td>
	    	<td></td>
	    	<td>승인(D-2)</td>
	    	<td class="date-d-2"></td>
	    	<td class="t-center"><div id="sugumcardApprcnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>청구(D)</td>
	    	<td class="date-d"> </td>
	    	<td class="t-center"><div id="sugumcartBillCnt"></div></td>
	    	<td></td>
	    	<td>전월 청구 전체</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>한도(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumcardLimitCnt"></div></td>
	    	<td></td>
	    	<td>등록일자 기준</td>
	    </tr>
	     <tr>
	    	<td rowspan="3" class="t-center">카드매출(가맹점)</td>
	    	<td rowspan="3" class="t-center"><div id="sugumttCardSaleCnt"></div></td>
	    	<td></td>
	    	<td>입금(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumsaleHstReceCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>매입(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumsaleHstPurcCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>승인(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumsaleHstApprCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	    <tr>
	    	<td rowspan="4" class="t-center">전자세금계산서</td>
	    	<td rowspan="4" class="t-center"><div id="sugumttEtaxCnt"></div></td>
	    	<td></td>
	    	<td>매입(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumsearchGuhunA"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>매입_면세(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumsearchGuhunB"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>매출(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumsearchGuhunC"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>매출_면세(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumsearchGuhunD"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>
	    	<td rowspan="2" class="t-center">현금영수증</td>
	    	<td rowspan="2" class="t-center"><div id="sugumttCashCnt"></div></td>
	    	<td></td>
	    	<td>매입(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumcashRcpPurcCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>매출(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumcashRcpSaleCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>
	    	<td rowspan="5" class="t-center">개인카드</td>
	    	<td rowspan="5" class="t-center"><div id="sugumttPsnCardCnt"></div></td>
	    	<td></td>
	    	<td>승인(D-2)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumpsnCardApprCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>청구(D)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumpsnCardBillCnt"></div></td>
	    	<td></td>
	    	<td>전월 청구 전체</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>한도(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumpsnCardLimitCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>결제일</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumpsnCardPaymentDateCnt"></div></td>
	    	<td></td>
	    	<td>전체</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>카드목록</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="sugumpsnCardListCnt"></div></td>
	    	<td></td>
	    	<td>전체</td>
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
			<th>체크항목</th>
			<th>등록계정수(쿠콘)</th>
			<th>등록계정수(장부장)</th>
			<th colspan="2">기준일</th>
			<th>거래건수(쿠콘)</th>
			<th>IBK모자(컨텐츠)</th>
			<th>비고</th>
		</tr>
	</thead>
	<tbody>
	    <tr>
	    	<td rowspan="2" class="t-center">계좌</td>
	    	<td rowspan="2" class="t-center"><div id="chaungttBankCnt"></div> </td>
	    	<td></td>
	    	<td>입금(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungaccInCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>출금(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungaccOutCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	    <tr>
	    	<td rowspan="3" class="t-center">법인카드</td>
	    	<td rowspan="3" class="t-center"><div id="chaungttCardCnt"></div></td>
	    	<td></td>
	    	<td>승인(D-2)</td>
	    	<td class="date-d-2"></td>
	    	<td class="t-center"><div id="chaungcardApprcnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>청구(D)</td>
	    	<td class="date-d"> </td>
	    	<td class="t-center"><div id="chaungcartBillCnt"></div></td>
	    	<td></td>
	    	<td>전월 청구 전체</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>한도(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungcardLimitCnt"></div></td>
	    	<td></td>
	    	<td>등록일자 기준</td>
	    </tr>
	     <tr>
	    	<td rowspan="3" class="t-center">카드매출(가맹점)</td>
	    	<td rowspan="3" class="t-center"><div id="chaungttCardSaleCnt"></div></td>
	    	<td></td>
	    	<td>입금(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungsaleHstReceCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>매입(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungsaleHstPurcCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>승인(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungsaleHstApprCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	    <tr>
	    	<td rowspan="4" class="t-center">전자세금계산서</td>
	    	<td rowspan="4" class="t-center"><div id="chaungttEtaxCnt"></div></td>
	    	<td></td>
	    	<td>매입(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungsearchGuhunA"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>매입_면세(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungsearchGuhunB"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>매출(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungsearchGuhunC"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>매출_면세(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungsearchGuhunD"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>
	    	<td rowspan="2" class="t-center">현금영수증</td>
	    	<td rowspan="2" class="t-center"><div id="chaungttCashCnt"></div></td>
	    	<td></td>
	    	<td>매입(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungcashRcpPurcCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>매출(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungcashRcpSaleCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>
	    	<td rowspan="5" class="t-center">개인카드</td>
	    	<td rowspan="5" class="t-center"><div id="chaungttPsnCardCnt"></div></td>
	    	<td></td>
	    	<td>승인(D-2)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungpsnCardApprCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>청구(D)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungpsnCardBillCnt"></div></td>
	    	<td></td>
	    	<td>전월 청구 전체</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>한도(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungpsnCardLimitCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>결제일</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungpsnCardPaymentDateCnt"></div></td>
	    	<td></td>
	    	<td>전체</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>카드목록</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="chaungpsnCardListCnt"></div></td>
	    	<td></td>
	    	<td>전체</td>
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
			<th>체크항목</th>
			<th>등록계정수(쿠콘)</th>
			<th>등록계정수(IBK모자)</th>
			<th colspan="2">기준일</th>
			<th>거래건수(쿠콘)</th>
			<th>IBK모자(컨텐츠)</th>
			<th>비고</th>
		</tr>
	</thead>
	<tbody>
	    <tr>
	    	<td rowspan="2" class="t-center">계좌</td>
	    	<td rowspan="2" class="t-center"><div id="ibkttBankCnt"></div> </td>
	    	<td></td>
	    	<td>입금(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibkaccInCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>출금(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibkaccOutCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	    <tr>
	    	<td rowspan="3" class="t-center">법인카드</td>
	    	<td rowspan="3" class="t-center"><div id="ibkttCardCnt"></div></td>
	    	<td></td>
	    	<td>승인(D-2)</td>
	    	<td class="date-d-2"></td>
	    	<td class="t-center"><div id="ibkcardApprcnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>청구(D)</td>
	    	<td class="date-d"></td>
	    	<td class="t-center"><div id="ibkcartBillCnt"></div></td>
	    	<td></td>
	    	<td>전월 청구 전체</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>한도(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibkcardLimitCnt"></div></td>
	    	<td></td>
	    	<td>등록일자 기준</td>
	    </tr>
	     <tr>
	    	<td rowspan="3" class="t-center">카드매출(가맹점)</td>
	    	<td rowspan="3" class="t-center"><div id="ibkttCardSaleCnt"></div></td>
	    	<td></td>
	    	<td>입금(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibksaleHstReceCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>매입(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibksaleHstPurcCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>승인(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibksaleHstApprCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	    <tr>
	    	<td rowspan="4" class="t-center">전자세금계산서</td>
	    	<td rowspan="4" class="t-center"><div id="ibkttEtaxCnt"></div></td>
	    	<td></td>
	    	<td>매입(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibksearchGuhunA"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>매입_면세(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibksearchGuhunB"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>매출(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibksearchGuhunC"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>매출_면세(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibksearchGuhunD"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>
	    	<td rowspan="2" class="t-center">현금영수증</td>
	    	<td rowspan="2" class="t-center"><div id="ibkttCashCnt"></div></td>
	    	<td></td>
	    	<td>매입(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibkcashRcpPurcCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>매출(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibkcashRcpSaleCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>
	    	<td rowspan="5" class="t-center">개인카드</td>
	    	<td rowspan="5" class="t-center"><div id="ibkttPsnCardCnt"></div></td>
	    	<td></td>
	    	<td>승인(D-2)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibkpsnCardApprCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>청구(D)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibkpsnCardBillCnt"></div></td>
	    	<td></td>
	    	<td>전월 청구 전체</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>한도(D-1)</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibkpsnCardLimitCnt"></div></td>
	    	<td></td>
	    	<td></td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>결제일</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibkpsnCardPaymentDateCnt"></div></td>
	    	<td></td>
	    	<td>전체</td>
	    </tr>
	     <tr>	    	
	    	<td></td>
	    	<td>카드목록</td>
	    	<td class="date-d-1"></td>
	    	<td class="t-center"><div id="ibkpsnCardListCnt"></div></td>
	    	<td></td>
	    	<td>전체</td>
	    </tr>
	</tbody>
</table>
</div>

</body>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="/ScrappingServerResult/static/js/common.js"></script>
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

function dateFormatter(dt,num){
	var yy = dt.substr(0,4);
	var mm = dt.substr(4,2);
	var dd = dt.substr(6,2);
	var pad= "00";
	if(num != null){
		dd = parseInt(dd) + parseInt(num);
		dd = pad.substr(0,pad.length - dd.toString().length) + dd;
	}
	return yy+'-'+mm+'-'+dd;
	
}
	

$(document).ready(function(){
	$("#chdl-dt").datepicker({
		changeMonth:true,
		changeYear:true,
		monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames : ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort : ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
		yearRange:'2009:2020',
		dateFormat:'yy-mm-dd',
		setDate: 'today',
		defaultDate: new Date(),
		maxDate: new Date
	});
	$('#chdl-dt').datepicker("setDate", new Date);
	$("#btn-search").click(function(){
		$("#no-dataView").css("display","block");
		$(".tab").css("display","none");
		$("#sugum_baksa").css("display","none");
		 $.ajax({
		        url: '/ScrappingServerResult/selectScrapingInformation',
		        headers: {
		            "Accept": "application/json",
		            "Content-Type": "application/json"
		        },
		        type: "GET",
		        dataType: "json",
		        data: {"date":$("#chdl-dt").val().replace(/\-/g,'')},
		        contentType: 'application/json',
		        success: function(html) {	
		          
		           if (html.length > 0){
		        	   $(".tab").css("display","block");
		        	   $("#sugum_baksa").css("display","block");
		        	   $("#no-dataView").css("display","none");      	   
		        	   $(".date-d-1").text(dateFormatter(html[0].dateReport,-1));
		        	   $(".date-d-2").text(dateFormatter(html[0].dateReport,-2));
		        	   $(".date-d").text(dateFormatter(html[0].dateReport));
		        	   for(var i=0; i<html.length ;i++){
		        		   console.log(html[i].sts)
		        		   if (html[i].sts == 0){
		        				 $("#sugumaccInCnt").text(html[i].accInCnt);
		        				 $("#sugumaccOutCnt").text(html[i].accOutCnt);
		        				 $("#sugumcardApprcnt").text(html[i].cardApprcnt);
		        				 $("#sugumcartBillCnt").text(html[i].cartBillCnt);
		        				 $("#sugumcardLimitCnt").text(html[i].cardLimitCnt);
		        				 $("#sugumsaleHstReceCnt").text(html[i].saleHstReceCnt);
		        				 $("#sugumsaleHstPurcCnt").text(html[i].saleHstPurcCnt);
		        				 $("#sugumsaleHstApprCnt").text(html[i].saleHstApprCnt);
		        				 $("#sugumsearchGuhunA").text(html[i].searchGuhunA);
		        				 $("#sugumsearchGuhunB").text(html[i].searchGuhunB);
		        				 $("#sugumsearchGuhunC").text(html[i].searchGuhunC);
		        				 $("#sugumsearchGuhunD").text(html[i].searchGuhunD);
		        				 $("#sugumcashRcpPurcCnt").text(html[i].cashRcpPurcCnt);
		        				 $("#sugumcashRcpSaleCnt").text(html[i].cashRcpSaleCnt);
		        				 $("#sugumpsnCardApprCnt").text(html[i].psnCardApprCnt);
		        				 $("#sugumpsnCardBillCnt").text(html[i].psnCardBillCnt);
		        				 $("#sugumpsnCardLimitCnt").text(html[i].psnCardLimitCnt);
		        				 $("#sugumpsnCardPaymentDateCnt").text(html[i].psnCardPaymentDateCnt);
		        				 $("#sugumpsnCardListCnt").text(html[i].psnCardListCnt);
		        				 $("#sugumttBankCnt").text(html[i].ttBankCnt);
		        				 $("#sugumttCardCnt").text(html[i].ttCardCnt);
		        				 $("#sugumttCardSaleCnt").text(html[i].ttCardSaleCnt);
		        				 $("#sugumttEtaxCnt").text(html[i].ttEtaxCnt);
		        				 $("#sugumttCashCnt").text(html[i].ttCashCnt);
		        				 $("#sugumttPsnCardCnt").text(html[i].ttPsnCardCnt);
		        		   }
		        		   if (html[i].sts == 1){
		        				 $("#chaungaccInCnt").text(html[i].accInCnt);
		        				 $("#chaungaccOutCnt").text(html[i].accOutCnt);
		        				 $("#chaungcardApprcnt").text(html[i].cardApprcnt);
		        				 $("#chaungcartBillCnt").text(html[i].cartBillCnt);
		        				 $("#chaungcardLimitCnt").text(html[i].cardLimitCnt);
		        				 $("#chaungsaleHstReceCnt").text(html[i].saleHstReceCnt);
		        				 $("#chaungsaleHstPurcCnt").text(html[i].saleHstPurcCnt);
		        				 $("#chaungsaleHstApprCnt").text(html[i].saleHstApprCnt);
		        				 $("#chaungsearchGuhunA").text(html[i].searchGuhunA);
		        				 $("#chaungsearchGuhunB").text(html[i].searchGuhunB);
		        				 $("#chaungsearchGuhunC").text(html[i].searchGuhunC);
		        				 $("#chaungsearchGuhunD").text(html[i].searchGuhunD);
		        				 $("#chaungcashRcpPurcCnt").text(html[i].cashRcpPurcCnt);
		        				 $("#chaungcashRcpSaleCnt").text(html[i].cashRcpSaleCnt);
		        				 $("#chaungpsnCardApprCnt").text(html[i].psnCardApprCnt);
		        				 $("#chaungpsnCardBillCnt").text(html[i].psnCardBillCnt);
		        				 $("#chaungpsnCardLimitCnt").text(html[i].psnCardLimitCnt);
		        				 $("#chaungpsnCardPaymentDateCnt").text(html[i].psnCardPaymentDateCnt);
		        				 $("#chaungpsnCardListCnt").text(html[i].psnCardListCnt);
		        				 $("#chaungttBankCnt").text(html[i].ttBankCnt);
		        				 $("#chaungttCardCnt").text(html[i].ttCardCnt);
		        				 $("#chaungttCardSaleCnt").text(html[i].ttCardSaleCnt);
		        				 $("#chaungttEtaxCnt").text(html[i].ttEtaxCnt);
		        				 $("#chaungttCashCnt").text(html[i].ttCashCnt);
		        				 $("#chaungttPsnCardCnt").text(html[i].ttPsnCardCnt);
		        		   }
		        		   if (html[i].sts == 2){
		        				 $("#ibkaccInCnt").text(html[i].accInCnt);
		        				 $("#ibkaccOutCnt").text(html[i].accOutCnt);
		        				 $("#ibkcardApprcnt").text(html[i].cardApprcnt);
		        				 $("#ibkcartBillCnt").text(html[i].cartBillCnt);
		        				 $("#ibkcardLimitCnt").text(html[i].cardLimitCnt);
		        				 $("#ibksaleHstReceCnt").text(html[i].saleHstReceCnt);
		        				 $("#ibksaleHstPurcCnt").text(html[i].saleHstPurcCnt);
		        				 $("#ibksaleHstApprCnt").text(html[i].saleHstApprCnt);
		        				 $("#ibksearchGuhunA").text(html[i].searchGuhunA);
		        				 $("#ibksearchGuhunB").text(html[i].searchGuhunB);
		        				 $("#ibksearchGuhunC").text(html[i].searchGuhunC);
		        				 $("#ibksearchGuhunD").text(html[i].searchGuhunD);
		        				 $("#ibkcashRcpPurcCnt").text(html[i].cashRcpPurcCnt);
		        				 $("#ibkcashRcpSaleCnt").text(html[i].cashRcpSaleCnt);
		        				 $("#ibkpsnCardApprCnt").text(html[i].psnCardApprCnt);
		        				 $("#ibkpsnCardBillCnt").text(html[i].psnCardBillCnt);
		        				 $("#ibkpsnCardLimitCnt").text(html[i].psnCardLimitCnt);
		        				 $("#ibkpsnCardPaymentDateCnt").text(html[i].psnCardPaymentDateCnt);
		        				 $("#ibkpsnCardListCnt").text(html[i].psnCardListCnt);
		        				 $("#ibkttBankCnt").text(html[i].ttBankCnt);
		        				 $("#ibkttCardCnt").text(html[i].ttCardCnt);
		        				 $("#ibkttCardSaleCnt").text(html[i].ttCardSaleCnt);
		        				 $("#ibkttEtaxCnt").text(html[i].ttEtaxCnt);
		        				 $("#ibkttCashCnt").text(html[i].ttCashCnt);
		        				 $("#ibkttPsnCardCnt").text(html[i].ttPsnCardCnt);
		        		   }
		        	   }
		           }
		        }
		    }); 
	});
	$('#btn-exportExcel').click(function(){
		$("form[name='form1']").submit();
	});
	
});


</script>
</html>