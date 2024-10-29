package comm.proj.my.community.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import comm.proj.my.community.service.BoardService;
import comm.proj.my.community.vo.BoardVO;
import comm.proj.my.community.vo.CommVO;
import comm.proj.my.community.vo.PagingVO;
import comm.proj.my.community.vo.ReplyVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	// 이미지 경로 지정
	@Value("#{util['file.upload.path']}")
	private String CURR_IMAGE_PATH;

	@Value("#{util['file.download.path']}")
	private String WEB_PATH;
	
	// 게시물 작성 화면 이동
	@RequestMapping("/noticeWrite")
	public String notice_write(Model model) {
		ArrayList<CommVO> comm = boardService.noticeCategory();
		
		model.addAttribute("comm", comm);
		
		return "community/notice_write";
	}
	
	// 네이버 스마트 에디터 사진 넣기
	@RequestMapping("/multiImgUpload")
	public void multiImgUpload(HttpServletRequest req, HttpServletResponse res) {
		//저장 후 이미지 저장 정보 전달
		try {
			String sFileInfo ="";
			String fileName = req.getHeader("file-name");
			String prifix = fileName.substring(fileName.lastIndexOf(".") + 1);
			prifix = prifix.toLowerCase();
			String path = CURR_IMAGE_PATH;
			File file = new File(path);
			if(!file.exists()) {
				file.mkdir();
			}
			//서버에 저장될 파일 이름
			String realName = UUID.randomUUID().toString().replace("-", "") + "." +prifix;
				InputStream is = req.getInputStream();
			OutputStream os = new FileOutputStream(new File(path + "\\" + realName));
			int read = 0;
			byte b[] = new byte[1204];
			while((read = is.read(b))!= -1) {
				os.write(b,0,read);
			}
			if(is !=null) {
				is.close();
			}
			os.flush();
			os.close();
			//전달 정보
			sFileInfo +="&bNewLine=true";
			sFileInfo +="&sFileName=" + fileName;
			sFileInfo +="&sFileURL="+ WEB_PATH + realName ;
			PrintWriter print = res.getWriter();
			System.out.println(sFileInfo);
			print.print(sFileInfo);
			print.flush();
			print.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 게시물 작성
	@PostMapping("/boardWriteDo")
	public String insertBoard(BoardVO vo) {
		try {
			boardService.insertBoard(vo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/notice";
	}

	// 게시글 전체 조회
	@RequestMapping("/notice")
	public String freeList(Model model, @ModelAttribute("searchVO") PagingVO vo, @RequestParam(value = "cd", required = false) String boCd) {
		if (boCd == null || boCd.isEmpty()) {
			String all = "ALL";
			vo.setBoCd(all);
		} else {
			vo.setBoCd(boCd);
		}
		
		System.out.println("페이징 처리 출력 : " + vo);
		ArrayList<BoardVO> freeList = boardService.getBoardList(vo);
		model.addAttribute("freeList", freeList);
		
		return "community/notice";
	} 
	
	// 게시글 상세 조회
	@RequestMapping("/freeView")
	public String freeView(Model model, int boNo) {
		ArrayList<ReplyVO> replyList = boardService.replyInfo(boNo);
		model.addAttribute("reList", replyList);
		try {
			BoardVO board = boardService.getBoard(boNo);
			model.addAttribute("free", board);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "community/notice_form";
	}
	
	// 게시글 수정 화면
	@RequestMapping("/boardEditView")
	public String boardEditView(Model model, int boNo) {
		ArrayList<CommVO> comm = boardService.noticeCategory();
		
		model.addAttribute("comm", comm);
		
		try {
			BoardVO board = boardService.getBoard(boNo);
			model.addAttribute("free", board);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "community/notice_edit_form";
	}
	
	// 게시글 수정
	@RequestMapping("/boardEditDo")
	public String boardEditDo(BoardVO board) {
		try {
			boardService.updateBoard(board);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		return "redirect:/notice";
	}
	
	// 게시글 삭제
	@RequestMapping("/boardDelDo")
	public String boardDelDo(int boNo) {
		try {
			boardService.delBoard(boNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "redirect:/notice";
	}
	
	// 댓글 작성
	@ResponseBody
	@PostMapping("/writeReplyDo")
	public ReplyVO writeReplyDo(@RequestBody ReplyVO vo) {
		System.out.println("댓글 작성 vo : " + vo);
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
		String reNo = sdf.format(date);
		System.out.println("댓글 작성 replyNo : " + reNo);
		vo.setReplyNo(reNo);
		// 댓글 저장
		try {
			boardService.insertReply(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ReplyVO result = boardService.replySelect(reNo);
		return result;
	}
	
	// 댓글 삭제
	@ResponseBody
	@PostMapping("/delReplyDo")
	public String delReplyDo(@RequestBody ReplyVO vo) {
		String result = "success";
		try {
			boardService.delReply(vo.getReplyNo());
		} catch (Exception e) {
			e.printStackTrace();
			result = "fail";
		}
		
		return result;
	}
}
