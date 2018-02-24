package com.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import com.database.DAO;
import com.model.Module;

public class Performance {
	private int staffId, moduleId, projectId;
	
	private double Performance;

	DAO dao = new DAO();
	public int getStaffId() {
		return staffId;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
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
	public double getPerformance() {
		return Performance;
	}
	public void setPerformance(double performance) {
		Performance = performance;
	}

	public boolean checkIfModuleUpdateExists(int staffId, int moduleId)
	{
		try {
			String query0 = "select * from module_performance where module_id = '"+moduleId+"' and staff_id = '"+staffId+"' ";
			System.out.println(query0);
			ResultSet res = dao.getData(query0);
			if(res.next())
				return true;
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	//calculate performance
	public void putModulePerformance(int staffId, int moduleId ) {
		try {
			System.out.println("control inside putProjectPerformance");
			int requiredDays = 0, totalDays = 0;
			double stars = 0, pValue = 0;

			Module module = new Module();
			//getting the required days to completed
			ResultSet rdays = module.viewModulesById(moduleId);
			if(rdays.next()) {
				requiredDays = rdays.getInt("module_time_required");
			}


			//getting total days taken to complete module
			String query2 ="select datediff (module_completed_time, module_assigned_time) as days from modules_assignment where module_id='"+moduleId+"' and staff_id='"+staffId+"'";
			System.out.println(query2);
			ResultSet tdays = dao.getData(query2);
			if(tdays.next()) {
				totalDays = tdays.getInt("days");
			}

			System.out.println("total days: " + totalDays);
			System.out.println("required days: " + requiredDays);
			int days = requiredDays - totalDays;
			System.out.println("days: " + days);

			pValue = (double)days/requiredDays;
			stars = 4.0 + (pValue*2);
			stars = stars>5?5:stars;
			stars = stars<0?0:stars;
			System.out.println("star ratings: " + stars);

			boolean check = checkIfModuleUpdateExists(staffId, moduleId);
			System.out.println("check value: " + check);

			if(check==true) {
				System.out.println("module already updated!!!");
				String  query3 = "update module_performance set performance='"+stars+"' where staff_id = '"+staffId+"' and module_id = '"+moduleId+"'";
				System.out.println(query3);		
				int res = dao.putData(query3);
			}
			else
			{
				System.out.println("inside else part in performance");
				String  query3 = "insert into module_performance (staff_id, module_id, performance) values ('"+staffId+"', '"+moduleId+"', '"+stars+"')";
				System.out.println(query3);		
				int res = dao.putData(query3);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean checkIfProjectUpdateExists(int staffId, int projectId)
	{
		try {
			String query0 = "select * from project_performance where project_id = '"+projectId+"' and staff_id = '"+staffId+"' ";
			System.out.println(query0);
			ResultSet res = dao.getData(query0);
			if(res.next())
				return true;
			else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public void putProjectPerformance(int staffId, int projectId ) {
		try {
			System.out.println("control inside putProjectPerformance");
			int requiredDays = 0, totalDays = 0;
			double stars = 0, pValue = 0;

			Project project = new Project();
			//getting the required days to completed
			ResultSet rdays = project.viewProjectsById(projectId);
			if(rdays.next()) {
				requiredDays = rdays.getInt("project_time_required");
			}


			//getting total days taken to complete module
			String query2 ="select datediff (project_completed_time, project_assigned_time) as days from project_assignment where project_id='"+projectId+"' and staff_id='"+staffId+"'";
			System.out.println(query2);
			ResultSet tdays = dao.getData(query2);
			if(tdays.next()) {
				totalDays = tdays.getInt("days");
			}

			System.out.println("total days: " + totalDays);
			System.out.println("required days: " + requiredDays);
			int days = requiredDays - totalDays;
			System.out.println("days: " + days);

			pValue = (double)days/requiredDays;
			stars = 4.0 + (pValue*2);
			stars = stars>5?5:stars;
			stars = stars<0?0:stars;
			System.out.println("star ratings: " + stars);

			boolean check = checkIfProjectUpdateExists(staffId, projectId);
			System.out.println("check value: " + check);

			if(check==true) {
				System.out.println("project already updated!!!");
				String  query3 = "update project_performance set performance='"+stars+"' where staff_id = '"+staffId+"' and project_id = '"+projectId+"'";
				System.out.println(query3);		
				int res = dao.putData(query3);
			}
			else
			{
				System.out.println("inside esle part in performance");
				String  query3 = "insert into project_performance (staff_id, project_id, performance) values ('"+staffId+"', '"+projectId+"', '"+stars+"')";
				System.out.println(query3);		
				int res = dao.putData(query3);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ResultSet showModulePerformance() {
		String query = "select staff.staff_id, staff.staff_name, module_performance.module_id, module_performance.performance FROM module_performance inner join staff on module_performance.staff_id = staff.staff_id ORDER BY module_performance.performance DESC";
		System.out.println(query);
		ResultSet res = dao.getData(query);
		return res;
	}
	
	public ResultSet showMemberPerformance() {
		String query = "select staff_id,(select staff_name from staff where staff.staff_id= module_performance.staff_id) as staff_name, avg(performance)as avg from module_performance group by staff_id";
		ResultSet res = dao.getData(query);
		return res;
	}
	
	public ResultSet showProjectPerformance() {
		String query = "select staff.staff_id, staff.staff_name, project_performance.project_id, project_performance.performance FROM project_performance inner join staff on project_performance.staff_id = staff.staff_id ORDER BY project_performance.performance DESC";
		System.out.println(query);
		ResultSet res = dao.getData(query);
		return res;
	}
	
	public ResultSet showLeadPerformance() {
		String query = "select staff_id,(select staff_name from staff where staff.staff_id= project_performance.staff_id) as staff_name, avg(performance)as avg from project_performance group by staff_id";
		ResultSet res = dao.getData(query);
		return res;
	}
}
