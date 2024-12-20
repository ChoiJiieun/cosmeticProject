package comm.proj.my.rank.vo;

public class RankVO {
	private int rank;
	private String cosmeticNo;
	private String name;
	private String cateCd;
	private String companyName;
	private String cosImage;
	private String starScore;
	private String reviewCount;
	private String cateNm;
	
	// 입력 받는 값
	private String faceType;
	private String categoryCd;
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getCosmeticNo() {
		return cosmeticNo;
	}
	public void setCosmeticNo(String cosmeticNo) {
		this.cosmeticNo = cosmeticNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCateCd() {
		return cateCd;
	}
	public void setCateCd(String cateCd) {
		this.cateCd = cateCd;
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
	public String getStarScore() {
		return starScore;
	}
	public void setStarScore(String starScore) {
		this.starScore = starScore;
	}
	public String getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(String reviewCount) {
		this.reviewCount = reviewCount;
	}
	public String getFaceType() {
		return faceType;
	}
	public void setFaceType(String faceType) {
		this.faceType = faceType;
	}
	public String getCategoryCd() {
		return categoryCd;
	}
	public void setCategoryCd(String categoryCd) {
		this.categoryCd = categoryCd;
	}
	public String getCateNm() {
		return cateNm;
	}
	public void setCateNm(String cateNm) {
		this.cateNm = cateNm;
	}
	
	@Override
	public String toString() {
		return "RankVO [rank=" + rank + ", cosmeticNo=" + cosmeticNo + ", name=" + name + ", cateCd=" + cateCd
				+ ", companyName=" + companyName + ", cosImage=" + cosImage + ", starScore=" + starScore
				+ ", reviewCount=" + reviewCount + ", faceType=" + faceType + ", categoryCd=" + categoryCd + "]";
	}
	
}
