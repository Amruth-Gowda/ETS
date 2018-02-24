package com.control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Admin;
import com.model.Staff;

@WebServlet("/LoginControl")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		String entered_email = request.getParameter("email");
		String entered_password = request.getParameter("password");

		if (Admin.isAdmin(entered_email, entered_password)) {
			System.out.println("Redirecting to admin");
			response.sendRedirect("admin_home.jsp");
		}

		else if (Staff.isStaff(entered_email, entered_password)) {
			if (Staff.checkDesignation(entered_email, entered_password).toString().equals("teammember")) {
				System.out.println("inside teammember");
				request.getSession().setAttribute("entered_email", entered_email);
				response.sendRedirect("team_member_home.jsp");
			} else if (Staff.checkDesignation(entered_email, entered_password).toString().equals("teamlead")) {
				System.out.println("inside teamlead");
				request.getSession().setAttribute("entered_email", entered_email);
				response.sendRedirect("team_lead_home.jsp");
			} else if (Staff.checkDesignation(entered_email, entered_password).toString().equals("manager")) {
				System.out.println("inside manager");
				request.getSession().setAttribute("entered_email", entered_email);
				response.sendRedirect("manager_home.jsp");
			} else {
				PrintWriter printWriter = response.getWriter();
				printWriter.println("<html><script type='text/javascript'>alert('invalid email/password'); "
						+ "window.location.href='index.jsp';</script></html>");
			}
		}

		else {
			PrintWriter printWriter = response.getWriter();
			printWriter.println("<html><script type='text/javascript'>alert('invalid email/password'); "
					+ "window.location.href='index.jsp';</script></html>");
		}
	}
}
