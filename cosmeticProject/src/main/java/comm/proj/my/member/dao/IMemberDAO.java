package comm.proj.my.member.dao;

import org.apache.ibatis.annotations.Mapper;

import comm.proj.my.member.vo.MemberVO;

@Mapper
public interface IMemberDAO {
	// 로그인
	public MemberVO loginMember(MemberVO vo);
	// 회원가입
	public int registMember(MemberVO vo);
}
