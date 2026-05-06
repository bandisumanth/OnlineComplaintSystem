package com.dao;

import java.util.List;

import modal.Complaint;

public interface Dao_interfaces {
	public boolean submitComplaint(Complaint c);

	public List<Complaint> getComplaintsByUsername(String username);

	public List<Complaint> getAllComplaints();

	public int getCountByStatus(String status);

	public int getTotalComplaints();

	public List<Complaint> getComplaintsByStatus(String status);

	public boolean updateComplaintStatus(int id, String status);
}
