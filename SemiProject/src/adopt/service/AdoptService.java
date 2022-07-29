package adopt.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import adopt.model.dao.AdoptDAO;
import adopt.model.vo.Adopt;
import adopt.model.vo.AdoptPageInfo;
import board.model.vo.Attachment;

public class AdoptService {

	public int getListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new AdoptDAO().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList selectAList(AdoptPageInfo api) {
		
		Connection conn = getConnection();
		
		AdoptDAO dao = new AdoptDAO();
		ArrayList list = null;
		list = dao.selectAList(conn, api);
		
		close(conn);
		
		return list;
	}

	public ArrayList selectPList(AdoptPageInfo api) {
		
		Connection conn = getConnection();
		
		AdoptDAO dao = new AdoptDAO();
		ArrayList list = null;
		list = dao.selectPList(conn, api);
		
		close(conn);
		
		return list;
	}
	
	public Adopt selectAdopt(int petId) {
		
		Connection conn = getConnection();
		
		Adopt adopt = new AdoptDAO().selectAdopt(conn, petId);
		
		close(conn);

		return adopt;
	}

	public Attachment selectImage(int petId) {
		
		Connection conn = getConnection();
		
		Attachment image = new AdoptDAO().selectImage(conn, petId);
		
		close(conn);
		
		return image;
	}

	public int insertAdopt(Adopt a, ArrayList<Attachment> image) {
		
		Connection conn = getConnection();
		
		AdoptDAO dao = new AdoptDAO();
		
		int resultA = dao.insertAdopt(conn, a);
		int resultP = dao.insertImage(conn, image);
		
		close(conn);
		
		return resultA + resultP;
	}

	public int updateAdopt(Adopt a, ArrayList<Attachment> image) {
		
		Connection conn = getConnection();
		
		AdoptDAO dao = new AdoptDAO();
		
		int resultA = dao.updateAdopt(conn, a);
		int resultP = dao.updateImage(conn, image);
		
		close(conn);
		
		return resultA + resultP;
	}

	public int deleteAdopt(int petId) {
		
		Connection conn = getConnection();
		
		AdoptDAO dao = new AdoptDAO();
		
		int resultA = dao.deleteAdopt(conn, petId);
		int resultP = dao.deleteImage(conn, petId);
		
		close(conn);
		
		return resultA + resultP;
	}


	
	
	
}
