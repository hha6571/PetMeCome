package member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Board;
import member.model.vo.Member;

/**
 * Servlet implementation class UserPostFormServlet
 */
@WebServlet("/userPostForm.pm")
public class UserPostFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserPostFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String loginUserId = ((Member)(request.getSession().getAttribute("loginUser"))).getMemberId();
		
		ArrayList<Board> list = new MemberService().selectMyPost(loginUserId);

		
		String page = null;
		if(list != null) {
			page ="WEB-INF/views/member/userPostPage.jsp";
			request.setAttribute("list", list);
		}else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("error", "작성글 조회에 실패하였습니다.");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
