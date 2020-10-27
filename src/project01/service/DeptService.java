package project01.service;

import java.util.List;

import project01.dao.DepartmentDao;
import project01.dao.impl.DepartmentDaoImpl;
import project01.dto.Department;

public class DeptService {
	private DepartmentDao dao = DepartmentDaoImpl.getInstance();
	
	public List<Department> getDepartmentList(){
		return dao.selectDepartmentByAll();
	}
	
	public int getNextDeptno() {
		return dao.getNextNo();
	}
	
	public int addDepartment(Department dept) {
		return dao.insertDepartment(dept);
	}
	
	public Department getDepartment(Department dept) {
		return dao.selectDepartmentByNo(dept);
	}
	
	public int removeDepartment(Department dept) {
		return dao.deleteDepartmnet(dept);
	}
	
	public int modifyDepartment(Department dept) {
		return dao.updateDepartment(dept);
	}
	
}
