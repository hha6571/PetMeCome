package review.model.vo;

import java.sql.Date;

public class Board {
	private int boardId;
	private int cateId;
	private String boardTitle;
	private String writer;
	private String boardContent;
	private int views;
	private Date createDate;
	private Date modifyDate;
	private String Status;
	
	public Board() {}

	public Board(int boardId, int cateId, String boardTitle, String writer, String boardContent, int views,
			Date createDate, Date modifyDate, String status) {
		super();
		this.boardId = boardId;
		this.cateId = cateId;
		this.boardTitle = boardTitle;
		this.writer = writer;
		this.boardContent = boardContent;
		this.views = views;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		Status = status;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public int getCateId() {
		return cateId;
	}

	public void setCateId(int cateId) {
		this.cateId = cateId;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	@Override
	public String toString() {
		return "Board [boardId=" + boardId + ", cateId=" + cateId + ", boardTitle=" + boardTitle + ", writer=" + writer
				+ ", boardContent=" + boardContent + ", views=" + views + ", createDate=" + createDate + ", modifyDate="
				+ modifyDate + ", Status=" + Status + "]";
	}
	
	
	
}
