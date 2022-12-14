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
@WebServlet("/boardVol.bo")
public class ListServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListServlet3() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
				BoardService service = new BoardService();
				
				int listCount;     
				int currentPage;   
				int pageLimit;     
				int boardLimit;    
				int maxPage;       
				int startPage;    
				int endPage;       
				
				listCount = service.getListCount(); 
				
				currentPage = 1;
				if(request.getParameter("currentPage") != null) { 
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
					
				ArrayList<Board> list = service.selectList3(pi);
				
				String page = null;
				if(list != null) {
					page = "WEB-INF/views/board/boardVolList.jsp";
					request.setAttribute("list", list);
					request.setAttribute("pi", pi);
				} else {
					page = "WEB-INF/views/common/errorPage.jsp";
					request.setAttribute("msg", "????????? ????????? ?????????????????????.");
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
