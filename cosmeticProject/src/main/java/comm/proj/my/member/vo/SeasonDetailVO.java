package comm.proj.my.member.vo;

public class SeasonDetailVO {
    private String seasonNo;      // season_record의 season_no 참조
    private String cosmeticNo;    // 화장품 번호
    private String dayRecord;     // 낮 사용 여부 ('Y' 또는 'N')
    private String nightRecord;   // 밤 사용 여부 ('Y' 또는 'N')
    
	public String getSeasonNo() {
		return seasonNo;
	}
	public void setSeasonNo(String seasonNo) {
		this.seasonNo = seasonNo;
	}
	public String getCosmeticNo() {
		return cosmeticNo;
	}
	public void setCosmeticNo(String cosmeticNo) {
		this.cosmeticNo = cosmeticNo;
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
	
	@Override
	public String toString() {
		return "SeasonDetailVO [seasonNo=" + seasonNo + ", cosmeticNo=" + cosmeticNo + ", dayRecord=" + dayRecord
				+ ", nightRecord=" + nightRecord + "]";
	}
	
}
