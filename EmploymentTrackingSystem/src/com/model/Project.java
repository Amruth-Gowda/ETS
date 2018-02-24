package com.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.database.DAO;

public class Project {
	private int projectId;

	private String projectName, projectDesc, projectTimeRequired, completionStatus;

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	
	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectDesc() {
		return projectDesc;
	}

	public void setProjectDesc(String projectDesc) {
		this.projectDesc = projectDesc;
	}

	public String getProjectTimeRequired() {
		return projectTimeRequired;
	}

	public void setProjectTimeRequired(String projectTimeRequired) {
		this.projectTimeRequired = projectTimeRequired;
	}
	
	public String getCompletionStatus() {
		return completionStatus;
	}

	public void setCompletionStatus(String completionStatus) {
		this.completionStatus = completionStatus;
	}
	
	DAO dao = new DAO();
	
	public int createProject()
	{
		String query = "insert into projects (project_name, project_desc, project_time_required) "
				+ "values('"+projectName+"','"+projectDesc+"','"+projectTimeRequired+"')";
		System.out.println(query);
		int result = dao.putData(query);
		if(result == 1)return 1;
		else return 0;
	}
	
	public ResultSet viewProjects()
	{
		String query = "select * from projects";
		System.out.println(query);
		ResultSet result = dao.getData(query);
		return result;
	}
	
	public ResultSet viewProjectsById(int id)
	{
		String query = "select * from projects where project_id ='"+id+"' ";
		System.out.println(query);
		ResultSet result = dao.getData(query);
		return result;
	}
	
	public ResultSet viewAssignedProjects(String emailId)
	{
		Staff staff = new Staff();
		ResultSet res = staff.getStaffDetailsName(emailId);
		try {
			if(res.next())
			{
				int teamLeadId = res.getInt("staff_id");
				String query = "select * from project_assignment inner join projects on project_assignment.project_id = projects.project_id where staff_id = '"+teamLeadId+"'";
				System.out.println(query);
				ResultSet result = dao.getData(query);
				return result;
			}
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
	public int updateProject()
	{
		String query = "update projects set project_status='"+completionStatus+"' where project_id = '"+projectId+"'";
		System.out.println(query);
		DAO dao = new DAO();
		int result = dao.putData(query);
		if(result==1) return 1;
		else return 0;
	}
	
	public int insertTime(int projectId)
	{
		String query = "update project_assignment set project_completed_time=current_timestamp where project_id= '"+projectId+"'";
		System.out.println(query);
		int res = dao.putData(query);
		if(res!=0)
			return 1;
		else
			return 0;
	}
}
