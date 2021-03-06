package project01.dao;


import java.util.List;

import project01.dto.Title;

public interface TitleDao {
	List<Title> selectTitleByAll();
	
	int getNextNo();
	
	int insertTitle(Title title);
	
	Title selectTitleByNo(Title title);
	
	int deleteTitle(Title title);
	
	int updateTitle(Title title);
}
