package project01.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import project01.dao.BoardDao;
import project01.dto.Board;

public class BoardDaoImpl implements BoardDao {
	private static final BoardDaoImpl instance = new BoardDaoImpl();
	private Connection con;

	public BoardDaoImpl() {}
	
	public static BoardDaoImpl getInstance() {
		return instance;
	}

	public void setCon(Connection con) {
		this.con = con;
	}

	@Override
	public List<Board> selectBoardByAll() {
		String sql = "SELECT NUM, PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE FROM BOARD ";
		try(PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				ArrayList<Board> list = new ArrayList<>();
				do {
					list.add(getBoard(rs));
				}while(rs.next());
				return list;
			}
			
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	private Board getBoard(ResultSet rs) throws SQLException {
		Board board = new Board();
		board.setNum(rs.getInt("NUM"));
		board.setPass(rs.getString("PASS"));
		board.setName(rs.getString("NAME"));
		board.setEmail(rs.getString("EMAIL"));
		board.setTitle(rs.getString("TITLE"));
		board.setContent(rs.getString("CONTENT"));
		board.setReadCount(rs.getInt("READCOUNT"));
		board.setWriteDate(rs.getTimestamp("WRITEDATE"));
		return board;
	}

	@Override
	public int insertBoard(Board board) {
		String sql="INSERT INTO BOARD(PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT) VALUES(?, ?, ?, ?, ?, ?) ";
		try(PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, board.getPass());
			pstmt.setString(2, board.getName());
			pstmt.setString(3, board.getEmail());
			pstmt.setString(4, board.getTitle());
			pstmt.setString(5, board.getContent());
			pstmt.setInt(6, board.getReadCount());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public Board selectBoardByNum(int num) {
		String sql ="SELECT NUM, PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE FROM BOARD WHERE NUM = ? ";
		try(PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, num);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return getBoard(rs);
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public void updateReadCount(int num) {
		String sql="UPDATE BOARD SET READCOUNT = READCOUNT +1 WHERE NUM = ?";
		try(PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, num);
			pstmt.executeQuery();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		
	}

	@Override
	public Board checkPassword(int num, String pass) {
		String sql="SELECT NUM, PASS, NAME, EMAIL, TITLE, CONTENT, READCOUNT, WRITEDATE FROM BOARD WHERE NUM = ? AND PASS = ? ";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, num);
			pstmt.setString(2, pass);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return getBoard(rs);
				}
			}
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
		return null;
	}

	@Override
	public int updateBoard(Board board) {
		String sql = "UPDATE BOARD SET PASS=?, NAME=?, EMAIL=?, TITLE=?, CONTENT=? WHERE NUM = ? ";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, board.getPass());
			pstmt.setString(2, board.getName());
			pstmt.setString(3, board.getEmail());
			pstmt.setString(4, board.getTitle());
			pstmt.setString(5, board.getContent());
			pstmt.setInt(6, board.getNum());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

	@Override
	public int deleteBoard(int num) {
		String sql="DELETE FROM BOARD WHERE NUM = ? ";
		try(PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, num);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new CustomSQLException(e);
		}
	}

}
