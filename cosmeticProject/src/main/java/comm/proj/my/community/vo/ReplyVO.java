package comm.proj.my.community.vo;

public class ReplyVO {
	private int boNo;
	private int replyNo;
	private String memId;
	private String memNickname;
	private String profileImg;
	private String replyContent;
	private String replyDate;
	
	public int getBoNo() {
		return boNo;
	}
	public void setBoNo(int boNo) {
		this.boNo = boNo;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemNickname() {
		return memNickname;
	}
	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [boNo=" + boNo + ", replyNo=" + replyNo + ", memId=" + memId + ", memNickname=" + memNickname
				+ ", replyContent=" + replyContent + ", replyDate=" + replyDate + "]";
	}

	
}
