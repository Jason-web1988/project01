package project01.service;

import java.util.List;

import project01.dao.EmployeeDao;
import project01.dao.impl.EmployeeDaoImpl;
import project01.dto.Employee;

public class EmpService {
	private EmployeeDao dao = EmployeeDaoImpl.getInstance();
	
	public List<Employee> getEmpList(){
		return dao.selectEmployeeByAll();
	}
	
	public Employee getEmployee(Employee emp) {
		return dao.selectEmployeeByNo(emp);
	}
}
