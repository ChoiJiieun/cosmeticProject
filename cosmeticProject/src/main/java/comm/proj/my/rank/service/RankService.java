package comm.proj.my.rank.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import comm.proj.my.rank.dao.IRankDAO;
import comm.proj.my.rank.vo.RankVO;

@Service
public class RankService {
	
	@Autowired
	IRankDAO dao;
	
	// 화장품 순위
	public ArrayList<RankVO> allRank(String cateCd) {
		return dao.allRank(cateCd);
	}
}
