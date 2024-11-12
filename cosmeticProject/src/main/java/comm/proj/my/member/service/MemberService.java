package comm.proj.my.member.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import comm.proj.my.community.vo.PagingVO;
import comm.proj.my.cosmetic.vo.ReviewVO;
import comm.proj.my.member.dao.IMemberDAO;
import comm.proj.my.member.vo.AddInfoVO;
import comm.proj.my.member.vo.FaceRecordVO;
import comm.proj.my.member.vo.MemberVO;
import comm.proj.my.member.vo.SeasonDetailVO;
import comm.proj.my.member.vo.SeasonInfoVO;
import comm.proj.my.member.vo.SeasonRecordVO;
import comm.proj.my.rank.vo.RankVO;

@Service
public class MemberService {
	
	@Autowired
	IMemberDAO dao;
	
	// 로그인
	public MemberVO loginMember(MemberVO vo) {
		MemberVO user = dao.loginMember(vo);
		
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

	// 내가 작성한 리뷰 조회
	public ArrayList<ReviewVO> myReview(String memId) {
		return dao.myReview(memId);
	}
	
	// 리뷰 수정
	public int review_update(ReviewVO vo) throws Exception {
		int result = dao.review_update(vo);
		
		if (result == 0) {
			throw new Exception();
		}
		
		return result;
	}
	
	// 수정하려는 리뷰 조회
	public ReviewVO reviewUpdateInfo(ReviewVO vo) throws Exception {
		ReviewVO result = dao.reviewUpdateInfo(vo);
		
		if (result == null) {
			throw new Exception();
		}
		
		return result;
	}
	
	// 리뷰 삭제
	public int reviewDelete(String reviewNo) throws Exception {
		int result = dao.reviewDelete(reviewNo);
		
		if (result == 0) {
			throw new Exception();
		}
		
		return result;
	}

	// 추가 정보 등록
	public int addInfoInsert(AddInfoVO vo) throws Exception {
		int result = dao.addInfoInsert(vo);
		
		if (result == 0) {
			throw new Exception();
		}
		
		return result;
	}
	
	// 추가 정보 조회
	public AddInfoVO addInfoSelect(String memId) throws Exception {
		AddInfoVO result = dao.addInfoSelect(memId);
		
		if (result == null) {
			throw new Exception();
		}
		
		return result;
	}
	
	// 피부 기록 조회
	public ArrayList<FaceRecordVO> faceRecordInfo(PagingVO vo) {
		// 전체 건수 조회
		String boCd = vo.getBoCd();
		int totalRowCount = dao.getTotalRowCount(boCd);
		vo.setTotalRowCount(totalRowCount);
		vo.pageSetting();
		return dao.faceRecordInfo(vo);
	}
	
	// 피부 기록
	public int faceRecordInsert(FaceRecordVO vo) throws Exception {
		int result = dao.faceRecordInsert(vo);
		
		if (result == 0) {
			throw new Exception();
		}
		
		return result;
	}
	
	// 피부 기록 상세 조회
	public FaceRecordVO faceRecordDetail(String reNo) throws Exception {
		FaceRecordVO result = dao.faceRecordDetail(reNo);
		
		if (result == null) {
			throw new Exception();
		}
		
		return result;
	}
	
	// 피부 기록 수정
	public int faceRecordUpdate(FaceRecordVO vo) throws Exception {
		int result = dao.faceRecordUpdate(vo);
		if (result == 0) {
			throw new Exception();
		}
		return result;
	}
	
	// 피부 기록 삭제
	public int faceRecordDelete(String recordNo) throws Exception {
		int result = dao.faceRecordDelete(recordNo);
		if (result == 0) {
			throw new Exception();
		}
		return result;
	}
	
	// 계절별 피부 기록 등록
	@Transactional
	public void saveRoutine(SeasonRecordVO seasonRecord, List<SeasonDetailVO> seasonDetails) {
		dao.insertSeasonRecord(seasonRecord);
		
		for (SeasonDetailVO detail : seasonDetails) {
			dao.insertSeasonDetail(detail);
		}
	}
	
	// 계절별 피부 기록 수정 detail
	public void seasonUpdateDo(List<SeasonDetailVO> seasonDetails) throws Exception {
		for (SeasonDetailVO detail : seasonDetails) {
			dao.seasonUpdateDo(detail);
		}
	}
	
	// 계절별 피부 기록 수정 record
	public int seRecordUpdateDo(SeasonRecordVO vo) throws Exception {
		int result = dao.seRecordUpdateDo(vo);
		if (result == 0) {
			throw new Exception();
		}
		return result;
	}
	
	// 계절별 피부 기록 수정시 화장품 등록
	public void seasonCos(SeasonDetailVO vo) {
		dao.insertSeasonDetail(vo);
	}
	
	// 계절별 피부 기록 조회
	public ArrayList<SeasonRecordVO> selectSeasonInfo(SeasonRecordVO seasonRecord) {
		return dao.selectSeasonInfo(seasonRecord);
	}
	
	// 계절별 피부 기록 상세 조회
	public ArrayList<SeasonInfoVO> selectSeasonDetail(String seasonNo) {
		return dao.selectSeasonDetail(seasonNo);
	}
	
	// 계절별 피부 기록 수정시 화장품 삭제
	public int seasonCosDelete(SeasonDetailVO seasonDetail) throws Exception {
		int result = dao.seasonCosDelete(seasonDetail);
		if (result == 0) {
			throw new Exception();
		}
		return result;
	}
	
	// 계절벌 피부 기록 삭제 (use_yn을 N으로)
	public int seasonRecordDelete(String seasonNo) throws Exception {
		int result = dao.seasonRecordDelete(seasonNo);
		if (result == 0) {
			throw new Exception();
		}
		return result;
	}
	
	// 카테고리 선택시 보여줄 화장품 정보
	public ArrayList<RankVO> select_cos(String cateCd) {
		return dao.select_cos(cateCd);
	}
}
