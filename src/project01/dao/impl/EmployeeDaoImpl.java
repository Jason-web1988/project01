package project01.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project01.dao.EmployeeDao;
import project01.ds.JndiDS;
import project01.dto.Department;
import project01.dto.Employee;

public class EmployeeDaoImpl implements EmployeeDao {
	private static final EmployeeDaoImpl instance = new EmployeeDaoImpl();
	
	public EmployeeDaoImpl() {
	}

	public static EmployeeDaoImpl getInstance() {
		return instance;
	}

	@Override
	public List<Department> selectEmployeeByAll() {
		String sql=" SELECT EMP_NO, EMP_NAME, TNO, MANAGEr, SALARY , DNO , REGDATE,\r\n" + 
				" 	EMAIL, TEL, PIC_URL, TITLE_NAME, DEPT_NAME, MANAGER_NAME\r\n" + 
				" 	FROM VW_EMPLOYEE_JOIN ";
		try(Connection con = JndiDS.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
			if(rs.next()) {
				ArrayList<Employee> list = new ArrayList<>();
				do {
					list.add(getEmployee(rs));
				}while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	private Employee getEmployee(ResultSet rs) {
		// TODO Auto-generated method stub
		return null;
	}

}
