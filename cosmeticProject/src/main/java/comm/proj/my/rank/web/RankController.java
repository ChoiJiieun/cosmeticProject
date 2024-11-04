package comm.proj.my.rank.web;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import comm.proj.my.rank.service.RankService;
import comm.proj.my.rank.vo.RankVO;

@Controller
public class RankController {
	
	@Autowired
	RankService rankService;

	@RequestMapping(value= {"/rank", "/"})
	public String rank_main(Model model, @RequestParam(value = "cd", required = false) String cateCd) {
		ArrayList<RankVO> cosRank = rankService.allRank(cateCd);
		model.addAttribute("cosRank", cosRank);
		return "rank/rank";
	}
	
	@RequestMapping("/rank/dry")
	public String dry_rank(Model model, @RequestParam(value = "cd", required = false) String cateCd, RankVO vo) {
		if (cateCd == null || cateCd.isEmpty()) {
			String all = "ALL";
			vo.setCategoryCd(all);
		} else {
			vo.setCategoryCd(cateCd);		
		}
		
		vo.setFaceType("건성");
		
		System.out.println(vo);
		
		ArrayList<RankVO> dryRank = rankService.faceTypeRank(vo);
		model.addAttribute("dryRank", dryRank);
		
		return "rank/rank_dry";
	}

	@RequestMapping("/rank/oil")
	public String oil_rank(Model model, @RequestParam(value = "cd", required = false) String cateCd, RankVO vo) {
		if (cateCd == null || cateCd.isEmpty()) {
			String all = "ALL";
			vo.setCategoryCd(all);
		} else {
			vo.setCategoryCd(cateCd);		
		}
		
		vo.setFaceType("지성");
		
		System.out.println(vo);
		
		ArrayList<RankVO> dryRank = rankService.faceTypeRank(vo);
		model.addAttribute("dryRank", dryRank);
		
		return "rank/rank_oil";
	}

	@RequestMapping("/rank/combine")
	public String combine_rank(Model model, @RequestParam(value = "cd", required = false) String cateCd, RankVO vo) {
		if (cateCd == null || cateCd.isEmpty()) {
			String all = "ALL";
			vo.setCategoryCd(all);
		} else {
			vo.setCategoryCd(cateCd);		
		}
		
		vo.setFaceType("복합성");
		
		System.out.println(vo);
		
		ArrayList<RankVO> dryRank = rankService.faceTypeRank(vo);
		model.addAttribute("dryRank", dryRank);
		
		return "rank/rank_combine";
	}

	@RequestMapping("/rank/dryoil")
	public String dryoil_rank(Model model, @RequestParam(value = "cd", required = false) String cateCd, RankVO vo) {
		if (cateCd == null || cateCd.isEmpty()) {
			String all = "ALL";
			vo.setCategoryCd(all);
		} else {
			vo.setCategoryCd(cateCd);		
		}
		
		vo.setFaceType("수부지");
		
		System.out.println(vo);
		
		ArrayList<RankVO> dryRank = rankService.faceTypeRank(vo);
		model.addAttribute("dryRank", dryRank);
		
		return "rank/rank_dryoil";
	}

	@RequestMapping("/rank/sensitive")
	public String sensitive_rank(Model model, @RequestParam(value = "cd", required = false) String cateCd, RankVO vo) {
		if (cateCd == null || cateCd.isEmpty()) {
			String all = "ALL";
			vo.setCategoryCd(all);
		} else {
			vo.setCategoryCd(cateCd);		
		}
		
		vo.setFaceType("민감성");
		
		System.out.println(vo);
		
		ArrayList<RankVO> dryRank = rankService.faceTypeRank(vo);
		model.addAttribute("dryRank", dryRank);
		
		return "rank/rank_sensitive";
	}

	@RequestMapping("/rank/pimple")
	public String pimple_rank(Model model, @RequestParam(value = "cd", required = false) String cateCd, RankVO vo) {
		if (cateCd == null || cateCd.isEmpty()) {
			String all = "ALL";
			vo.setCategoryCd(all);
		} else {
			vo.setCategoryCd(cateCd);		
		}
		
		vo.setFaceType("여드름");
		
		System.out.println(vo);
		
		ArrayList<RankVO> dryRank = rankService.faceTypeRank(vo);
		model.addAttribute("dryRank", dryRank);
		
		return "rank/rank_pimple";
	}
}
