package comm.proj.my.member.vo;

public class SeasonRecordVO {
    private String seasonNo;      // 날짜 포맷으로 생성된 season_no
    private String seasonName;    // 계절명
    private String routineTitle;  // 루틴명
    private String memId;         // 회원 ID
    private String useYn;         // 사용 여부
    
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
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	
	@Override
	public String toString() {
		return "SeasonRecordVO [seasonNo=" + seasonNo + ", seasonName=" + seasonName + ", routineTitle=" + routineTitle
				+ ", memId=" + memId + ", useYn=" + useYn + "]";
	}
    
}
