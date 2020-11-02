package project01.dao;

import java.util.List;

import project01.dto.Department;
import project01.dto.Employee;

public interface EmployeeDao {
	List<Employee> selectEmployeeByAll();
	
	Employee selectEmployeeByNo(Employee emp);
	
	int updateEmployee(Employee emp);
	
	int deleteEmployee(Employee emp);
	
	List<Employee> selectManagerByDno(Department dept);
	
	int idDupCheck(int empNo);
	
	int insertEmployee(Employee emp);
	
	Boolean selectLoginByEmpNo(Employee emp);
}
