package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.connectionsss.New_connection;

import modal.Complaint;

public class ComplaintDAO implements Dao_interfaces {

	public boolean submitComplaint(Complaint c) {

		boolean result = false;

		try {

			PreparedStatement ps = New_connection.getconnection().prepareStatement(
					"INSERT INTO complaints(username,title,category,description,location,status,image) VALUES(?,?,?,?,?,?,?)");

			ps.setString(1, c.getUsername());
			ps.setString(2, c.getTitle());
			ps.setString(3, c.getCategory());
			ps.setString(4, c.getDescription());
			ps.setString(5, c.getLocation());
			ps.setString(6, c.getStatus());
			ps.setString(7, c.getImage());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				result = true;
			}

		} catch (Exception e) {

			System.out.println(e);

		}

		return result;
	}

// for user to view their complaints
	public List<Complaint> getComplaintsByUsername(String username) {

		List<Complaint> list = new ArrayList<>();

		try {

			PreparedStatement ps = New_connection.getconnection()
					.prepareStatement("SELECT * FROM complaints WHERE username=?");

			ps.setString(1, username);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Complaint c = new Complaint();

				c.setId(rs.getInt("id"));
				c.setUsername(rs.getString("username"));
				c.setTitle(rs.getString("title"));
				c.setCategory(rs.getString("category"));
				c.setDescription(rs.getString("description"));
				c.setLocation(rs.getString("location"));
				c.setStatus(rs.getString("status"));
				c.setImage(rs.getString("image"));

				list.add(c);
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return list;
	}

// for admin to view all complaints
	public List<Complaint> getAllComplaints() {

		List<Complaint> list = new ArrayList<>();

		try {

			PreparedStatement ps = New_connection.getconnection().prepareStatement("SELECT * FROM complaints");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Complaint c = new Complaint();

				c.setId(rs.getInt("id"));
				c.setUsername(rs.getString("username"));
				c.setTitle(rs.getString("title"));
				c.setCategory(rs.getString("category"));
				c.setDescription(rs.getString("description"));
				c.setLocation(rs.getString("location"));
				c.setStatus(rs.getString("status"));
				c.setImage(rs.getString("image"));

				list.add(c);
			}

		} catch (Exception e) {

			System.out.println(e);

		}

		return list;
	}

// count of status for admin
	public int getCountByStatus(String status) {

		int count = 0;

		try {

			PreparedStatement ps = New_connection.getconnection()
					.prepareStatement("SELECT COUNT(*) FROM complaints WHERE status=?");

			ps.setString(1, status);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return count;
	}

	public int getTotalComplaints() {

		int total = 0;

		try {

			PreparedStatement ps = New_connection.getconnection().prepareStatement("SELECT COUNT(*) FROM complaints");

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				total = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return total;
	}

	public List<Complaint> getComplaintsByStatus(String status) {

		List<Complaint> list = new ArrayList<>();

		try {

			PreparedStatement ps;

			if (status == null || status.equals("All")) {

				ps = New_connection.getconnection().prepareStatement("SELECT * FROM complaints");

			} else {

				ps = New_connection.getconnection().prepareStatement("SELECT * FROM complaints WHERE status=?");

				ps.setString(1, status);
			}

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Complaint c = new Complaint();

				c.setId(rs.getInt("id"));
				c.setUsername(rs.getString("username"));
				c.setTitle(rs.getString("title"));
				c.setCategory(rs.getString("category"));
				c.setDescription(rs.getString("description"));
				c.setLocation(rs.getString("location"));
				c.setStatus(rs.getString("status"));
				c.setImage(rs.getString("image"));

				list.add(c);
			}

		} catch (Exception e) {

			System.out.println(e);

		}

		return list;
	}

	public boolean updateComplaintStatus(int id, String status) {

		boolean result = false;

		try {

			PreparedStatement ps = New_connection.getconnection()
					.prepareStatement("UPDATE complaints SET status=? WHERE id=?");

			ps.setString(1, status);
			ps.setInt(2, id);

			int rows = ps.executeUpdate();

			if (rows > 0) {
				result = true;
			}

		} catch (Exception e) {

			System.out.println(e);

		}

		return result;
	}

}