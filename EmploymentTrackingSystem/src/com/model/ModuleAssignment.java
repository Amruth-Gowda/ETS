package com.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.database.DAO;

public class ModuleAssignment {
	private int moduleId,teamMemberId;

	public int getModuleId() {
		return moduleId;
	}

	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}

	public int getTeamMemberId() {
		return teamMemberId;
	}

	public void setTeamMemberId(int teamMemberId) {
		this.teamMemberId = teamMemberId;
	}
	
	DAO dao = new DAO();
	
	public int assignModule()
	{
		
		String query2 = "select * from modules_assignment where module_id = '"+moduleId+"' and staff_id = '"+teamMemberId+"'";
		System.out.println(query2);
		ResultSet rs = dao.getData(query2);
		try {
			while(rs.next())
			{
				if(rs.getInt("module_id") == moduleId && rs.getInt("staff_id") == teamMemberId)
				{
					return -1;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String query = "insert into modules_assignment (module_id, staff_id) values('"+moduleId+"','"+teamMemberId+"')";
		System.out.println(query);
		int res = dao.putData(query);
		if(res==1) return 1;
		else return 0;
	}
	
}
