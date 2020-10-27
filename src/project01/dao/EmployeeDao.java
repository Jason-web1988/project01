package project01.dao;

import java.util.List;

import project01.dto.Department;

public interface EmployeeDao {
	List<Department> selectEmployeeByAll();
}
