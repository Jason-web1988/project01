package project01.controller.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project01.controller.Command;
import project01.dto.Board;
import project01.service.BoardService;

public class BoardCheckPassFormModel implements Command {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return "board/boardCheckPass.jsp";
	}

}
