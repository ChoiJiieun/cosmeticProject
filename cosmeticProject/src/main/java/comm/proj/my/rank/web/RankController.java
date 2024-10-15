package comm.proj.my.rank.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RankController {

	@RequestMapping("/rank")
	public String rank_main() {
		return "rank/rank";
	}
}
