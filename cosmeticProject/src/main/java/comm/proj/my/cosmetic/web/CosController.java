package comm.proj.my.cosmetic.web;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import comm.proj.my.community.service.BoardService;
import comm.proj.my.community.vo.BoardVO;
import comm.proj.my.community.vo.PagingVO;
import comm.proj.my.cosmetic.service.CosService;
import comm.proj.my.cosmetic.vo.CosVO;
import comm.proj.my.cosmetic.vo.IngredientVO;
import comm.proj.my.cosmetic.vo.ReviewVO;
import comm.proj.my.member.vo.AddInfoVO;

@Controller
public class CosController {
	
	@Autowired
	CosService cosService;

	@Autowired
	BoardService boService;
	
	// 검색 완료 후 화면
//	@RequestMapping("/search")
//	public String search_info_all(Model model, @RequestParam("query") String keyword, @ModelAttribute("searchVO") PagingVO vo) {
//		
//		// 화장품 검색 조회
//		ArrayList<CosVO> cosList = cosService.searchCos(keyword);
//		ArrayList<CosVO> cosallList = cosService.searchInfo(keyword);
//		
//		int cosSize = cosallList.size();
//		
//		// 게시판 검색 조회
//		ArrayList<BoardVO> boList = boService.searchBoard(vo);
//		System.out.println("이거 boList: "+boList);
//		
//		for (BoardVO board : boList) {
//			System.out.println("이거 boNo: "+board.getBoNo());
//		}
//		
//		model.addAttribute("keyword", keyword);
//
//		model.addAttribute("cosList", cosList);
//		model.addAttribute("cosSize", cosSize);
//		
//		model.addAttribute("boList", boList);
//		
//		return "home/search_info";
//	}

	// 화장품 검색 완료 후 화면
	@RequestMapping("/search")
	public String search_info(Model model, @RequestParam("query") String keyword) {
		ArrayList<CosVO> cosList = cosService.searchInfo(keyword);
		int cosSize = cosList.size();
		
		model.addAttribute("cosList", cosList);
		model.addAttribute("cosSize", cosSize);
		model.addAttribute("keyword", keyword);
		
		return "cosmetic/search_cos";
	}

	// 루틴에서 화장품 조회
	@ResponseBody
	@RequestMapping("/routine_search")
	public ArrayList<CosVO> search_info_routine(String keyword) {
		ArrayList<CosVO> cosList = cosService.searchInfo(keyword);

		return cosList;
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
	        double n = totalScore / reviewCount;
	        double avgScore = Math.round(n*100)/100.0;

	        // 평균 별점을 JSP에 넘겨주기
	        model.addAttribute("avgStarScore", avgScore);
	    } else {
	        // 리뷰가 없으면 평균을 0으로 설정
	        model.addAttribute("avgStarScore", 0.0);
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

	// 리뷰 작성 화면으로 이동
	@RequestMapping("/reviewWrite")
	public String review_write(@RequestParam("companyName") String companyName
							 , @RequestParam("productName") String productName
							 , @RequestParam("cosmeticNo") String cosmeticNo
							 , @RequestParam("imagePath") String imagePath
							 , Model model) {
		
		System.out.println("회사 이름 : " + companyName);
		System.out.println("제품 이름 : " + productName);
		System.out.println("제품 ID : " + cosmeticNo);
		System.out.println("이미지 경로 : " + imagePath);
		
		model.addAttribute("companyName", companyName);
		model.addAttribute("productName", productName);
		model.addAttribute("cosmeticNo", cosmeticNo);
		model.addAttribute("imagePath", imagePath);
		
		return "cosmetic/review_write";
	}
	
	// 리뷰 작성
	@RequestMapping("/reviewWriteDo")
	public String review_writeDo(ReviewVO vo, @RequestParam("cosmeticNo") String cosmeticNo) {
		
		System.out.println("리뷰 작성 vo : " + vo);
		
		try {
			cosService.review_writeDo(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/products?cosNo=" + cosmeticNo;
	}
}
