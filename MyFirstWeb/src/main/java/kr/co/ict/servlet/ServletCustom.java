package kr.co.ict.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletCustom
 */
@WebServlet("/custom")
public class ServletCustom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletCustom() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("/custom 최초 접속");
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		System.out.println("/custom 접속시 생성된 객체는 서버 종료로 인해 파기됩니다.");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	// get방식으로 해당 주소에 접속할 때마다 실행해주는 메서드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/custom 주소 접속 확인");
		// request.getParameter() 를 이용해
		// "jsp", "boot" 라는 이름으로 들어온 요소를 콘솔에 찍도록 아래 코드를 작성하고
		// 확인하는 방법은 ?jsp=값1&boot=값2 를 주소 뒤에 붙입니다.
		String jsp = request.getParameter("jsp");
		String boot = request.getParameter("boot");
		System.out.println(jsp);
		System.out.println(boot);
		// "jpa"라는 이름으로 들어온 요소를 콘솔에 찍도록 추가.
		String jpa = request.getParameter("jpa");
		System.out.println(jpa);
		// response.sendRedirect("http://localhost:8181/MyFirstWeb/servletForm/customResult.jsp");
		// 상단 변수를 전달하기 위해 forward를 대신 사용합니다.
		// 포워딩 하기 전 request에 setAttribute()를 이용해 데이터를 저장합니다.
		// request.setAttribute("보낼이름", 자료);
		request.setAttribute("jsp", jsp);
		request.setAttribute("boot", boot);
		request.setAttribute("jpa", jpa);
		// 목적지 주소는 localhost:포트번호/프로젝트명/이후경로
		RequestDispatcher dp = request.getRequestDispatcher(
				"/servletForm/customResult.jsp");
		dp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doPost는 현재까지 form에서 post방식으로 제출될 때 호출됩니다.
		request.setCharacterEncoding("utf-8");
		System.out.println("/custom 주소 post방식으로 접속함");
		String jsp = request.getParameter("jsp");
		String boot = request.getParameter("boot");
		String jpa = request.getParameter("jpa");
		System.out.println("post방식 : " + jsp + ", " + boot + ", " + jpa);
		// response.sendRedirect("http://localhost:8181/MyFirstWeb/servletForm/customResult.jsp");
		request.setAttribute("jsp", jsp);
		request.setAttribute("boot", boot);
		request.setAttribute("jpa", jpa);
		RequestDispatcher dp = request.getRequestDispatcher(
				"/servletForm/customPostResult.jsp");
		dp.forward(request, response);
	}

}
