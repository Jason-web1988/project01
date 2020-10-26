package project01.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project01.dao.TitleDao;
import project01.ds.JndiDS;
import project01.dto.Title;

public class TitleDaoImpl implements TitleDao {
	private static final TitleDaoImpl instance = new TitleDaoImpl();
	

	public TitleDaoImpl() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static TitleDaoImpl getInstance() {
		return instance;
	}


	@Override
	public List<Title> selectTitleByAll() {
		String sql = "SELECT TITLE_NO, TITLE_NAME FROM TITLE ";
		try(Connection con = JndiDS.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				ArrayList<Title> list = new ArrayList<Title>();
				do {
					list.add(getTitle(rs));
				}while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	private Title getTitle(ResultSet rs) throws SQLException {
		int titleNo = rs.getInt("TITLE_NO");
		String titleName = rs.getString("TITLE_NAME");
		return new Title(titleNo, titleName);
	}

	@Override
	public int getNextNo() {
		String sql="SELECT MAX(TITLE_NO)+1 FROM TITLE ";
		try(Connection con = JndiDS.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return 0;
	}

	@Override
	public int insertTitle(Title title) {
		String sql = "INSERT INTO TITLE VALUES(?, ?) ";
		try(Connection con = JndiDS.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, title.getTitleNo());
			pstmt.setString(2, title.getTitleName());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

}