package project01.controller.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project01.controller.Command;
import project01.dto.Board;
import project01.service.BoardService;

public class BoardUpdateModel implements Command {
	private BoardService service = new BoardService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Board board = getBoard(request);
		int res = service.modifyBoard(board);
		System.out.println("board >> " + board + ", " + "res >>" + res);
		return "boardList.do";
	}

	private Board getBoard(HttpServletRequest request) {
		Board board = new Board();
		board.setNum(Integer.parseInt(request.getParameter("num").trim()));
		board.setName(request.getParameter("name").trim());
		board.setPass(request.getParameter("pass").trim());
		board.setEmail(request.getParameter("email").trim());
		board.setTitle(request.getParameter("title").trim());
		board.setContent(request.getParameter("content").trim());
		
		return board;
	}

}
