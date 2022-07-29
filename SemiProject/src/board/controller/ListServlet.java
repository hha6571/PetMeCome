package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.PageInfo;

/**
 * Servlet implementation class AdoptServlet
 */
@WebServlet("/boardAdopt.bo")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징 처리가 들어가면 Service를 두 번 요청하기 때문에 래퍼런스 변수로 생성
				// - 게시글 전체 개수 가져올 때 :  페이징 처리 계산에 사용
				// - 게시글 가져올때
				BoardService service = new BoardService();
				
				int listCount;     // 게시물 총 개수
				int currentPage;   // 현재 페이지 표시
				int pageLimit;     // 한 페이지에 표시될 페이지 수
				int boardLimit;    // 한 페이지에 보일 게시글 최대 개수
				int maxPage;       // 전체 페이지 중 가장 마지막 페이지
				int startPage;     // 페이징 된 페이지 중 시작 페이지
				int endPage;       // 페이징 된 페이지 중 마지막 페이지 
				
				listCount = service.getListCount(); // 게시물 총 개수 가져오기 
				
				currentPage = 1;
				if(request.getParameter("currentPage") != null) {  // 내가 넘겨받은 currentPage가 있으면
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				}
				
				pageLimit = 10;
				boardLimit = 10;
				
				maxPage = (int)Math.ceil((double)listCount/boardLimit);
				
				startPage = (currentPage -1)/pageLimit * pageLimit + 1;
				
				endPage = startPage + pageLimit -1;
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
				PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
					
				ArrayList<Board> list = service.selectList(pi);
				
				String page = null;
				if(list != null) {
					page = "WEB-INF/views/board/boardAdoptList.jsp";
					request.setAttribute("list", list);
					request.setAttribute("pi", pi);
				} else {
					page = "WEB-INF/views/common/errorPage.jsp";
					request.setAttribute("msg", "게시판 조회에 실패하였습니다.");
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
