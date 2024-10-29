package comm.proj.my.member.vo;

public class AddInfoVO {
	private String memAge;
	private String faceType;
	private String addType1;
	private String addType2;
	private String memId;
	
	public String getFaceType() {
		return faceType;
	}
	public void setFaceType(String faceType) {
		this.faceType = faceType;
	}
	public String getAddType1() {
		return addType1;
	}
	public void setAddType1(String addType1) {
		this.addType1 = addType1;
	}
	public String getAddType2() {
		return addType2;
	}
	public void setAddType2(String addType2) {
		this.addType2 = addType2;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemAge() {
		return memAge;
	}
	public void setMemAge(String memAge) {
		this.memAge = memAge;
	}
	
	@Override
	public String toString() {
		return "AddInfo [faceType=" + faceType + ", addType1=" + addType1 + ", addType2=" + addType2 + ", memId="
				+ memId + "]";
	}
	
}
