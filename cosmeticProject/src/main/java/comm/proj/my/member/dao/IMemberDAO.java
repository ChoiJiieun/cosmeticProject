package comm.proj.my.member.dao;

import org.apache.ibatis.annotations.Mapper;

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
}
