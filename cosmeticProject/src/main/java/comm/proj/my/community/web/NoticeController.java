package comm.proj.my.community.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeController {
	
	@RequestMapping("/notice")
	public String rank_main() {
		return "community/notice";
	}

}
