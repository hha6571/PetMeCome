package member.model.service;


import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.MemberDAO;
import member.model.vo.Board;
import member.model.vo.Member;
import member.model.vo.Reply;

public class MemberService {

	public int checkedId(String inputId) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().checkedId(conn, inputId);
		
		close(conn);
		return result;
	}
	
	public int insertMember(Member member) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().insertMember(conn, member);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public Member loginMember(Member member) {
		Connection conn = getConnection();
		
		Member loginMember = new MemberDAO().loginMember(conn, member);
		
		
		close(conn);
		return loginMember;
	}

	public int deleteMember(String memberId) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().deleteMember(conn, memberId);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Member selectMyPage(String loginUserId) {
		Connection conn = getConnection();
		
		Member member = new MemberDAO().selectMyPage(conn, loginUserId);
		
		close(conn);
		return member;
	}

	public int updatePwd(String userId, String userPwd, String newPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().updatePwd(conn, userId, userPwd, newPwd);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int updateUserInfo(Member mem) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().updateUserInfo(conn, mem);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public ArrayList<Board> selectMyPost(String loginUserId) {
		Connection conn = getConnection();
		
		ArrayList<Board> list= new  MemberDAO().selectMyPost(conn, loginUserId);
		
		close(conn);
		return list;
	}

	public ArrayList<Reply> selectMyReply(String loginUserId) {
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new  MemberDAO().selectMyReply(conn, loginUserId);
		
		close(conn);
		return list;
	}

	public String findMemberId(String inputName, String inputEmail) {
		Connection conn = getConnection();
		
		String result = new MemberDAO().findMemberId(conn, inputName, inputEmail);
		
		close(conn);
		return result;
	}

	public int checkMember(String searchId, String searchName, String searchEmail) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().checkMember(conn, searchId, searchName, searchEmail);
		
		close(conn);
		return result;
	}

	public int sendTemPwd(String searchId, String encryptPwd) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().sendTemPwd(conn,searchId,  encryptPwd);
		
		if(result >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
}
