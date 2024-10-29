package comm.proj.my.member.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import comm.proj.my.cosmetic.vo.ReviewVO;
import comm.proj.my.member.vo.AddInfoVO;
import comm.proj.my.member.vo.MemberVO;

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
}
