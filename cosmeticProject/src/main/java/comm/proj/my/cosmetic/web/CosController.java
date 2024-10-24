package comm.proj.my.cosmetic.web;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import comm.proj.my.cosmetic.service.CosService;
import comm.proj.my.cosmetic.vo.CosVO;
import comm.proj.my.cosmetic.vo.IngredientVO;
import comm.proj.my.cosmetic.vo.ReviewVO;

@Controller
public class CosController {
	
	@Autowired
	CosService cosService;
	
	// 검색 완료 후 화면
	@RequestMapping("/search")
	public String search_info(Model model, @RequestParam("query") String keyword) {
		ArrayList<CosVO> cosList = cosService.searchInfo(keyword);
		
		model.addAttribute("cosList", cosList);
		model.addAttribute("keyword", keyword);
		
		return "cosmetic/search_info";
	}
	
	// 화장품 상세 조회
	@RequestMapping("/products")
	public String cosmetic_detail(Model model, int cosNo) throws Exception {
		System.out.println("화장품 상세 조회 cosNo: " + cosNo);
		
		CosVO vo = cosService.cosmetic_detail(cosNo);
		model.addAttribute("cosInfo", vo);
		
		// 성분 조회
		ArrayList<IngredientVO> ingreList = cosService.ingre_info(cosNo);
		model.addAttribute("ingreInfo", ingreList);
		
		// 리뷰 조회
		ArrayList<ReviewVO> reList = cosService.cosmetic_review(cosNo);
		model.addAttribute("reviewInfo", reList);

		double totalScore = 0;
		int reviewCount = reList.size();
		
	    if (reviewCount > 0) {
	        for (ReviewVO review : reList) {
	            totalScore += review.getStarScore(); // 각 리뷰의 starScore를 합산
	        }

	        // 평균 계산 (평균은 총합 / 리뷰 개수)
	        double avgScore = totalScore / reviewCount;

	        // 평균 별점을 JSP에 넘겨주기
	        model.addAttribute("avgStarScore", avgScore);
	    } else {
	        // 리뷰가 없으면 평균을 0으로 설정
	        model.addAttribute("avgStarScore", 0);
	    }
	    
	    int allergy_count = 0;
	    
	    for (IngredientVO ingre : ingreList) {
	    	if (ingre.getAllergyYn().equals("Y")) {
	    		allergy_count++;
	    	}
	    }
	    
	    model.addAttribute("allergy_count", allergy_count);
	    
	    int totalReviews = reList.size();
	    
	    int count5 = 0;
	    int count4 = 0;
	    int count3 = 0;
	    int count2 = 0;
	    int count1 = 0;
	    
	    for (ReviewVO review : reList) {
	    	if (review.getStarScore() == 5.0) {
	    		count5++;
	    	} else if (review.getStarScore() == 4.0) {
	    		count4++;
	    	} else if (review.getStarScore() == 3.0) {
	    		count3++;
	    	} else if (review.getStarScore() == 2.0) {
	    		count2++;
	    	} else if (review.getStarScore() == 1.0) {
	    		count1++;
	    	}
	    }
	    
	    double rating5 = (count5 / (double) totalReviews) * 100;
	    double rating4 = (count4 / (double) totalReviews) * 100;
	    double rating3 = (count3 / (double) totalReviews) * 100;
	    double rating2 = (count2 / (double) totalReviews) * 100;
	    double rating1 = (count1 / (double) totalReviews) * 100;
	    
        model.addAttribute("rating5", rating5);
        model.addAttribute("rating4", rating4);
        model.addAttribute("rating3", rating3);
        model.addAttribute("rating2", rating2);
        model.addAttribute("rating1", rating1);

        model.addAttribute("count5", count5);
        model.addAttribute("count4", count4);
        model.addAttribute("count3", count3);
        model.addAttribute("count2", count2);
        model.addAttribute("count1", count1);
		
		return "cosmetic/cosmetic_detail";
	}

	// 리뷰 작성
	@RequestMapping("reviewWrite")
	public String review_write() {
		
		
		return "cosmetic/review_write";
	}
}
