package project01.dao;

import java.util.List;

import project01.dto.Employee;

public interface EmployeeDao {
	List<Employee> selectEmployeeByAll();
	
	Employee selectEmployeeByNo(Employee emp);
	
	int updateEmployee(Employee emp);
}
