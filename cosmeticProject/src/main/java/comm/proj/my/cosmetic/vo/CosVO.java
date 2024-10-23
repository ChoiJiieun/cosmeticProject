package comm.proj.my.cosmetic.vo;

public class CosVO {
	private String cosmeticNo;
	private String name;
	private String cosImage;
	private String cateCd;
	private String companyName;
	private String companyLogo;
	private String starScore;
	private String reviewCount;
	
	public String getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(String reviewCount) {
		this.reviewCount = reviewCount;
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
	
	public String getCosImage() {
		return cosImage;
	}
	
	public void setCosImage(String cosImage) {
		this.cosImage = cosImage;
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
	
	public String getCompanyLogo() {
		return companyLogo;
	}
	
	public void setCompanyLogo(String companyLogo) {
		this.companyLogo = companyLogo;
	}

	@Override
	public String toString() {
		return "CosVO [cosmeticNo=" + cosmeticNo + ", name=" + name + ", cosImage=" + cosImage + ", cateCd=" + cateCd
				+ ", companyName=" + companyName + ", companyLogo=" + companyLogo + "]";
	}

	public String getStarScore() {
		return starScore;
	}

	public void setStarScore(String starScore) {
		this.starScore = starScore;
	}
	
}
