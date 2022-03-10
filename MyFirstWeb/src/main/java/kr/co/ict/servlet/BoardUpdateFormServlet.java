package kr.co.ict.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.ict.BoardDAO;
import kr.co.ict.BoardVO;

/**
 * Servlet implementation class BoardUpdateFormServlet
 */
@WebServlet("/boardUpdateForm")
public class BoardUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. boarddetail.jsp에 목적지를 현재 서블릿으로 하고 post방식 정달을 하는 form과 submit버튼 "수정하기"를 만들어주세요
		// 2. dopost에서 실제로 수정하기를 눌렀을 때 반응이 있는지 체크해주세요.
		// 3. 해당 글번호에 저장된 정보로 수정페이지를 채워야 하니 글번호도 같이 넘겨지는지 체크해주세요.
		
		System.out.println("수정페이지 접근 성공");
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		System.out.println(board_num);
		
		BoardDAO boarddao = BoardDAO.getInstance();
		
		BoardVO boardData = boarddao.getBoardDetail(board_num);
		
		request.setAttribute("board", boardData);
		
		// 4. /board/boardlist.jsp로 포워딩하기
		RequestDispatcher dp = request.getRequestDispatcher(
				"/board/boardUpdateForm.jsp");
		dp.forward(request, response);
	}

}
