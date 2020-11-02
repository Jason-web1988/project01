package project01.service;

import java.util.List;

import project01.dao.EmployeeDao;
import project01.dao.impl.EmployeeDaoImpl;
import project01.dto.Department;
import project01.dto.Employee;

public class EmpService {
	private EmployeeDao dao = EmployeeDaoImpl.getInstance();
	
	public List<Employee> getEmpList(){
		return dao.selectEmployeeByAll();
	}
	
	public Employee getEmployee(Employee emp) {
		return dao.selectEmployeeByNo(emp);
	}
	
	public int modifyEmployee(Employee emp) {
		return dao.updateEmployee(emp);
	}
	
	public int removeEmployee(Employee emp) {
		return dao.deleteEmployee(emp);
	}
	
	public List<Employee> getManagerListByDno(Department dept){
		return dao.selectManagerByDno(dept);
	}
	
	public int duplicateEmpNo(int empNo) {
		return dao.idDupCheck(empNo);
	}
	
	public int addEmployee(Employee emp) {
		return dao.insertEmployee(emp);
	}
	
	public Boolean checkLogin(Employee emp) {
		return dao.selectLoginByEmpNo(emp);
	}
	
}
