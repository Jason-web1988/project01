package project01.model;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import project01.dto.Employee;
import project01.service.EmpService;

@WebServlet("/LoginHandler")
public class LoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmpService service;

	public void init(ServletConfig config) throws ServletException {
		service = new EmpService();
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
		}else {
			System.out.println("POST");
			/*
			 * int empNo = Integer.parseInt(request.getParameter("empNo")); String passwd =
			 * request.getParameter("passwd"); Employee emp = new Employee();
			 * emp.setEmpNo(empNo); emp.setPasswd(passwd);
			 */
			
			Gson gson = new Gson();
			Employee result = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), Employee.class);
			System.out.println(result);
			
			
			
			Boolean res = service.checkLogin(result);
			System.out.println(res);
			if(res) {
				HttpSession session = request.getSession();
				session.setAttribute("login", result.getEmpNo());
				
				response.getWriter().print(true);
//				response.sendRedirect("index.jsp");
			}else {
//				Integer ress = null;
				
			}
		}	
		
	}

}
