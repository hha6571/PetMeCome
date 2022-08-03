package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import member.model.vo.Board;
import member.model.vo.Member;
import member.model.vo.Reply;

public class MemberDAO {
	
	
	private Properties prop = new Properties();
	
	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Member loginMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(rset.getString("MEMBER_ID"),
										rset.getString("MEMBER_PWD"),
										rset.getString("MEMBER_NAME"),
										rset.getString("EMAIL"),
										rset.getString("PHONE"),
										rset.getString("ADDRESS"),
										rset.getDate("ENROLL_DATE"),
										rset.getDate("MODIFY_DATE"),
										rset.getString("STATUS"),
										rset.getString("MANAGER_YN"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return loginUser;
	}

	public int deleteMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int checkedId(Connection conn, String inputId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("selectMemberId");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, inputId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public Member selectMyPage(Connection conn, String loginUserId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		
		String query = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUserId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member(rset.getString("MEMBER_ID"),
									rset.getString("MEMBER_PWD"),
									rset.getString("MEMBER_NAME"),
									rset.getString("EMAIL"),
									rset.getString("PHONE"),
									rset.getString("ADDRESS"),
									rset.getDate("ENROLL_DATE"),
									rset.getDate("MODIFY_DATE"),
									rset.getString("STATUS"),
									rset.getString("MANAGER_YN"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public int updatePwd(Connection conn, String userId, String userPwd, String newPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}


	public int updateUserInfo(Connection conn, Member mem) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, mem.getMemberName());
			pstmt.setString(2, mem.getEmail());
			pstmt.setString(3, mem.getPhone());
			pstmt.setString(4, mem.getAddress());
			pstmt.setString(5, mem.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Board> selectMyPost(Connection conn, String loginUserId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list =  new ArrayList<>();
		
		String query = prop.getProperty("selectMyPost");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUserId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_ID"),
							rset.getString("BOARD_TITLE"),
							rset.getString("BOARD_CONTENT"),
							rset.getInt("VIEWS"),
							rset.getDate("CREATE_DATE"),
							rset.getDate("MODIFY_DATE"),
							rset.getString("STATUS"),
							rset.getString("WRITER"),
							rset.getInt("CATE_ID")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Reply> selectMyReply(Connection conn, String loginUserId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reply> list =null;
		
		String query = prop.getProperty("selectMyReply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginUserId);
			rset = pstmt.executeQuery();
			
			list= new ArrayList<Reply>();
			
			while(rset.next()) {
				list.add( new Reply(rset.getInt("REPLY_ID"),
								rset.getString("REPLY_CONTENT"),
								rset.getInt("REPLY_BID"),
								rset.getString("REPLY_WRITER"),
								rset.getDate("CREATE_DATE"),
								rset.getDate("MODIFY_DATE"),
								rset.getString("STATUS")));
				
			}
			System.out.println("DAO" + list);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
	}

	public String findMemberId(Connection conn, String inputName, String inputEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String result = null;
		
		String query = prop.getProperty("findMemberId");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, inputName);
			pstmt.setString(2, inputEmail);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getString("MEMBER_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int checkMember(Connection conn, String searchId, String searchName, String searchEmail) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("checkMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchId);
			pstmt.setString(2, searchName);
			pstmt.setString(3, searchEmail);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int sendTemPwd(Connection conn, String searchId ,String encryptPwd ) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("sendTemPwd");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, encryptPwd);
			pstmt.setString(2, searchId);
			
			System.out.println(encryptPwd);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

}
