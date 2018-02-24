package com.model;

import java.sql.ResultSet;

import com.database.*;

public class Staff {
	
	private int id;
	private String   name, gender, dob, email, password, mobileNumber;
	
	private String address, designation;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	
	public int createStaff() {
		String query = "insert into staff (staff_name,staff_gender,staff_dob,staff_email,staff_password,staff_mobile_number,staff_address,staff_designation)"
				+ " values('"+name+"','"+gender+"', '"+dob+"','"+email+"','"+password+"','"+mobileNumber+"','"+address+"','"+designation+"')";
		System.out.println(query);
		DAO dao = new DAO();
		int result = dao.putData(query);
		if(result==1) return 1;
		else return 0;
		
	}
	public static boolean isStaff(String email, String password) {
		String query = "select staff_email,staff_password from staff where "
				+ "staff_email='"+email+"' and staff_password='"+password+"'";
		System.out.println(query);
		try
		{
			DAO dao = new DAO();
			ResultSet result = dao.getData(query);
			if(result.next())
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		catch (Exception e) 
		{
			System.out.println(e);
			return false;
		}	
	}
	
	public ResultSet getStaffDetails()
	{
		String query = "select * from staff";
		DAO dao = new DAO();
		try
		{
			
			ResultSet result = dao.getData(query);
			return result;
		}
		catch (Exception e) 
		{
			System.out.println(e);
			return null;
		}
	}
	public ResultSet getStaffDetailsById(int id)
	{
		String query = "select * from staff where staff_id ='"+id+"'";
		System.out.println(query);
		DAO dao = new DAO();
		try
		{
			
			ResultSet result = dao.getData(query);
			return result;
		}
		catch (Exception e) 
		{
			System.out.println(e);
			return null;
		}
	}
	
	public ResultSet getStaffDetailsName(String email)
	{
		String query = "select * from staff where staff_email= '"+email+"'";
		System.out.println(query);
		DAO dao = new DAO();
		try
		{
			ResultSet result = dao.getData(query);
			return result;
		}
		catch (Exception e) 
		{
			System.out.println(e);
			return null;
		}
	}
	
	public ResultSet getStaffDetailsByDesignation(String designation)
	{
		String query = "select * from staff where staff_designation= '"+designation+"'";
		System.out.println(query);
		DAO dao = new DAO();
		try
		{
			
			ResultSet result = dao.getData(query);
			return result;
		}
		catch (Exception e) 
		{
			System.out.println(e);
			return null;
		}
	}
	public static String checkDesignation(String email, String password) {
		String query = "select * from staff where "
				+ "staff_email='"+email+"' and staff_password='"+password+"'";
		try
		{
			DAO dao = new DAO();
			ResultSet result = dao.getData(query);
			if(result.next())
			{
				if(result.getString("staff_designation").toString().equals("teammember")==true)
				{
					String designation = "teammember";
					System.out.println("teammember");
					return designation;
				}
				if(result.getString("staff_designation").toString().equals("teamlead")==true)
				{
					String designation = "teamlead";
					System.out.println("teamlead");
					return designation;
				}
				if(result.getString("staff_designation").toString().equals("manager")==true)
				{
					String designation = "manager";
					System.out.println("manager");
					return designation;
				}	
			}
		}
		
		catch (Exception e) 
		{
			System.out.println(e);
			return "invalid";
		}
		return query;	
	}
	
	public int updateStaff() {
		String query = "update staff set staff_name ='"+name+"', staff_gender='"+gender+"'"
						+ ",staff_dob='"+dob+"',"
						+ "staff_email='"+email+"',"
						+ "staff_password='"+password+"',"
						+ "staff_mobile_number='"+mobileNumber+"',"
						+ "staff_address='"+address+"',"
						+ "staff_designation='"+designation+"' "
						+ "where staff_id='"+id+"'";
		
		System.out.println(query);
		DAO dao = new DAO();
		int result = dao.putData(query);
		if(result==1) return 1;
		else return 0;
		
	}
	
	public int deleteStaff() {
		String query = "delete from staff where staff_id='"+id+"'";
		System.out.println(query);
		DAO dao = new DAO();
		int result = dao.putData(query);
		if(result==1) return 1;
		else return 0;
		
	}

}	
