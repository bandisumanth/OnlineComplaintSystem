package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.connectionsss.New_connection;

import modal.User;
import modal.UserLoginModel;

public class Userdao {

	public static boolean registerUser(User user) {

		try {

			Connection cn = New_connection.getconnection();

			String query = "INSERT INTO users(username,password,phone,email) VALUES(?,?,?,?)";

			PreparedStatement ps = cn.prepareStatement(query);

			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getPhone());
			ps.setString(4, user.getEmail());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				return true;
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return false;
	}

	public String selectUserByUsername(UserLoginModel user) {

		String status = "fail";

		try {

			PreparedStatement ps = New_connection.getconnection()
					.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");

			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());

			ResultSet rs = ps.executeQuery();

			int count = 0;

			while (rs.next()) {
				count++;
				user.setRole(rs.getString("role")); // getting role from DB
			}

			if (count > 0) {
				status = "sucess";
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}

}
