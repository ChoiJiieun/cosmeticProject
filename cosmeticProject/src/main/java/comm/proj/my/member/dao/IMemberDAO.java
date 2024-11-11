package comm.proj.my.member.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import comm.proj.my.community.vo.PagingVO;
import comm.proj.my.cosmetic.vo.ReviewVO;
import comm.proj.my.member.vo.AddInfoVO;
import comm.proj.my.member.vo.FaceRecordVO;
import comm.proj.my.member.vo.MemberVO;
import comm.proj.my.member.vo.SeasonDetailVO;
import comm.proj.my.member.vo.SeasonInfoVO;
import comm.proj.my.member.vo.SeasonRecordVO;

@Mapper
public interface IMemberDAO {
	// 로그인
	public MemberVO loginMember(MemberVO vo);
	
	// 회원가입
	public int registMember(MemberVO vo);
	
	// 닉네임 중복확인
	public int nicknameCheck(String memNickname);
	
	// 아이디 중복확인
	public int idCheck(String memId);
	
	// 정보 수정
	public int UpdateMember(MemberVO vo);
	
	// 내가 작성한 리뷰 조회
	public ArrayList<ReviewVO> myReview(String memId);
	
	// 리뷰 수정
	public int review_update(ReviewVO vo);
	
	// 수정하려는 리뷰 조회
	public ReviewVO reviewUpdateInfo(ReviewVO vo);
	
	// 리뷰 삭제
	public int reviewDelete(String reviewNo);
	
	// 추가 정보 등록
	public int addInfoInsert(AddInfoVO vo);
	
	// 추가 정보 조회
	public AddInfoVO addInfoSelect(String memId);
	
	// 피부 기록 전체 건수 조회
	public int getTotalRowCount(String memId);
	
	// 피부 기록 조회
	public ArrayList<FaceRecordVO> faceRecordInfo(PagingVO vo);
	
	// 피부 기록
	public int faceRecordInsert(FaceRecordVO vo);
	
	// 피부 기록 상세 조회
	public FaceRecordVO faceRecordDetail(String reNo);
	
	// 피부 기록 수정
	public int faceRecordUpdate(FaceRecordVO vo);
	
	// 피부 기록 삭제
	public int faceRecordDelete(String recordNo);
	
	// 계절별 피부 기록 등록
	public void insertSeasonRecord(SeasonRecordVO seasonRecord);
	
	// 계절별 피부 기록 상세 등록
	public void insertSeasonDetail(SeasonDetailVO seasonDetail);
	
	// 계절별 피부 기록 조회
	public ArrayList<SeasonRecordVO> selectSeasonInfo(SeasonRecordVO seasonRecord);
	
	// 계절별 피부 기록 상세 조회
	public ArrayList<SeasonInfoVO> selectSeasonDetail(String seasonNo);
	
	// 계절별 피부 기록 수정시 화장품 삭제
	public int seasonCosDelete(SeasonDetailVO seasonDetail);
}
