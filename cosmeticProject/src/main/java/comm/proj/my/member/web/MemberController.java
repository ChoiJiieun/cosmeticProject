package comm.proj.my.member.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	// 마이페이지 화면
	@RequestMapping("/mypage")
	public String mypage() {
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
	public String loginDo(MemberVO vo, boolean remember, HttpSession session, HttpServletResponse response) throws Exception {
		System.out.println(vo);
		MemberVO login = memberService.loginMember(vo);
		System.out.println("세션에 저장할 로그인 " + login);
		if (login ==  null) {
			return "redirect:/";
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
			response.sendError(HttpServletResponse.SC_NOT_FOUND, "file not found");
		}
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
		} finally {
			out.close();
		}
	}
	// 수정부터 해야함 수정 할 때 이미지만이 아니라 전체 정보를 어떻게 가져와야 하는지 알아야함
//	@ResponseBody
//	@PostMapping("/files/upload")
//	public Map<String, Object> uploadFiles(MemberVO vo, HttpSession session, @RequestParam("uploadImage") MultipartFile uploadImage) {
//		MemberVO vo = (MemberVO) session.getAttribute("login");
//		String imgPath = memberService.UpdateMember(vo, CURR_IMAGE_PATH, WEB_PATH, uploadImage);
//		
//		Map<String, Object> map = new HashMap<>();
//		map.
//	}
	
}
