package comm.proj.my.cosmetic.vo;

public class IngredientVO {
	private String nameKor;
	private String nameEng;
	private String explain;
	private String ewgRank;
	private String cosmeticNo;
	
	public String getNameKor() {
		return nameKor;
	}
	public void setNameKor(String nameKor) {
		this.nameKor = nameKor;
	}
	public String getNameEng() {
		return nameEng;
	}
	public void setNameEng(String nameEng) {
		this.nameEng = nameEng;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public String getEwgRank() {
		return ewgRank;
	}
	public void setEwgRank(String ewgRank) {
		this.ewgRank = ewgRank;
	}
	public String getCosmeticNo() {
		return cosmeticNo;
	}
	public void setCosmeticNo(String cosmeticNo) {
		this.cosmeticNo = cosmeticNo;
	}
	
	@Override
	public String toString() {
		return "IngredientVO [nameKor=" + nameKor + ", nameEng=" + nameEng + ", explain=" + explain + ", ewgRank="
				+ ewgRank + ", cosmeticNo=" + cosmeticNo + "]";
	}
	
	
}
