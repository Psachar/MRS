package com.praj.dao;

public class Rand {
	
	public String RandNo()
	   {
		
		
	    int i=1;
	    java.util.Random r = new java.util.Random();
		String str="MRS";
		while(i>0)
		{
			i=r.nextInt(100000);
			if(i>999)
			 break;
		}
		str=str+i;
		return (str);
	   }
}



