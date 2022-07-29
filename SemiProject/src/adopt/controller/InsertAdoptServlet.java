package adopt.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import adopt.model.vo.Adopt;
import adopt.service.AdoptService;
import board.model.vo.Attachment;
import common.MyFileRenamePolicy;

/**
 * Servlet implementation class InsertAdoptServlet
 */
@WebServlet("/insert.ad")
public class InsertAdoptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAdoptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "adopt_images/";
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			String petName = multiRequest.getParameter("petName");
			int petAge = Integer.parseInt(multiRequest.getParameter("petAge"));
			String gender = multiRequest.getParameter("gender");
			String petKind = multiRequest.getParameter("petKind");
			String neutral = multiRequest.getParameter("neutral");
			String inoculated = multiRequest.getParameter("inoculated");
			String petStatus = multiRequest.getParameter("petStatus");
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			String name = files.nextElement();
			if(multiRequest.getFilesystemName(name) != null) {
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
			}
			
			Adopt a = new Adopt();
			a.setPetName(petName);
			a.setPetAge(petAge);
			a.setPetGender(gender);
			a.setPetKind(petKind);
			a.setNeutral(neutral);
			a.setInoculated(inoculated);
			a.setPetStatus(petStatus);
			
			ArrayList<Attachment> image = new ArrayList<>();
			for(int i=originFiles.size()-1; i>=0; i--) {
				Attachment p = new Attachment();
				p.setFilePath(savePath);
				p.setOriginName(originFiles.get(i));
				p.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size()-1) {
					p.setFileLevel(0);
				} else {
					p.setFileLevel(1);
				}
				
				image.add(p);
			}
			
			int result = new AdoptService().insertAdopt(a, image);
			
			if(result == image.size()+1) {
				response.sendRedirect("list.ad");
			} else {
				request.setAttribute("msg", "입양현황 등록에 실패했습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
				
				for(int i=0; i<saveFiles.size(); i++) {
					File failFile = new File(savePath + saveFiles.get(i));
					failFile.delete();
				}
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
