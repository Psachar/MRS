package com.praj.dao;

public class TestJDBC {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
      DBConnection.dbCon();
      System.out.println("Connection successfully established"+ DBConnection.dbCon());
	}

}
