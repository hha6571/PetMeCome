package adopt.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adopt.model.vo.Adopt;

/**
 * Servlet implementation class UpdateAdoptFormServlet
 */
@WebServlet("/updateForm.ad")
public class UpdateAdoptFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdoptFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int petId = Integer.parseInt(request.getParameter("petId"));
		String petName = request.getParameter("petName");
		int petAge = Integer.parseInt(request.getParameter("petAge"));
		String petGender = request.getParameter("petGender");
		String petKind = request.getParameter("petKind");
		String neutral = request.getParameter("neutral");
		String inoculated = request.getParameter("inoculated");
		String petStatus = request.getParameter("petStatus");
		
		Adopt adoptInfo = new Adopt(petId, petName, petAge, petGender, petKind, neutral, inoculated, petStatus, null);
		
		request.setAttribute("adoptInfo", adoptInfo);
		request.getRequestDispatcher("WEB-INF/views/adopt/adoptUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
