package comm.proj.my.member.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import comm.proj.my.cosmetic.vo.ReviewVO;
import comm.proj.my.member.service.MemberService;
import comm.proj.my.member.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	// 이미지 경로 지정
	@Value("#{util['file.upload.path']}")
	private String CURR_IMAGE_PATH;

	@Value("#{util['file.download.path']}")
	private String WEB_PATH;
	
	// 회원가입 화면
	@RequestMapping("/register")
	public String rank_main() {
		return "member/register";
	}
	
	@RequestMapping("/logoutDo")
	public String logout(HttpSession session) throws Exception {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 마이페이지 화면
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		MemberVO loginMember = (MemberVO) session.getAttribute("login");
		
//	    if (loginMember == null) {
//	    	model.addAttribute("nologin", "로그인이 필요한 서비스 입니다.");
//	    	return "home/home";
//	    }

	    if (loginMember == null) {
//	    	model.addAttribute("nologin", "로그인이 필요한 서비스 입니다.");
	    	return "redirect:/";
	    }
	    
	    String memId = loginMember.getMemId();
		
		// 본인이 작성한 리뷰 조회
		ArrayList<ReviewVO> reviewList = memberService.myReview(memId);
		model.addAttribute("reviewList", reviewList);
		
		return "member/mypage";
	}
	
	// 닉네임 중복 확인
	@PostMapping("/nicknameCheck")
	@ResponseBody
	public int nicknameCheck(@RequestParam("memNickname") String memNickname) {
		int check = memberService.nicknameCheck(memNickname);

		return check;
	}
	
	// 아이디 중복 확인
	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("memId") String memId) {
		int check = memberService.idCheck(memId);
		
		return check;
	}
	
	// 로그인 기능
	@RequestMapping("/loginDo")
	public String loginDo(MemberVO vo, boolean remember, HttpSession session, HttpServletResponse response, Model model) throws Exception {
		System.out.println(vo);
		MemberVO login = memberService.loginMember(vo);
		System.out.println("세션에 저장할 로그인 " + login);
		if (login ==  null) {
			model.addAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다.");
			return "home/home";
		}
		session.setAttribute("login", login);
		
		if (remember) {
			// 쿠키 생성
			Cookie cookie = new Cookie("rememberId", login.getMemId());
			response.addCookie(cookie);
		} else {
			// 쿠키 삭제
			// 동일한 key 값을 가지는 쿠키의 유효시간을 0으로
			Cookie cookie = new Cookie("rememberId", "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		return "redirect:/";
	}
	
	// 회원가입 기능
	@RequestMapping("/registDo")
	public String registDo(MemberVO vo, @RequestParam("uploadImage") MultipartFile uploadImage) {
		System.out.println(vo);
		
		try {
			memberService.registMember(vo, CURR_IMAGE_PATH, WEB_PATH, uploadImage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	
	// 업로드 된 이미지 마이페이지에 뜨게하기
	@RequestMapping("/download")
	public void download(String imageFileName, HttpServletResponse response) throws IOException {
		OutputStream out = response.getOutputStream();
		String downloadFile = CURR_IMAGE_PATH + "\\" + imageFileName;
		System.out.println(downloadFile);
		File file = new File(downloadFile);
		
		// 로컬에서 요청 파일을 찾아서 전달
		if (!file.exists()) {
	        // none.jpg를 로드
	        String noneImagePath = CURR_IMAGE_PATH + "\\none.jpg";
	        File noneFile = new File(noneImagePath);
	        response.setContentType("image/jpeg");
	        try (FileInputStream in = new FileInputStream(noneFile)) {
	            byte[] buffer = new byte[1024 * 8];
	            int count;
	            while ((count = in.read(buffer)) != -1) {
	                out.write(buffer, 0, count);  // none.jpg 파일을 응답으로 전송
	            }
	        }
		} else {
			// 한글 파일명을 URL 인코딩하여 처리
			String encodedFileName = URLEncoder.encode(imageFileName, "UTF-8").replaceAll("\\+", "%20");
			
			// 로컬에서 요청 파일을 찾아서 전달
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Content-Disposition", "attachment; fileName=" + encodedFileName);
			
			try (FileInputStream in = new FileInputStream(file)) {
				byte[] buffer = new byte[1024 * 8];
				while (true) {
					int count = in.read(buffer);
					if (count == -1) {
						break;
					}
					out.write(buffer, 0, count);  // 실시간 전송
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		out.close();
	}
	
	// 리뷰 수정
	@RequestMapping("/reviewUpdateDo")
	public String reviewUpdateDo(ReviewVO vo) {
		try {
			memberService.review_update(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mypage";
	}

	// 리뷰 수정 페이지 이동
	@RequestMapping("/reviewUpdate")
	public String reviewUpdate(Model model, ReviewVO vo) {
		
		try {
			vo = memberService.reviewUpdateInfo(vo);
			model.addAttribute("reList", vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "cosmetic/review_update";
	}
	
	// 리뷰 삭제
	@RequestMapping("/reviewDelete")
	public String reviewDelete(@RequestParam("reviewNo") String reviewNo) {
		try {
			memberService.reviewDelete(reviewNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/mypage";
	}
	
	// 수정부터 해야함 수정 할 때 이미지만이 아니라 전체 정보를 어떻게 가져와야 하는지 알아야함
	// 개인정보수정 아직 미완성
	@ResponseBody
	@PostMapping("/updateMember")
	public Map<String, Object> UpdateMember(Model model, MemberVO vo, HttpSession session, @RequestParam("uploadImage") MultipartFile uploadImage) throws Exception {
		vo = (MemberVO) session.getAttribute("login");
		String imgPath = memberService.UpdateMember(vo, CURR_IMAGE_PATH, WEB_PATH, uploadImage);
		
		Map<String, Object> map = new HashMap<>();
		map.put("message", "success");
		map.put("imagePath", imgPath);
		
		return map;
	}
}
