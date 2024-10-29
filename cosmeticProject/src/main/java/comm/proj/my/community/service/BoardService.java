package comm.proj.my.community.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import comm.proj.my.community.dao.IBoardDAO;
import comm.proj.my.community.vo.BoardVO;
import comm.proj.my.community.vo.CommVO;
import comm.proj.my.community.vo.PagingVO;
import comm.proj.my.community.vo.ReplyVO;

@Service
public class BoardService {
	
	@Autowired
	IBoardDAO dao;
	
	// 커뮤니티 카테고리 조회
	public ArrayList<CommVO> noticeCategory() {
		
		return dao.noticeCategory();
	}
	
	// 커뮤니티 글작성
	public int insertBoard(BoardVO vo) throws Exception {
		int result = dao.insertBoard(vo);
		
		if (result == 0) {
			throw new Exception();
		}
		
		return result;
	}
	
	//	게시판 전체 조회
	public ArrayList<BoardVO> getBoardList(PagingVO vo){
		// 전체 건수 조회
		int totalRowCount = dao.getTotalRowCount();
		vo.setTotalRowCount(totalRowCount);
		// 검색 조건으로 검색된 전체 건수를 기준으로 세팅!
		vo.pageSetting();  
		return dao.getBoardList(vo);
	}
	
	//게시글 상세 조회
	public BoardVO getBoard(int boNo) throws Exception {
		BoardVO board = dao.getBoard(boNo);
		
		if (board == null) {
			throw new Exception();
		}
		
		dao.increaseHit(boNo);
		
		return board;
	}
	
	// 게시글 수정
	public void updateBoard(BoardVO board) throws Exception {
		int result = dao.updateBoard(board);
		if (result == 0) {
			throw new Exception();
		}
	}
	
	// 게시글 삭제
	public void delBoard(int boNo) throws Exception {
		int result = dao.delBoard(boNo);
		if (result == 0) {
			throw new Exception();
		}
	}

	// 댓글 작성
	public int insertReply(ReplyVO vo) throws Exception {
		int result = dao.insertReply(vo);
		
		if (result == 0) {
			throw new Exception();
		}
		
		return result;
	}
	
	// 게시물 별 댓글 조회
	public ArrayList<ReplyVO> replyInfo(int boNo) {
		return dao.replyInfo(boNo);
	}
	
	// 작성한 댓글 조회
	public ReplyVO replySelect(String replyNo) {
		return dao.replySelect(replyNo);
	}
	
	// 댓글 삭제
	public void delReply(String replyNo) throws Exception {
		int result = dao.delReply(replyNo);
		if (result == 0) {
			throw new Exception();
		}
	}
	
	// 게시물 카테고리 조회
	public ArrayList<BoardVO> boardsCategory(String boCd) {
		return dao.boardsCategory(boCd);
	}
}
