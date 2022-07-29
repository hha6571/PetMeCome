package adopt.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import adopt.model.vo.Adopt;
import adopt.service.AdoptService;
import board.model.vo.Attachment;
import common.MyFileRenamePolicy;

/**
 * Servlet implementation class AdoptInfoServlet
 */
@WebServlet("/adoptInfo.ad")
public class SelectAdoptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAdoptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int petId = Integer.parseInt(request.getParameter("petId"));
		AdoptService service = new AdoptService();
		Adopt adopt = service.selectAdopt(petId);
		Attachment p = service.selectImage(petId);
		
		String page = null;
		if(adopt != null) {
			request.setAttribute("adopt", adopt);
			request.setAttribute("p", p);
			page = "WEB-INF/views/adopt/adoptInfo.jsp";
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "입양정보 조회에 실패했습니다.");
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
