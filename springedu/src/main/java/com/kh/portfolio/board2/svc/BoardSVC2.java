package com.kh.portfolio.board2.svc;
/*
 * 용병모집
 */

import java.util.List;
import java.util.Map;

import com.kh.portfolio.board.vo.BoardCategoryVO;
import com.kh.portfolio.board.vo.BoardVO;
import com.kh.portfolio.board2.vo.BoardVO2;
import com.kh.portfolio.board3.vo.BoardVO3;

public interface BoardSVC2 {
	//카테고리 읽어오기
		List<BoardCategoryVO> getCategory();
		
		//게시글작성
		int write(BoardVO2 boardVO2);
		
		//게시글보기
			Map<String,Object> view(String bnum);
			//게시글수정
			int modify(BoardVO2 boardVO2);

			//게시글삭제
			int delete(String bnum);
		
		//게시글목록
			//1)전체
			List<BoardVO2> list();
			//3)검색어 있는 게시글검색(요청페이지, 검색유형, 검색어)
			List<BoardVO2> list2(String searchType2,String keyword2);
}
















