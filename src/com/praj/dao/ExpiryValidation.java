package com.praj.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class ExpiryValidation {
	
	public long ValidateExpDate(String doe)
	{
	  long diffDays=0;
	  try
		{
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = Calendar.getInstance().getTime();
		String curdate=formatter.format(date);
		Date cd=formatter.parse(curdate);
		
		Date ed=formatter.parse(doe);
		
		long diff = ed.getTime()-cd.getTime();
		
		diffDays=diff/(24*60*60*1000);
		//System.out.println(diff);
		//System.out.println(diffDays);
		}
		
	  catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return diffDays;
		
		
	}
}


