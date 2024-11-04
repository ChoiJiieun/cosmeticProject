package comm.proj.my.rank.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import comm.proj.my.rank.vo.RankVO;

@Mapper
public interface IRankDAO {
	// 화장품 순위
	public ArrayList<RankVO> allRank(String cateCd);
	
	// 피부타입, 카테고리 별 랭킹 조회
	public ArrayList<RankVO> faceTypeRank(RankVO vo);
}
