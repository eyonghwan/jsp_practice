package kr.co.ict.servlet.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.ict.BoardDAO;

public class BoardUpdateService implements IBoardService {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String writer = request.getParameter("writer");
		String sId = (String)session.getAttribute("session_id");
		
		if(sId.equals(writer)) {
			BoardDAO boarddao = BoardDAO.getInstance();
			
			String title =  request.getParameter("title");
			String content = request.getParameter("content");
			String strbNum = request.getParameter("board_num");
			int board_num = 0;
			if(strbNum != null) {
				board_num = Integer.parseInt(strbNum);
			}
			boarddao.updateBoard(board_num, title, content);
		}
	}
}
