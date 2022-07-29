package review.controller;

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

import review.model.service.BoardService;
import review.model.vo.Attachment;
import review.model.vo.Board;
import common.MyFileRenamePolicy;

/**
 * Servlet implementation class UpdateBoardServlet
 */
@WebServlet("/update.th")
public class UpdateThumbnailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateThumbnailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024*1024*10; // 10Mbyte
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "thumbnail_uploadFiles/";
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());

			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames(); 
			while (files.hasMoreElements()) {
				String name = files.nextElement();
				if (multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}
			}
			
			int bId = Integer.parseInt(request.getParameter("bId"));
			Board b = new Board();
			b.setBoardId(bId);
			b.setBoardContent(content);
			b.setBoardTitle(title);
			
			ArrayList<Attachment> fileList = new ArrayList<>();
			for (int i = originFiles.size() - 1; i >= 0; i--) {	
				Attachment a = new Attachment();
				a.setFilePath(savePath);
				a.setOriginName(originFiles.get(i));
				a.setChangeName(saveFiles.get(i));
				a.setBoardId(bId);
				
				if (i == originFiles.size() - 1) {
					a.setFileLevel(0);
				} else {
					a.setFileLevel(1);
				}
				
				fileList.add(a);
			}
			
			int result = new BoardService().updateThumbnail(b);
			
			if(result == fileList.size() + 1) {
				response.sendRedirect("list.th");
			} else {
				request.setAttribute("msg", "게시글 수정에 실패하였습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
				
				for (int i = 0; i < saveFiles.size(); i++) {
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
