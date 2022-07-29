package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDAO;
import board.model.vo.Board;
import board.model.vo.PageInfo;




public class BoardService {

	public int getListCount() {
		Connection conn = getConnection();
		
		int listCount = new BoardDAO().getListCount(conn);
		
		
		close(conn);
		
		return listCount;
		
			
		
	}
	
	
	


	public ArrayList<Board> selectList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Board> selectList2(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().selectList2(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public ArrayList<Board> selectList3(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDAO().selectList3(conn, pi);
		
		close(conn);
		
		return list;
	}

	public int insertBoard(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().insertBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int insertBoard2(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().insertBoard2(conn, b);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	public int insertBoard3(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().insertBoard3(conn, b);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}


	public Board selectBoard(int bId) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().updateCount(conn, bId);
		Board board = null; 
		if(result > 0) {
			board = new BoardDAO().selectBoard(conn, bId);
			if(board != null) {
				commit(conn);
		} else {
			rollback(conn);
		}
	} else {
			rollback(conn);
	}
		
		close(conn);		
		
		return board;
	}
	
	

	public int updateBoard(Board board) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().updateBoard(conn, board);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteBoard(int bId) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().deleteBoard(conn, bId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}








	
		
	
	
	
}

