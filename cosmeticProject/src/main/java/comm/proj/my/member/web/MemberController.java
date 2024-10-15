package comm.proj.my.member.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@RequestMapping("/register")
	public String rank_main() {
		return "member/register";
	}

	@RequestMapping("/mypage")
	public String mypage() {
		return "member/mypage";
	}

	@PostMapping("/nicknameCheck")
	@ResponseBody
	public int nicknameCheck(@RequestParam("memNickname") String memNickname) {
		int check = memberService.nicknameCheck(memNickname);

		return check;
	}

	@PostMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("memId") String memId) {
		int check = memberService.idCheck(memId);
		
		return check;
	}
	
	@RequestMapping("/loginDo")
	public String loginDo(MemberVO vo, boolean remember, HttpSession session, HttpServletResponse response) throws Exception {
		System.out.println(vo);
		MemberVO login = memberService.loginMember(vo);
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
	
	@RequestMapping("/registDo")
	public String registDo(MemberVO vo, @RequestParam("uploadImage") MultipartFile uploadImage) {
		System.out.println(vo);
		
		try {
			memberService.registMember(vo, uploadImage);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
	}
	
}
