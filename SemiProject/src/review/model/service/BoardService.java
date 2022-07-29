package review.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import review.model.dao.BoardDAO;
import review.model.vo.Attachment;
import review.model.vo.Board;
import review.model.vo.PageInfo;

public class BoardService {

	public ArrayList selectFList(int i) {
		Connection conn = getConnection();
		
		BoardDAO dao = new BoardDAO();
		ArrayList list = null;
		if (i == 1) {
			list = dao.selectBList(conn);
		} else {
			list = dao.selectFList(conn);
		}
		
		close(conn);
		
		return list;
	}

	public int insertFile(Board b, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		BoardDAO dao = new BoardDAO();
		
		int result1 = dao.insertBoard(conn, b);
		int result2 = dao.insertFile(conn, fileList);
		
		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result1+result2;
	}

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

	public ArrayList<Attachment> selectFiles(int bId) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> list = new BoardDAO().selectFiles(conn, bId);
		
		close(conn);
		
		return list;
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

	public int updateThumbnail(Board b) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().updateBoard(conn, b);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
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

}
