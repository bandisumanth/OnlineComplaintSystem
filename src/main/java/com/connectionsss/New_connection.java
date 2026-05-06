package com.connectionsss;

import java.sql.Connection;
import java.sql.DriverManager;

public class New_connection {
	public static Connection getconnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/localissues", "root", "root");
			return cn;

//		return null;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

	

}
