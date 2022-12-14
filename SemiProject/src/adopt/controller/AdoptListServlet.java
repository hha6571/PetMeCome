package adopt.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adopt.model.vo.Adopt;
import adopt.model.vo.AdoptPageInfo;
import adopt.service.AdoptService;
import board.model.vo.Attachment;
import member.model.vo.Member;
/**
 * Servlet implementation class AdoptListServlet
 */
@WebServlet("/list.ad")
public class AdoptListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdoptListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdoptService service = new AdoptService();
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = service.getListCount(); // 게시글 수 조회
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 5;
		boardLimit = 9;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit + 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		AdoptPageInfo api= new AdoptPageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Adopt> aList = service.selectAList(api); // 게시글
		ArrayList<Attachment> pList = service.selectPList(api); // 사진
		String page = null;
		if(aList != null && pList != null) {
			page = "WEB-INF/views/adopt/adopt.jsp";
			request.setAttribute("aList", aList);
			request.setAttribute("pList", pList);
			request.setAttribute("api", api);
			
			
		
			
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
