package com.model;

import java.sql.ResultSet;

import com.database.DAO;

public class Admin {
	private String username,password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public static boolean isAdmin(String email, String password)
	{
		boolean flag=false;
		try 
		{
			DAO dao = new DAO();
			String query = "select * from admin where admin_email = '"+email+"' and admin_password = '"+password+"'";
			System.out.println(query);
			ResultSet res = dao.getData(query); 
            if(res.next())
                flag = true;  
		}
		catch(Exception e){e.printStackTrace();}
		return flag;
	}

}
