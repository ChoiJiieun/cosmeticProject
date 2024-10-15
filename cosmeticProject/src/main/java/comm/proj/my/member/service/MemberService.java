package comm.proj.my.member.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import comm.proj.my.member.dao.IMemberDAO;
import comm.proj.my.member.vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	IMemberDAO dao;
	
	public MemberVO loginMember(MemberVO vo) throws Exception {
		MemberVO user = dao.loginMember(vo);
		
		if (user == null) {
			throw new Exception();
		}
		
		return user;
	}
	
	public String registMember(MemberVO vo, MultipartFile file) throws Exception {
		// 파일명 생성
		String origin = file.getOriginalFilename();
		String unique = UUID.randomUUID().toString() + "_" + origin;
		String dbPath = unique;
		Path filePath = Paths.get(unique);
		
		// 물리적으로 저장
		try {
			Files.copy(file.getInputStream(), filePath);
		} catch (IOException e) {
			throw new Exception("file to save file", e);
		}
		
		// db 저장
		vo.setProfileImg(dbPath);
		int result = dao.registMember(vo);
		if (result == 0) {
			throw new Exception();
		}
		return dbPath;
	}
	
	public int nicknameCheck(String memNickname) {
		int user = dao.nicknameCheck(memNickname);
		System.out.println("닉네임 중복확인 " + user);
		return user;
	}

	public int idCheck(String memId) {
		int user = dao.idCheck(memId);
		System.out.println("아이디 중복확인 " + user);
		return user;
	}
}
