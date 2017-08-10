package com.java.scrapserver.result.utils;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

import org.apache.poi.ss.usermodel.DateUtil;

public class Common {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	public Long excellReturnLongValue(String value){
		try{
			Long val = Double.valueOf(value).longValue();
			return val;
		}catch(Exception e){
			return new Long(0);
		}
		
	}
	
	public String excelReturnDateValue(Date value) throws ParseException{
		return sdf.format(value).toString();
	}

	public String excelReturnDateValue(Date value, int num){
		Calendar cal = Calendar.getInstance();
		cal.setTime(value);
		cal.add(cal.DAY_OF_YEAR,num);
		Date dt = new Date(cal.getTimeInMillis());
		return sdf.format(dt).toString();
	}
	public String strToDateFormat(String str,int num){
		try{
			SimpleDateFormat ff = new SimpleDateFormat("yyyyMMdd");
			Date dt = ff.parse(str);
			if (num != 0){
				return excelReturnDateValue(dt, num);
			}
			return sdf.format(dt);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "";
	}
}
