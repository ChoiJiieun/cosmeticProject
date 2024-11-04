package comm.proj.my.member.vo;

public class FaceRecordVO {
	private String recordNo;
	private String recordTitle;
	private String recordContent;
	private String memId;
	private String recordDate;
	
	public String getRecordNo() {
		return recordNo;
	}
	public void setRecordNo(String recordNo) {
		this.recordNo = recordNo;
	}
	public String getRecordTitle() {
		return recordTitle;
	}
	public void setRecordTitle(String recordTitle) {
		this.recordTitle = recordTitle;
	}
	public Object getRecordContent() {
		return recordContent;
	}
	public void setRecordContent(String recordContent) {
		this.recordContent = recordContent;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getRecordDate() {
		return recordDate;
	}
	public void setRecordDate(String recordDate) {
		this.recordDate = recordDate;
	}
	
	@Override
	public String toString() {
		return "FaceRecordVO [recordNo=" + recordNo + ", recordTitle=" + recordTitle + ", recordContent="
				+ recordContent + ", memId=" + memId + ", recordDate=" + recordDate + "]";
	}	
}
