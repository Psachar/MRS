package com.praj.dao;

import java.util.Calendar;

public class AgeCalculator {
	
	
	//import java.util.Calendar;

		
		public static int calculateAge(int Byear)
		   {
			int age=0;
			try
			{
				Calendar cal=Calendar.getInstance();
				// TODO Auto-generated method stub
				int yr=cal.get(Calendar.YEAR);
				age=yr-Byear;
		    }
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			return age;
		   }
	}



