package comm.proj.my.community.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import comm.proj.my.community.vo.BoardVO;
import comm.proj.my.community.vo.CommVO;
import comm.proj.my.community.vo.PagingVO;
import comm.proj.my.community.vo.ReplyVO;

@Mapper
public interface IBoardDAO {
	
	// 커뮤니티 카테고리 조회
	public ArrayList<CommVO> noticeCategory();
	
	// 커뮤니티 글작성
	public int insertBoard(BoardVO vo);
	
	// 전체 건수 
	public int getTotalRowCount();
	
	// 자유게시판 조회
	public ArrayList<BoardVO> getBoardList(PagingVO vo);

	// 게시물 검색 전체 수
	public int searchRowCount(String keyword);
	
	// 게시물 검색 조회
	public ArrayList<BoardVO> searchBoard(PagingVO vo);
	
	// 게시글 상세 조회
	public BoardVO getBoard(int boNo);
	
	// 게시글 조회수 		
	public int increaseHit(int boNo);
	
	// 게시글 수정
	public int updateBoard(BoardVO board);

	// 게시글 삭제
	public int delBoard(int boNo);
	
	// 댓글 작성
	public int insertReply(ReplyVO vo);
	
	// 게시물 별 댓글 조회
	public ArrayList<ReplyVO> replyInfo(int boNo);

	// 작성한 댓글 조회
	public ReplyVO replySelect(String replyNo);
	
	// 댓글 삭제
	public int delReply(String replyNo);
	
	// 게시물 카테고리 조회
	public ArrayList<BoardVO> boardsCategory(String boCd);

}
