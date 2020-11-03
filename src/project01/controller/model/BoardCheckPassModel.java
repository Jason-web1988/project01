package project01.controller.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project01.controller.Command;
import project01.dto.Board;
import project01.service.BoardService;

public class BoardCheckPassModel implements Command {
	private BoardService service = new BoardService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = null;
		int num = Integer.parseInt(request.getParameter("num").trim());
		String pass = request.getParameter("pass").trim();

		System.out.println("num >> " + num + ", " + "pass >> " + pass);

		Board board = service.checkPasswd(num, pass);

		System.out.println("Board >> " + board);

		if (board == null) {
			url = "board/boardCheckPass.jsp";
			request.setAttribute("message", "비밀번호가 틀렸습니다.");
		} else if (board.getPass().equals(pass)) {
			url = "board/checkSuccess.jsp";
		}
		return url;

	}
}
