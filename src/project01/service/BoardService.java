package project01.service;

import java.sql.Connection;
import java.util.List;

import project01.dao.impl.BoardDaoImpl;
import project01.ds.JndiDS;
import project01.dto.Board;

public class BoardService {
	private BoardDaoImpl dao = BoardDaoImpl.getInstance();
	private Connection con = JndiDS.getConnection();

	public BoardService() {
		dao.setCon(con);
	}
	
	public List<Board> getBoards(){
		return dao.selectBoardByAll();
	}
	
	public int addBoard(Board board){
		return dao.insertBoard(board);
	}
	
	public Board getBoard(int num) {
		return dao.selectBoardByNum(num);
	}
	
	public void updateReadCount(int num) {
		dao.updateReadCount(num);
	}
	
	public Board checkPasswd(int num, String pass) {
		return dao.checkPassword(num, pass);
	}
	
	public int modifyBoard(Board board) {
		return dao.updateBoard(board);
	}
	
	public int removeBoard(int num) {
		return dao.deleteBoard(num);
	}
}
