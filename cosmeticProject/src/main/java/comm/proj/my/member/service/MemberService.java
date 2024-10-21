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
	
	// 로그인
	public MemberVO loginMember(MemberVO vo) throws Exception {
		MemberVO user = dao.loginMember(vo);
		
		if (user == null) {
			throw new Exception();
		}
		
		return user;
	}
	
	// 회원가입
	public String registMember(MemberVO vo, String uploadDir, String webPath, MultipartFile file) throws Exception {
		// 파일명 생성
		String origin = file.getOriginalFilename();
		
		System.out.println("프로필  origin  " + origin);  // 프로필 이미지 없으면 아예 공백
		
		String unique;
		String dbPath = null;
		Path filePath;

		if (origin == "") {
			
		} else {
			unique = UUID.randomUUID().toString() + "_" + origin;
			dbPath = webPath + unique;
			filePath = Paths.get(uploadDir, unique);
			// 물리적으로 저장
			try {
				Files.copy(file.getInputStream(), filePath);
			} catch (IOException e) {
				throw new Exception("file to save file", e);
			}
		}
		
		// db 저장
		vo.setProfileImg(dbPath);
		int result = dao.registMember(vo);
		if (result == 0) {
			throw new Exception();
		}
		
		return dbPath;
	}
	
	// 정보수정
	public String UpdateMember(MemberVO vo, String uploadDir, String webPath, MultipartFile file) throws Exception {
		// 파일명 생성
		String origin = file.getOriginalFilename();
		
		System.out.println("변경된 프로필  origin  " + origin);  // 프로필 이미지 없으면 아예 공백
		
		String unique;
		String dbPath = null;
		Path filePath;
		
		if (origin == "") {
			
		} else {
			unique = UUID.randomUUID().toString() + "_" + origin;
			dbPath = webPath + unique;
			filePath = Paths.get(uploadDir, unique);
			// 물리적으로 저장
			try {
				Files.copy(file.getInputStream(), filePath);
			} catch (IOException e) {
				throw new Exception("file to save file", e);
			}
		}
		
		// db 저장
		vo.setProfileImg(dbPath);
		int result = dao.UpdateMember(vo);
		if (result == 0) {
			throw new Exception();
		}
		
		return dbPath;
	}
	
	// 닉네임 중복확인
	public int nicknameCheck(String memNickname) {
		int user = dao.nicknameCheck(memNickname);
		System.out.println("닉네임 중복확인 " + user);
		return user;
	}

	// 아이디 중복 확인
	public int idCheck(String memId) {
		int user = dao.idCheck(memId);
		System.out.println("아이디 중복확인 " + user);
		return user;
	}
}
