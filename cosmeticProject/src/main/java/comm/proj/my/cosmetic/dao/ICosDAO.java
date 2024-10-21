package comm.proj.my.cosmetic.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import comm.proj.my.cosmetic.vo.CosVO;

@Mapper
public interface ICosDAO {

	// 검색어 조회
	public ArrayList<CosVO> searchInfo(String keyword);
}
