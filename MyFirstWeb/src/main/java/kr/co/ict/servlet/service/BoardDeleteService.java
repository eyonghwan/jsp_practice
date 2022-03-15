package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;

public class BoardDeleteService implements IBoardService{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		BoardDAO boarddao = BoardDAO.getInstance();
		
		boarddao.deleteBoard(board_num);
		
	}
}
