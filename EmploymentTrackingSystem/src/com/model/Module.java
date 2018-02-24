package com.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.database.DAO;

public class Module {
	private int projectId,moduleId;
	

	private String moduleName, moduleDesc, moduleTimeRequired, completionStatus;

	public int getModuleId() {
		return moduleId;
	}

	public void setModuleId(int moduleId) {
		this.moduleId = moduleId;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getModuleDesc() {
		return moduleDesc;
	}

	public void setModuleDesc(String moduleDesc) {
		this.moduleDesc = moduleDesc;
	}

	public String getModuleTimeRequired() {
		return moduleTimeRequired;
	}

	public void setModuleTimeRequired(String moduleTimeRequired) {
		this.moduleTimeRequired = moduleTimeRequired;
	}

	public String getCompletionStatus() {
		return completionStatus;
	}

	public void setCompletionStatus(String completionStatus) {
		this.completionStatus = completionStatus;
	}


	DAO dao = new DAO();

	public int createModule() {
		String query = "insert into modules (project_id, module_name, module_desc, module_time_required) " + "values('"
				+ projectId + "','" + moduleName + "', '" + moduleDesc + "', '" + moduleTimeRequired + "')";
		System.out.println(query);
		int result = dao.putData(query);
		if (result == 1)
			return 1;
		else
			return 0;

	}
	
	public ResultSet viewModulesById(String emailId)
	{
		Staff staff = new Staff();
		ResultSet res = staff.getStaffDetailsName(emailId);
		try {
			if(res.next())
			{
				int teamMemeberId = res.getInt("staff_id");
				String query = "select * from modules_assignment inner join modules on modules_assignment.module_id = modules.module_id where staff_id = '"+teamMemeberId+"'";
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
	
	public ResultSet teamLeadModuleView(String emailId)
	{
		Staff staff = new Staff();
		ResultSet res = staff.getStaffDetailsName(emailId);
		try {
			if(res.next())
			{
				int teamLeadId = res.getInt("staff_id");
				String query = "SELECT * FROM  project_assignment INNER JOIN  modules ON project_assignment.project_id=modules.project_id WHERE staff_id = '"+teamLeadId+"'";
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
	
	public ResultSet viewModulesById(int id)
	{
		String query = "select * from modules where module_id ='"+id+"' ";
		System.out.println(query);
		ResultSet result = dao.getData(query);
		return result;
	}
	
	public ResultSet viewModules()
	{
		String query = "select * from modules";
		System.out.println(query);
		ResultSet result = dao.getData(query);
		return result;
	}
	
	public int updateModuele()
	{
		String query = "update modules set module_status='"+completionStatus+"' where module_id = '"+moduleId+"'";
		System.out.println(query);
		DAO dao = new DAO();
		int result = dao.putData(query);
		if(result==1) return 1;
		else return 0;
	}

	public int insertTime(int moduleId)
	{
		String query = "update modules_assignment set module_completed_time=current_timestamp where module_id= '"+moduleId+"'";
		System.out.println(query);
		int res = dao.putData(query);
		if(res!=0)
			return 1;
		else
			return 0;
	}
}
