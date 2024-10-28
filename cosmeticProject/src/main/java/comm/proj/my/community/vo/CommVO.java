package comm.proj.my.community.vo;

public class CommVO {
	
	private String cdId;
	private String cdName;
	
	public String getCdId() {
		return cdId;
	}
	public void setCdId(String cdId) {
		this.cdId = cdId;
	}
	public String getCdName() {
		return cdName;
	}
	public void setCdName(String cdName) {
		this.cdName = cdName;
	}
	
	@Override
	public String toString() {
		return "CommVO [cdId=" + cdId + ", cdName=" + cdName + "]";
	}
	
}
