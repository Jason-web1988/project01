package project01.controller.model;

import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import project01.controller.Command;
import project01.dto.Board;
import project01.service.BoardService;

public class BoardWriteModel implements Command {
	private BoardService service = new BoardService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			System.out.println("GET");
			return "board/boardWrite.jsp";
		}else {
			Gson gson = new Gson();
			Board board = gson.fromJson(new InputStreamReader(request.getInputStream(), "UTF-8"), Board.class);
			System.out.println(board);
			
			int res = service.addBoard(board);
			response.getWriter().print(res);
			return null;
		}
		
	}

}
