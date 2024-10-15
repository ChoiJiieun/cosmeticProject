package comm.proj.my.member.vo;

public class MemberVO {
	private String memId;
	private String memPw;
	private String memNm;
	private String memNickname;
	private int memAge;
	private String memGender;
	private String memBirth;
	private String profileImg;
	private String useYn;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public String getMemNickname() {
		return memNickname;
	}
	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}
	public int getMemAge() {
		return memAge;
	}
	public void setMemAge(int memAge) {
		this.memAge = memAge;
	}
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memNm=" + memNm + ", memNickname=" + memNickname
				+ ", memAge=" + memAge + ", memGender=" + memGender + ", profileImg=" + profileImg + ", useYn=" + useYn
				+ "]";
	}

}
