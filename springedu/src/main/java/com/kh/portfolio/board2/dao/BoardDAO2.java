package com.kh.portfolio.board2.dao;
/*
 * 용병모집
 */
import java.util.List;

import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board.vo.BoardFileVO;
import com.kh.portfolio.board.vo.BoardVO;
import com.kh.portfolio.board2.vo.BoardVO2;
import com.kh.portfolio.board3.vo.BoardVO3;

public interface BoardDAO2 {
	//카테고리 읽어오기
		List<BoardCategoryVO> getCategory();
		
		//게시글작성
		int write(BoardVO2 boardVO2);
		
		//게시글보기
		BoardVO2 view(String bnum);
		//게시글수정
		int modify(BoardVO2 boardVO2);

		//게시글삭제
		int delete(String bnum);
		
		//게시글목록
			//1)전체
			List<BoardVO2> list();
			
		//3)검색어 있는 게시글검색(전체,제목,내용,작성자ID,별칭)
		List<BoardVO2> list2(String searchType2,String keyword2);
}
