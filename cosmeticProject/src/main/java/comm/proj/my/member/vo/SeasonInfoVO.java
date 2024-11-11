package comm.proj.my.member.vo;

public class SeasonInfoVO {
	private String seasonNo;
	private String seasonName;
	private String routineTitle;
	private String name;
	private String cosImage;
	private String cosmeticNo;
	private String companyName;
	private String dayRecord;
	private String nightRecord;
	
	public String getSeasonNo() {
		return seasonNo;
	}
	public void setSeasonNo(String seasonNo) {
		this.seasonNo = seasonNo;
	}
	public String getSeasonName() {
		return seasonName;
	}
	public void setSeasonName(String seasonName) {
		this.seasonName = seasonName;
	}
	public String getRoutineTitle() {
		return routineTitle;
	}
	public void setRoutineTitle(String routineTitle) {
		this.routineTitle = routineTitle;
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
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getDayRecord() {
		return dayRecord;
	}
	public void setDayRecord(String dayRecord) {
		this.dayRecord = dayRecord;
	}
	public String getNightRecord() {
		return nightRecord;
	}
	public void setNightRecord(String nightRecord) {
		this.nightRecord = nightRecord;
	}
	public String getCosmeticNo() {
		return cosmeticNo;
	}
	public void setCosmeticNo(String cosmeticNo) {
		this.cosmeticNo = cosmeticNo;
	}
	
	@Override
	public String toString() {
		return "SeasonInfoVO [seasonNo=" + seasonNo + ", seasonName=" + seasonName + ", routineTitle=" + routineTitle
				+ ", name=" + name + ", cosImage=" + cosImage + ", companyName=" + companyName + ", dayRecord="
				+ dayRecord + ", nightRecord=" + nightRecord + "]";
	}
	
}

