package com.praj.dao;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegistrValidate {
	
	private Pattern regexPattern;
	private Matcher regMatcher;
	
	public boolean CheckCt(String contact)
	{
		if (contact.matches("[0-9]+") && contact.length()==10)
			return true;
		else
			return false;
	}
	
	public boolean CheckEmail(String email)
	{
		 regexPattern = Pattern.compile("^[(a-zA-Z-0-9-\\_\\+\\.)]+@[(a-z-A-z)]+\\.[(a-zA-z)]{2,3}$");
		 regMatcher   = regexPattern.matcher(email);
		 
		 if(regMatcher.matches())
			 return true;
		 else
			 return false;
		 
	}

	public boolean CheckName(String fname,String lname)
	{
		if (fname.matches("[a-zA-Z]+") && lname.matches("[a-zA-Z]+"))
			return true;
		else
			return false;
	}
}



