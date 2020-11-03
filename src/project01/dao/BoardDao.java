package project01.dao;

import java.util.List;

import project01.dto.Board;

public interface BoardDao {
	List<Board> selectBoardByAll();
	
	int insertBoard(Board board);
	
	Board selectBoardByNum(int num);
	
	void updateReadCount(int num);
	
	Board checkPassword(int num, String pass);
	
	int updateBoard(Board board);
	
	int deleteBoard(int num);
}
