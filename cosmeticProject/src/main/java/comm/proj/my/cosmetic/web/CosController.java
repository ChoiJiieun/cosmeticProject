package comm.proj.my.cosmetic.web;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import comm.proj.my.cosmetic.service.CosService;
import comm.proj.my.cosmetic.vo.CosVO;

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
}
