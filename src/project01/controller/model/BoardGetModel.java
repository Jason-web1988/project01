package project01.controller.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project01.controller.Command;
import project01.dto.Board;
import project01.service.BoardService;

public class BoardGetModel implements Command {
	private BoardService service = new BoardService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num").trim());
		System.out.println("num >> " + num);
		Board board = service.getBoard(num);
		
		service.updateReadCount(num);
		
		request.setAttribute("board", board);
		
		return "board/boardView.jsp";
	}

}
