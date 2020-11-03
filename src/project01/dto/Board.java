package project01.dto;

import java.util.Date;

public class Board {
    private int num;
    private String name;
    private String email;
    private String pass;
    private String title;
    private String content;
    private int readCount;
    private Date writeDate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString() {
		return String.format(
				"Board [num=%s, name=%s, email=%s, pass=%s, title=%s, content=%s, readCount=%s, writeDate=%s]", num,
				name, email, pass, title, content, readCount, writeDate);
	}
    
    
}
