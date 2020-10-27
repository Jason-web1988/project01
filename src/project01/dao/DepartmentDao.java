package project01.dao;

import java.util.List;

import project01.dto.Department;

public interface DepartmentDao {
	List<Department> selectDepartmentByAll();
	
	int getNextNo();
	
	int insertDepartment(Department dept);
	
	Department selectDepartmentByNo(Department dept);
	
	int deleteDepartmnet(Department dept);
	
	int updateDepartment(Department dept);

}
