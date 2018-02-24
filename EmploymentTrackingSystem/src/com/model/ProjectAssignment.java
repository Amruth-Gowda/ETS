package com.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.database.DAO;

public class ProjectAssignment {
	private int projectId,teamLeadId;

	public int getTeamLeadId() {
		return teamLeadId;
	}

	public void setTeamLeadId(int teamLeadId) {
		this.teamLeadId = teamLeadId;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	DAO dao = new DAO();
	
	public int assignProject()
	{
		String query2 = "select * from project_assignment where project_id = '"+projectId+"' and staff_id = '"+teamLeadId+"'";
		System.out.println(query2);
		ResultSet rs = dao.getData(query2);
		try {
			while(rs.next())
			{
				if(rs.getInt("project_id") == projectId && rs.getInt("staff_id") == teamLeadId)
				{
					return -1;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String query = "insert into project_assignment (project_id, staff_id) values('"+projectId+"','"+teamLeadId+"')";
		System.out.println(query);
		int res = dao.putData(query);
		if(res==1) return 1;
		else return 0;
	}
}
