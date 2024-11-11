package comm.proj.my.cosmetic.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import comm.proj.my.cosmetic.vo.CosVO;
import comm.proj.my.cosmetic.vo.IngredientVO;
import comm.proj.my.cosmetic.vo.ReviewVO;

@Mapper
public interface ICosDAO {

	// 화장품 검색 3개
	public ArrayList<CosVO> searchCos(String keyword);
	
	// 화장품 검색어 조회
	public ArrayList<CosVO> searchInfo(String keyword);

	// 화장품 상세 조회
	public CosVO cosmetic_detail(int cosNo);
	
	// 화장품 리뷰 조회
	public ArrayList<ReviewVO> cosmetic_review(int cosNo);
	
	// 화장품 성분 조회
	public ArrayList<IngredientVO> ingre_info(int cosNo);
	
	// 화장품 리뷰 작성
	public int review_writeDo(ReviewVO vo);
	
}
