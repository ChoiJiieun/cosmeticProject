package comm.proj.my.cosmetic.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import comm.proj.my.cosmetic.dao.ICosDAO;
import comm.proj.my.cosmetic.vo.CosVO;
import comm.proj.my.cosmetic.vo.IngredientVO;
import comm.proj.my.cosmetic.vo.ReviewVO;

@Service
public class CosService {

	@Autowired
	ICosDAO dao;
	
	// 검색어 조회
	public ArrayList<CosVO> searchInfo(String keyword) {

		return dao.searchInfo(keyword);
	}
	
	// 화장품 상세 조회
	public CosVO cosmetic_detail(int cosNo) throws Exception {
		CosVO result = dao.cosmetic_detail(cosNo);
		
		if (result == null) {
			throw new Exception();
		}
		
		return result;
	}
	
	// 화장품 리뷰 조회
	public ArrayList<ReviewVO> cosmetic_review(int cosNo) throws Exception {
		
		return dao.cosmetic_review(cosNo);
	}
	
	// 화장품 성분 조회
	public ArrayList<IngredientVO> ingre_info(int cosNo) throws Exception {
		
		return dao.ingre_info(cosNo);
	}
	
	// 화장품 리뷰 작성
	public int review_writeDo(ReviewVO vo) throws Exception {
		int result = dao.review_writeDo(vo);
		
		if (result == 0) {
			throw new Exception();
		}
		
		return result;
	}
	
}
