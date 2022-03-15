package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;

public class BoardUpdateService implements IBoardService {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDAO boarddao = BoardDAO.getInstance();
		
		String title =  request.getParameter("title");
		String content = request.getParameter("content");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		boarddao.updateBoard(board_num, title, content);
	}
}
