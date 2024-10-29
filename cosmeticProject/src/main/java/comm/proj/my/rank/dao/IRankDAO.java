package comm.proj.my.rank.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import comm.proj.my.rank.vo.RankVO;

@Mapper
public interface IRankDAO {
	// 화장품 순위
	public ArrayList<RankVO> allRank(String cateCd);
}
