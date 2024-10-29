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
//		String cd;
//		if (cateCd == null || cateCd.isEmpty()) {
//			cd = "ALL";
//		} else {
//			cd = cateCd;
//		}
		
		ArrayList<RankVO> cosRank = rankService.allRank(cateCd);
		model.addAttribute("cosRank", cosRank);
		return "rank/rank";
	}
}
