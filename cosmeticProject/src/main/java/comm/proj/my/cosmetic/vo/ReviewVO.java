package comm.proj.my.cosmetic.vo;

public class ReviewVO {
	private String reviewNo;
	private String goodComment;
	private String badComment;
	private double starScore;
	private String createDt;
	private String cosmeticNo;
	private String memId;
	private String memWriter;	// 작성자 닉네임(없으면 이름 뜨게 함)
	private String profileImg;
	private String name;
	private String companyName;
	private String cosImage;
	
	public String getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getGoodComment() {
		return goodComment;
	}
	public void setGoodComment(String goodComment) {
		this.goodComment = goodComment;
	}
	public String getBadComment() {
		return badComment;
	}
	public void setBadComment(String badComment) {
		this.badComment = badComment;
	}
	public double getStarScore() {
		return starScore;
	}
	public void setStarScore(double starScore) {
		this.starScore = starScore;
	}
	public String getCreateDt() {
		return createDt;
	}
	public void setCreateDt(String createDt) {
		this.createDt = createDt;
	}
	public String getCosmeticNo() {
		return cosmeticNo;
	}
	public void setCosmeticNo(String cosmeticNo) {
		this.cosmeticNo = cosmeticNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemWriter() {
		return memWriter;
	}
	public void setMemWriter(String memWriter) {
		this.memWriter = memWriter;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCosImage() {
		return cosImage;
	}
	public void setCosImage(String cosImage) {
		this.cosImage = cosImage;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", goodComment=" + goodComment + ", badComment=" + badComment
				+ ", starScore=" + starScore + ", createDt=" + createDt + ", cosmeticNo=" + cosmeticNo + ", memId="
				+ memId + ", memWriter=" + memWriter + ", profileImg=" + profileImg + "]";
	}
	
}
