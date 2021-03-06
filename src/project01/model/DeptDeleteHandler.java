package project01.model;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project01.dto.Department;
import project01.service.DeptService;

@WebServlet("/DeptDeleteHandler")
public class DeptDeleteHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DeptService service;

	public void init(ServletConfig config) throws ServletException {
		service = new DeptService();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");
			int deptNo = Integer.parseInt(request.getParameter("deptNo").trim());
			int res = service.removeDepartment(new Department(deptNo));
			
			response.getWriter().print(res);
		}else {
			System.out.println("POST");
		}
		
	}

}
