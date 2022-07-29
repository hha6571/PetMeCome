package adopt.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import adopt.model.vo.Adopt;
import adopt.model.vo.AdoptPageInfo;
import board.model.vo.Attachment;

public class AdoptDAO {

	private Properties prop = new Properties();
	
	public AdoptDAO() {
		String fileName = AdoptDAO.class.getResource("/sql/adopt/adopt-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getListCount"); 
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
				
		return result;
	}
	
	public ArrayList<Adopt> selectAList(Connection conn, AdoptPageInfo api) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Adopt> aList = new ArrayList<>();
		
		String query = prop.getProperty("selectAList");
		
		int startRow = (api.getCurrentPage() -1) * api.getBoardLimit();
		int endRow = startRow + api.getBoardLimit() -1;
		

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				aList.add(new Adopt(
									rset.getInt("PET_ID"),
									rset.getString("PET_NAME"),
									rset.getInt("PET_AGE"),
									rset.getString("PET_GENDER"),
									rset.getString("PET_KIND"),
									rset.getString("NEUTRAL"),
									rset.getString("INOCULATED"),
									rset.getString("PET_STATUS"),
									rset.getString("STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return aList;
	}
	
	public ArrayList selectPList(Connection conn, AdoptPageInfo api) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> pList = null;
		
		String query = prop.getProperty("selectPList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			pList = new ArrayList<Attachment>();
			while(rset.next()) {
				Attachment p = new Attachment();
				p.setFileId(rset.getInt("FILE_ID"));
				p.setBoardId(rset.getInt("BOARD_ID"));
				p.setOriginName(rset.getString("ORIGIN_NAME"));
				p.setChangeName(rset.getString("CHANGE_NAME"));
				p.setFilePath(rset.getString("FILE_PATH"));
				p.setUploadDate(rset.getDate("UPLOAD_DATE"));
				p.setFileLevel(rset.getInt("FILE_LEVEL"));
				p.setStatus(rset.getString("STATUS"));
				
				pList.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
	
		return pList;
	}

	public Adopt selectAdopt(Connection conn, int petId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Adopt a = null;
		
		String query = prop.getProperty("selectAdopt");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, petId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				a = new Adopt(
								rset.getInt("PET_ID"),
								rset.getString("PET_NAME"),
								rset.getInt("PET_AGE"),
								rset.getString("PET_GENDER"),
								rset.getString("PET_KIND"),
								rset.getString("NEUTRAL"),
								rset.getString("INOCULATED"),
								rset.getString("PET_STATUS"),
								rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return a;
	}
	
	public Attachment selectImage(Connection conn, int petId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Attachment image = null;
		
		String query = prop.getProperty("selectImage");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, petId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
			image = new Attachment();
			image.setFileId(rset.getInt("FILE_ID"));
			image.setBoardId(rset.getInt("BOARD_ID"));
			image.setOriginName(rset.getString("ORIGIN_NAME"));
			image.setChangeName(rset.getString("CHANGE_NAME"));
			image.setFilePath(rset.getString("FILE_PATH"));
			image.setUploadDate(rset.getDate("UPLOAD_DATE"));
			image.setFileLevel(rset.getInt("FILE_LEVEL"));
			image.setStatus(rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return image;
	}

	public int insertAdopt(Connection conn, Adopt a) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAdopt");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, a.getPetName());
			pstmt.setInt(2, a.getPetAge());
			pstmt.setString(3, a.getPetGender());
			pstmt.setString(4, a.getPetKind());
			pstmt.setString(5, a.getNeutral());
			pstmt.setString(6, a.getInoculated());
			pstmt.setString(7, a.getPetStatus());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int insertImage(Connection conn, ArrayList<Attachment> image) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertImage");
		
		try {
			for(int i=0; i<image.size(); i++) {
				Attachment p = image.get(i);
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, p.getOriginName());
				pstmt.setString(2, p.getChangeName());
				pstmt.setString(3, p.getFilePath());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateAdopt(Connection conn, Adopt a) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAdopt");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, a.getPetName());
			pstmt.setInt(2, a.getPetAge());
			pstmt.setString(3, a.getPetGender());
			pstmt.setString(4, a.getPetKind());
			pstmt.setString(5, a.getNeutral());
			pstmt.setString(6, a.getInoculated());
			pstmt.setString(7, a.getPetStatus());
			pstmt.setInt(8,  a.getPetId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateImage(Connection conn, ArrayList<Attachment> image) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateImage");
		
		try {
			for(int i=0; i<image.size(); i++) {
				Attachment p = image.get(i);
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, p.getOriginName());
				pstmt.setString(2, p.getChangeName());
				pstmt.setString(3, p.getFilePath());
				pstmt.setInt(4, p.getFileLevel());
				pstmt.setInt(5, p.getBoardId());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteAdopt(Connection conn, int petId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteAdopt");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, petId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteImage(Connection conn, int petId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteAdopt");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, petId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
