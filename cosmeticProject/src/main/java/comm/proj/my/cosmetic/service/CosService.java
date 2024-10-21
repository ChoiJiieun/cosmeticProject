package comm.proj.my.cosmetic.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import comm.proj.my.cosmetic.dao.ICosDAO;
import comm.proj.my.cosmetic.vo.CosVO;

@Service
public class CosService {

	@Autowired
	ICosDAO dao;
	
	public ArrayList<CosVO> searchInfo(String keyword) {

		return dao.searchInfo(keyword);
	}
	
}
