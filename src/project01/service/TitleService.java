package project01.service;

import java.util.List;

import project01.dao.TitleDao;
import project01.dao.impl.TitleDaoImpl;
import project01.dto.Title;

public class TitleService {
	private TitleDao titleDao = TitleDaoImpl.getInstance();
	
	public List<Title> showTitles(){
		return titleDao.selectTitleByAll();
	}
	
	public int getNextNo() {
		return titleDao.getNextNo();
	}
	
	public int addTitle(Title title) {
		return titleDao.insertTitle(title);
	}
	
	public Title getTitle(Title title) {
		return titleDao.selectTitleByNo(title);
	}
	
	public int removeTitle(Title title) {
		return titleDao.deleteTitle(title);
	}
	
	public int modifyTitle(Title title) {
		return titleDao.updateTitle(title);
	}
}
