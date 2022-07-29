package member.model.vo;

import java.sql.Date;

public class Reply {
	private int replyId;
	private String replyContent;
	private int replyBId;
	private String replyWriter;
	private Date createDate;
	private Date modifyDate;
	private String status;
	
	public Reply() {}

	public Reply(int replyId, String replyContent, int replyBId, String replyWriter, Date createDate, Date modifyDate,
			String status) {
		super();
		this.replyId = replyId;
		this.replyContent = replyContent;
		this.replyBId = replyBId;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public int getReplyBId() {
		return replyBId;
	}

	public void setReplyBId(int replyBId) {
		this.replyBId = replyBId;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
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
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Reply [replyId=" + replyId + ", replyContent=" + replyContent + ", replyBId=" + replyBId
				+ ", replyWriter=" + replyWriter + ", createDate=" + createDate + ", modifyDate=" + modifyDate
				+ ", status=" + status + "]";
	}
	
	
}
